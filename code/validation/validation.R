library(SMHvalidation)
library(gh)

# check if submissions file
pr_files <- gh::gh(paste0("GET /repos/",
                          "midas-network/megaround-scenariohub/", "pulls/",
                          Sys.getenv("GH_PR_NUMBER"),"/files"))

pr_files_name <- purrr::map(pr_files, "filename")
pr_sub_files <- grep(
  "data-processed/.*/\\d{4}-\\d{2}-\\d{2}-.+(.pqt|.parquet)",
  pr_files_name, value = TRUE)
pop_path <- "data-locations/locations.csv"
js_def_file <- "hub-config/tasks.json"
lst_gs <- NULL

# Run validation on file corresponding to the submission file format
if (length(pr_sub_files) > 0) {
  team_name <- unique(basename(dirname(pr_sub_files)))
  sub_file_date <- unique(stringr::str_extract(basename(pr_sub_files),
                                               "\\d{4}-\\d{2}-\\d{2}"))
  group_files <- paste0(sub_file_date, "-", team_name)
  test_tot <- lapply(group_files, function(y) {
    # select submission files
    pr_sub_files_group <- grep(y, pr_sub_files, value = TRUE)
    pr_sub_files_lst <- pr_files[purrr::map(pr_files, "filename") %in%
                                   pr_sub_files_group]
    # run validation on all files
    test_tot <- lapply(seq_len(length(pr_sub_files_lst)), function(x) {
      # submission file
      url_link <- URLdecode(pr_sub_files_lst[[x]]$raw_url)
      # Run validation for Parquet and compressed file format
      download.file(url_link, basename(url_link))
    })
    # run validation
    test <- capture.output(try(
      validate_submission(basename(pr_sub_files_group), js_def = js_def_file,
                          lst_gs = lst_gs, pop_path = pop_path)))
    # list of the viz and validation results
    test_tot <- list(valid = test)
    # returns all output
    return(test_tot)
  })
}  else {
  test_tot <-  list(list(
    valid = paste0(
      "No projection submission file in the standard SMH file ",
      "format found in the Pull-Request. No validation was run.")
  ))
}

# Post validation results as comment on the open PR
test_valid <- purrr::map(test_tot, "valid")
message <- purrr::map(test_valid, paste, collapse = "\n")

lapply(seq_len(length(message)), function(x) {
  gh::gh(paste0("POST /repos/", "midas-network/megaround-scenariohub/",
                "issues/", Sys.getenv("GH_PR_NUMBER"),"/comments"),
         body = message[[x]],
         .token = Sys.getenv("GH_TOKEN"))
})

# Validate or stop the github actions
if (any(grepl("\U000274c Error", test_valid))) {
  stop("The submission contains one or multiple issues")
} else if (any(grepl("Warning", test_valid))) {
  warning(" The submission is accepted but contains some warnings")
}
