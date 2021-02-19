# Library and System -----------------------------------------------------------

# Installation
# install.packages(c("purrr", "lubridate", "dplyr", "vroom", "stringr"))

# Library
library(purrr)     # for list management; 
#  for "flatten", "reduce"
library(lubridate) # for date management; 
#  for "epiweek", "year"
library(dplyr)     # for data frame management;
#  for "mutate", "bind_rows", "%>%", "filter"

################################## FUNCTIONS ###################################

# Evaluate path and create them if necessary, also create a variable in the 
# environment with the variable name = "name_path" and value = "path"
eval_path <- function(name_path, path) {
  assign(name_path, path, inherits = TRUE)
  if (!(dir.exists(path))) dir.create(path)
}

# Calculate ensemble: use the median of the median (50% quantile) projections 
# for each model, and the 50/95% confidence interval for the ensemble should be 
# the median of the 50/95% quantiles 
ensemble_quantile <- function(df, quantile, type, quantile_name) {
  df %>% 
    dplyr::filter(quantile == !!quantile) %>% 
    dplyr::summarise(value = median(value, na.rm = TRUE)) %>% 
    dplyr::ungroup() %>% 
    dplyr::mutate(type := !!type, 
                  quantile := !!quantile_name,
                  model_projection_date = target_end_date - (
                    as.numeric(gsub("[^[:digit:]]", "", target)) * 7))
}

# Read CSV or ZIP format file
read_files <- function(path) {
  if (grepl(".csv$", basename(path))) {
    df <- vroom::vroom(path, delim = ",", na = c("", "NA", "NaN"))
  }
  if (grepl(".zip$", basename(path))) {
    file_name <- unzip(path,list = TRUE)[,"Name", TRUE]
    unzip(path)
    df <- vroom::vroom(file_name[1], delim = ",", na = c("", "NA", "NaN"))
    file.remove(file_name)
  }
  df
}

# Read all the files in a path containing the model ordered by folder. Aggregate
# them all in one data frame and add two columns with model name and model name,
# scenario name paste together. 
list_model <- function(path) {
  lst_model <- lapply(name_model, function(x) {
    list_files <- grep("csv|zip", dir(x, full.names = TRUE), value = TRUE)
    lst_ds <- lapply(list_files, function(y) {
      df <- read_files(y)
      df <- dplyr::filter(df, !is.na(quantile)) %>% 
        dplyr::mutate(
          model_name = gsub(".{4}-.{2}-.{2}-|.csv|.zip", "", basename(y)),
          # add column with scenario and model information
          model_s = paste(model_name, scenario_name, sep = " - "))
      df
    })
    lst_ds <- setNames(lst_ds, basename(list_files))
  }) 
  lst_model <- purrr::flatten(lst_model)
  lst_model <- purrr::reduce(lst_model, rbind)
}

# Prerequisite -----------------------------------------------------------------
# Create Path Variables and folders (if necessary)
eval_path("path_model", "data-processed/")

#################################### MODELS ####################################
# Download and save model from GitHub Scenario Hub repository:
name_model <- grep("Ensemble$", dir(path_model, full.names = TRUE), 
                   value = TRUE, invert = TRUE)

# Read, process all:
# Process:
#  - Add week information 
#  - Add column with model name and with model name - scenario (for plot)
df_model <- list_model(name_model)

# Filter Ensemble:
#  - Select only model with all quantiles information
#  - Filter date that does not contain the projection of all selected models
df_model_ensemble <- df_model %>% 
  dplyr::group_by(scenario_id, scenario_name, target, target_end_date, location,
                  model_s) %>% 
  dplyr::mutate(sel = ifelse(length(quantile) == 23, 1, 0)) %>% 
  dplyr::filter(sel == 1) %>% 
  dplyr::ungroup(model_s) %>% 
  dplyr::mutate(round_date =  target_end_date - (
    as.numeric(gsub("[^[:digit:]]", "", target)) * 7)) %>% 
  dplyr::mutate(round_date = ifelse(round_date == "2021-01-02", 1, 2))

sel_df <- df_model_ensemble %>% 
  dplyr::ungroup() %>% 
  dplyr::select(target_end_date, model_name, round_date) %>% 
  dplyr::distinct() %>% 
  dplyr::group_by(target_end_date, round_date) %>% 
  dplyr::summarise(n_model = dplyr::n(), .groups = "drop") %>% 
  dplyr::group_by(round_date) %>% 
  dplyr::mutate(sel = ifelse(n_model == max(n_model), 0 ,1))

round_n <- unique(sel_df$round_date)
sel_df <- dplyr::filter(sel_df, sel == 1) %>% dplyr::ungroup()

df_model_ensemble <- lapply(round_n, function (x) {
  df_ens <- dplyr::filter(dplyr::ungroup(df_model_ensemble), round_date == x)
  sel_ndate <- sel_df[which(sel_df$round_date == x), "target_end_date", TRUE]
  df_ens <- df_ens[which(!(df_ens$target_end_date %in% sel_ndate)), ]
}) %>% dplyr::bind_rows() %>% 
  dplyr::group_by(scenario_id, scenario_name, target, target_end_date, location)

# Calculate Ensemble:
df_ensemble <- lapply(unique(df_model_ensemble$quantile), function(x) {
  ensemble_quantile(df_model_ensemble, x, "quantile", x)
}) %>% dplyr::bind_rows()

# Write output by round information (in CSV or ZIP depending on the size of 
# the output):
lapply(unique(df_ensemble$model_projection_date), function(x) {
  df <- dplyr::filter(df_ensemble, grepl(x, model_projection_date)) 
  name_file <- paste0(path_model, "Ensemble/", x, "-Ensemble.csv")
  vroom::vroom_write(df, name_file, delim = ",")
  if (file.size(name_file) / 1e6 > 100) {
    wd0 <- getwd()
    setwd(dirname(name_file))
    zip(gsub(".csv$", "", basename(name_file)), basename(name_file))
    setwd(wd0)
    file.remove(name_file)
  }
})

