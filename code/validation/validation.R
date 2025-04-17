library(SMHvalidation)
library(gh)
library(dplyr)

# Check if validation need to run
if (nchar(Sys.getenv("GH_COMMIT_SHA")) > 1) {
  test <- gh::gh(paste0("GET /repos/",
                        "midas-network/covid19-scenario-modeling-hub_archive/commits/",
                        Sys.getenv("GH_COMMIT_SHA")))
  check <- grepl("data-processed/", unique(unlist(purrr::map(test$files,
                                                             "filename"))))
} else {
  check <-  TRUE
}

if (isFALSE(all(check))) {
  test_tot <- NA
  print("no update in data-processed folder")
} else {
  # Prerequisite
  pop_path <- "data-locations/locations.csv"
  js_def_file <- "hub-config/tasks.json"
  lst_gs <- NULL

  # check if submissions file
  pr_files <- gh::gh(paste0("GET /repos/",
                            "midas-network/covid19-scenario-modeling-hub_archive/pulls/",
                            Sys.getenv("GH_PR_NUMBER"), "/files"))

  pr_files_name <- purrr::map(pr_files, "filename")
  pr_files_name <- pr_files_name[!"removed" == purrr::map(pr_files, "status")]
  pr_sub_files <-
    stringr::str_extract(pr_files_name,
                         "data-processed/.+/\\d{4}-\\d{2}-\\d{2}(-.*)?")
  pr_sub_files <- unique(na.omit(pr_sub_files))
  pr_sub_files <- grep("(A|a)bstract", pr_sub_files, value = TRUE,
                       invert = TRUE)
  round_id <- unique(stringr::str_extract(pr_sub_files,
                                          "\\d{4}-\\d{2}-\\d{2}"))
  config_json <- jsonlite::read_json(js_def_file)
  rounds_ids <- unique(hubUtils::get_round_ids(config_json))
  sel_round <- grepl(paste(round_id, collapse = "|"), rounds_ids)
  if (all(isFALSE(sel_round))) {
    stop("The round id in the submission file was not recognized, please ",
         "verify")
  }
  if (is.null(unlist(purrr::map(config_json$rounds[sel_round], "partition")))) {
    partition = NULL
  } else {
    partition = unlist(purrr::map(config_json$rounds[sel_round], "partition"))

  }
  # Run validation on file corresponding to the submission file format
  if (length(pr_sub_files) > 0) {
    if (!(dir.exists(paste0(getwd(), "/proj_plot"))))
      dir.create(paste0(getwd(), "/proj_plot"))
    sub_file_date <- unique(stringr::str_extract(basename(pr_sub_files),
                                                 "\\d{4}-\\d{2}-\\d{2}"))
    if (is.null(partition)) {
      team_name <- unique(basename(dirname(pr_sub_files)))
      group_files <- paste0(sub_file_date, "-", team_name)
    } else {
      group_files <- sub_file_date
      file_paths <- stringr::str_extract(pr_sub_files,
                                         "(?<=data-processed/)(.+\\/)?")
      team_name <- unique(unlist(purrr::map(strsplit(file_paths, "/"),1)))
    }
    test_tot <- lapply(group_files, function(y) {
      # select submission files
      pr_sub_files_group <- grep(y, pr_sub_files, value = TRUE)
      pr_sub_files_lst <- pr_files[grepl(paste(pr_sub_files_group, collapse = "|"),
                                         purrr::map(pr_files, "filename"))]
      pr_sub_files_lst <-
        pr_sub_files_lst[!grepl("(A|a)bstract",
                                purrr::map(pr_sub_files_lst, "filename"))]
      # run validation on all files
      test_tot <- lapply(seq_len(length(pr_sub_files_lst)), function(x) {
        # submission file download
        if (is.null(partition)) {
          url_link <- URLdecode(pr_sub_files_lst[[x]]$raw_url)
          download.file(url_link, basename(url_link))
        } else {
          file_part <- paste0(getwd(), "/part_sub/",
                              pr_sub_files_lst[[x]]$filename)
          if (!(dir.exists(dirname(file_part))))
            dir.create(dirname(file_part), recursive = TRUE)
          url_link <- pr_sub_files_lst[[x]]$raw_url
          download.file(url_link, file_part)
        }
      })
      gc()
      # run validation
      if (sub_file_date > "2024-01-01") {
        merge_col <- TRUE
        n_decimal <- 1
      } else {
        merge_col <- FALSE
        n_decimal <- NULL
      }
      if (is.null(partition)) {
        val_path <- basename(pr_sub_files_group)
        round_id <- NULL
      } else {
        val_path <- paste0(getwd(), "/part_sub/data-processed/", team_name, "/")
        round_id <- sub_file_date
      }
      arg_list <- list(path = val_path, js_def = js_def_file, lst_gs = lst_gs,
                       pop_path = pop_path, merge_sample_col = merge_col,
                       partition = partition, round_id = round_id,
                       n_decimal = n_decimal)
      test <- capture.output(try(do.call(SMHvalidation::validate_submission,
                                         arg_list)))
      gc()
      if (length(grep("Run validation on fil", test, invert = TRUE)) == 0) {
        test <- try(do.call(SMHvalidation::validate_submission, arg_list))
        test <- test[1]
        gc()
      }
      # Visualization
      df <- try({
        arrow::open_dataset(val_path, partitioning = partition) %>%
          dplyr::filter(output_type == "quantile") %>%
          dplyr::collect()
      })
      gc()
      # print(head(df))
      if (all(class(df) != "try-error") && nrow(df) > 0) {
        test_viz <- try(generate_validation_plots(
          path_proj = val_path, lst_gs = NULL,
          save_path = paste0(getwd(), "/proj_plot"), y_sqrt = FALSE,
          plot_quantiles = c(0.025, 0.975), partition = partition))
      } else {
        test_viz <- NA
      }
      gc()
      if (class(test_viz) == "try-error")
        file.remove(dir(paste0(getwd(), "/proj_plot"), full.names = TRUE))
      # list of the viz and validation results
      test_tot <- list(valid = test, viz = test_viz)
      # returns all output
      return(test_tot)
    })
  }  else {
    test_tot <-
      list(list(valid = paste0("No projection submission file in the standard ",
                               "SMH file format found in the Pull-Request. No ",
                               "validation was run.")))
  }
}

if (!all(is.na(test_tot))) {
  # Post validation results as comment on the open PR
  test_valid <- purrr::map(test_tot, "valid")
  message <- purrr::map(test_valid, paste, collapse = "\n")

  lapply(seq_len(length(message)), function(x) {
    gh::gh(paste0("POST /repos/", "midas-network/covid19-scenario-modeling-hub_archive/",
                  "issues/", Sys.getenv("GH_PR_NUMBER"), "/comments"),
           body = message[[x]],
           .token = Sys.getenv("GH_TOKEN"))
  })

  # Post visualization results as comment on the open PR
  test_viz <- purrr::map(test_tot, "viz")
  if (any(!is.na(test_viz))) {
    message_plot <- paste0(
      "If the submission contains projection file(s) with quantile projection, ",
      "a pdf containing visualization plots of the submission might be ",
      "available and downloadable in the GitHub actions. Please click on 'details' ",
      "on the right of the 'Validate submission' checks. The pdf is available in a ZIP ",
      "file as an artifact of the GH Actions. For more information, please see ",
      "[here](https://docs.github.com/en/actions/managing-workflow-runs/downloading-workflow-artifacts)")

    if (any(unlist(purrr::map(test_viz, class)) == "try-error")) {
      message_plot <- capture.output(
        cat(message_plot, "\n\n\U000274c Error: ",
            "The visualization encounters an issue and might not be available,",
            " if the validation does not return any error, please feel free to",
            " tag `@LucieContamin` for any question."))
    }

    gh::gh(paste0("POST /repos/", "midas-network/covid19-scenario-modeling-hub_archive/",
                  "issues/", Sys.getenv("GH_PR_NUMBER"),"/comments"),
           body = message_plot,
           .token = Sys.getenv("GH_TOKEN"))
  }


  # Validate or stop the github actions
  if (any(grepl("(\U000274c )?Error", test_valid))) {
    stop("The submission contains one or multiple issues")
  } else if (any(grepl("Warning", test_valid))) {
    warning(" The submission is accepted but contains some warnings")
  }
}
