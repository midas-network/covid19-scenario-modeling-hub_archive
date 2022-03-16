library(covid19SMHvalidation)
library(gh)

# check if submissions file
pr_files <- gh::gh(paste0("GET /repos/", 
                          "midas-network/covid19-scenario-modeling-hub/", "pulls/",
                          Sys.getenv("GH_PR_NUMBER"),"/files"))
pr_files <- purrr::map(pr_files, "filename")
pr_sub_files <- grep(
  "data-processed/.*/\\d{4}-\\d{2}-\\d{2}_.+-.+(.csv|.zip|.gz)", pr_files,
  value = TRUE)

# Run validation on file corresponding to the submission file format
if (length(pr_sub_files > 0)) {
  lst_gs <- suppressWarnings(pull_gs_data())
  test <- lapply(pr_sub_files, function(x)
    capture.output(try(validate_submission(x, lst_gs = lst_gs))))
}  else {
  test <-  paste0("No projection submission file in the standard SMH file ",
                  "format found in the Pull-Request. No validation was run.")
}

# Post results as comment on the open PR
message <- purrr::map(test, paste, collapse = "\n")

lapply(length(message), function(x) {
  gh::gh(paste0("POST /repos/", "midas-network/covid19-scenario-modeling-hub/", 
                "issues/", Sys.getenv("GH_PR_NUMBER"),"/comments"),
         body = message[[x]])
})


# Visualization
message_plot <- paste0(
  "If the submission contains a projection file, a pdf containing the ",
  "visualization plots of the submission is available and downloadable ",
  "in the GitHub actions. Please click on 'details' on the right of the ",
  "'Validate submission' checks. The pdf is available in a ZIP file as ",
  "an artifact of the GH Actions. For more information, please see ",
  "[here](https://docs.github.com/en/actions/managing-workflow-runs/downloading-workflow-artifacts)")

if (length(pr_sub_files > 0)) {
  lapply(pr_sub_files, function(x) {
    # Prepare path if necessary
    if (!(dir.exists(paste0(getwd(), "/proj_plot"))))
      dir.create(paste0(getwd(), "/proj_plot"))
    # Generate PDF
    generate_validation_plots(
      path_proj = x, lst_gs = lst_gs,
      save_path = paste0(getwd(), "/proj_plot"),
      y_sqrt = FALSE, plot_quantiles = c(0.025, 0.975))
    # Post message
    gh::gh(paste0("POST /repos/", "midas-network/covid19-scenario-modeling-hub/", 
                "issues/", Sys.getenv("GH_PR_NUMBER"),"/comments"),
         body = message_plot)

    })
}

# Validate or stop the github actions

if (any(grepl("\U000274c Error", test))) {
  stop("The submission contains one or multiple issues")
} else if (any(grepl("Warning", test))) {
  warning(" The submission is accepted but contains some warnings")
}