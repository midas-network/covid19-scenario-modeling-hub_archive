library(covid19SMHvalidation)
library(gh)

# check if submissions file
pr_files <- gh::gh(paste0("GET /repos/", 
                          "midas-network/covid19-scenario-modeling-hub/", "pulls/",
                          Sys.getenv("GH_PR_NUMBER"),"/files"))

pr_files_name <- purrr::map(pr_files, "filename")
pr_sub_files <- grep(
  "data-processed/.*/\\d{4}-\\d{2}-\\d{2}.+-.+(.csv|.zip|.gz)", pr_files_name,
  value = TRUE)

# Run validation on file corresponding to the submission file format
if (length(pr_sub_files) > 0) {  
  # prepare observe data
  lst_gs <- suppressWarnings(pull_gs_data())
  # select submission files
  pr_sub_files_lst <- pr_files[purrr::map(pr_files, "filename") %in% pr_sub_files]
  # Prepare viz path if necessary
  if (!(dir.exists(paste0(getwd(), "/proj_plot"))))
    dir.create(paste0(getwd(), "/proj_plot"))
  # run validation and visualization
  test_tot <- lapply(seq_len(length(pr_sub_files_lst)), function(x) {
    url_link <- URLdecode(pr_sub_files_lst[[x]]$raw_url)
    if (grepl(".zip$|.gz$", url_link)) {
      # download file
      download.file(url_link, basename(url_link))
      # generate visualization pdf
      test_viz <- try(generate_validation_plots(path_proj = basename(url_link), lst_gs = lst_gs, 
        save_path = paste0(getwd(), "/proj_plot"), y_sqrt = FALSE, plot_quantiles = c(0.025, 0.975)))
      # run validation
      test <- capture.output(try(validate_submission(basename(url_link), lst_gs = lst_gs)))
    }
    if (grepl(".csv$", url_link)) {
      # generate visualization pdf
      test_viz <- try(generate_validation_plots(path_proj = url_link, lst_gs = lst_gs, 
        save_path = paste0(getwd(), "/proj_plot"), y_sqrt = FALSE, plot_quantiles = c(0.025, 0.975)))
      # run validation
      test <- capture.output(try(validate_submission(url_link, lst_gs = lst_gs)))
    }
    # Remove visualization pdf if viz has an error
    if (class(test_viz) == "try-error") 
      file.remove(dir(paste0(getwd(), "/proj_plot"), full.names = TRUE))
    # list of the viz and validation results
    test_tot <- list(valid = test, viz = test_viz)
    # returns all output
    return(test_tot)
   })
}  else {
  test_tot <-  list(list(
    valid = paste0(
      "No projection submission file in the standard SMH file ",
      "format found in the Pull-Request. No validation was run."),
    viz = NA
  ))
}

# Post validation results as comment on the open PR
test_valid <- purrr::map(test_tot, "valid")
message <- purrr::map(test_valid, paste, collapse = "\n")

lapply(seq_len(length(message)), function(x) {
  gh::gh(paste0("POST /repos/", "midas-network/covid19-scenario-modeling-hub/", 
                "issues/", Sys.getenv("GH_PR_NUMBER"),"/comments"),
         body = message[[x]],
         .token = Sys.getenv("GH_TOKEN"))
})

# Post visualization results as comment on the open PR
test_viz <- purrr::map(test_tot, "viz")
if (any(!is.na(test_viz))) {
  message_plot <- paste0(
    "If the submission contains a projection file, a pdf containing the ",
    "visualization plots of the submission is available and downloadable ",
    "in the GitHub actions. Please click on 'details' on the right of the ",
    "'Validate submission' checks. The pdf is available in a ZIP file as ",
    "an artifact of the GH Actions. For more information, please see ",
    "[here](https://docs.github.com/en/actions/managing-workflow-runs/downloading-workflow-artifacts)")

  if (any(unlist(purrr::map(test_viz, class)) == "try-error")) {
    message_plot <- paste0(message_plot, "\n\n",
      "The visualization encounters an issue and might not be available,",
      " if the validation does not return any error, please feel free to ",
      "tag `@LucieContamin` for any question.")
  }

  gh::gh(paste0("POST /repos/", "midas-network/covid19-scenario-modeling-hub/", 
                "issues/", Sys.getenv("GH_PR_NUMBER"),"/comments"),
         body = message_plot,
         .token = Sys.getenv("GH_TOKEN"))
}

# Validate or stop the github actions
if (any(grepl("\U000274c Error", test_valid))) {
  stop("The submission contains one or multiple issues")
} else if (any(grepl("Warning", test_valid))) {
  warning(" The submission is accepted but contains some warnings")
}
