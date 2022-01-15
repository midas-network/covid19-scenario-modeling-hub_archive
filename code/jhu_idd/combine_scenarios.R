
library(tidyverse)

# load data and combine
sub_date <- "2021-12-21"
n_weeks_ahead <- 13

files_ <- list.files(file.path("data-prelim", sub_date), full.names = TRUE, include.dirs = TRUE)

#scenarios_ <- c("highVac_modNPI", "highVac_lowNPI", "lowVac_modNPI","lowVac_lowNPI")
scenarios_ <- c("optSev_highIE", "optSev_lowIE", "pessSev_highIE", "pessSev_lowIE")

scen_id <- paste0(LETTERS[1:4], "-2021-12-21")

data_comb <- NULL
for (i in 1:length(scenarios_)){
    
    file_ <- grep(scenarios_[i], files_, value=TRUE)
    data_tmp <- readr::read_csv(file_) %>%
        mutate(scenario_id = scen_id[i],
               scenario_name = scenarios_[i]) %>%
        rename(model_projection_date = forecast_date)
    data_comb <- data_comb %>% bind_rows(data_tmp)
}

# data_comb <- data_comb %>% 
#   filter(!grepl("hosp", target))
         
sum(grepl("hosp", data_comb$target))
  
unique(data_comb$target)
length(unique(data_comb$quantile)) #24
length(unique(data_comb$target)) # 6*26 = 156
length(unique(data_comb$target))/26 #6
length(unique(data_comb$target_end_date)) # 26
length(unique(data_comb$location)) #56

sort(unique(data_comb$target_end_date))
unique(data_comb$scenario_id)
unique(data_comb$scenario_name) 


# Limit to 13 weeks ahead 
target_limit <- lubridate::as_date("2021-12-18") + (7 * n_weeks_ahead)
data_comb <- data_comb %>% filter(target_end_date<=target_limit)


# Check that target_end_dates and targets match
length(unique(paste0(data_comb$target, data_comb$target_end_date)))
target_ <- unique(paste0(data_comb$target, data_comb$target_end_date))
target_[grepl("inc case", target_)]
target_[grepl("cum case", target_)]
target_[grepl("inc death", target_)]
target_[grepl("cum death", target_)]

# -- Should be 4 * n_weeks_ahead * 2
4*n_weeks_ahead*2



# remove point-mean
data_comb <- data_comb %>% filter(type!="point-mean")


# Save it
readr::write_csv(data_comb, paste0('data-processed/JHU_IDD-CovidSP/', sub_date, "-JHU_IDD-CovidSP.csv"))








data_comb %>% filter(type!="point-mean") %>% filter(grepl("inc case", target)) %>% as_tibble() %>% {table(.$quantile, .$scenario_name)}
data_comb %>% filter(type!="point-mean") %>% filter(grepl("inc death", target)) %>% as_tibble() %>% {table(.$quantile, .$scenario_name)}


tmp <- data_comb %>% filter(grepl("inc case", target)) %>% filter(type!="point-mean") %>% mutate(model_name="IDD")

sort(unique(paste0(tmp$scenario_id, tmp$scenario_name)))
tmp %>% as_tibble() %>% {table(.$quantile, .$scenario_name)}

# tmp <- data_comb %>% filter(grepl("inc death", target)) %>% filter(type!="point-mean") %>% mutate(model_name="IDD")
# 
# sort(unique(paste0(tmp$scenario_id, tmp$scenario_name)))
# tmp %>% as_tibble() %>% {table(.$quantile, .$scenario_name)}


tmp_distinct <- tmp %>% select(-value)
nrow((tmp_distinct))

length(unique(tmp$model_projection_date)) # 1
length(unique(tmp$target)) # 13 
length(unique(tmp$target_end_date)) # 13
length(unique(tmp$location)) # 52
length(unique(tmp$type)) # 2
length(unique(tmp$quantile)) # 24
length(unique(tmp$scenario_id)) # 4
length(unique(tmp$scenario_name)) # 4
1*13*52*(24)*4*1

# everything looks right...

quantiles_ <- sort(unique(tmp$quantile)); quantiles_
quantiles <- quantiles_

quantiles <- c(NA, 0.025, 0.975)
quantiles <- c(NA, 0.25, 0.75)

df <- tmp
prep_wider_quantile <- function(df, quantiles) {
    df <- group_by(df, model_name, scenario_id, target_end_date) %>%
        filter(quantile %in% quantiles) %>% ungroup() %>% data.table()
    df[, quantile := ifelse(is.na(quantile), "point",
                            ifelse(quantile == min(quantiles, na.rm = TRUE), "min", "max"))]
    df <- tidyr::pivot_wider(df, names_from = quantile, values_from = value)
    #df <- tidyr::unnest(df, cols = c(point, min, max))
    df <- data.table(df)
    df[, rm_na := ifelse(is.na(min), 1, ifelse(is.na(max), 1, 0))]
    df <- df[!grepl(1, rm_na)]
}




# Check plots

#tmp %>% filter(location=="US")




tmp <- data_comb %>% filter(grepl("cum hosp", target)) %>% filter(type!="point-mean") %>% mutate(model_name="IDD")

