
###PREAMBLE
#rm(list=ls())
library(inference)
library(tidyverse)
library(doParallel)


# scenarios <- c("optimistic", "optimistic_variant", "fatigue", "fatigue_variant")
# scenarios <- c("optimistic_hes", "moderate_hes", "pessimistic_hes")
# scenarios <- c("highVac_modNPI", "highVac_lowNPI", "lowVac_modNPI", "lowVac_lowNPI")
# scenarios <- c("highVac_lowVar", "highVac_highVar", "lowVac_lowVar", "lowVac_highVar")
scenarios <- c("ChildVax_noVar", "noChildVax_noVar", "ChildVax_Var", "noChildVax_Var")

scenario_names <- scenarios


all_scenarios <- TRUE

projection_date <- lubridate::as_date("2021-09-12")
forecast_date <- "2020-01-01"
validation_date <- lubridate::as_date(projection_date) - 1 # one day before defined forecast date  
end_date <- lubridate::as_date(projection_date) + (26*7)-1
sub_date <- "2021-09-14"

round_num <- 9
subdir <- NULL

# cl <- parallel::makeForkCluster(4)
# doParallel::registerDoParallel(cl)
# foreach::foreach(i = 1:length(scenarios)) %dopar% {
#   
#   opt <- arguments <- list()
#   opt$scenario <- scenarios[i]
#   opt$projection_date <- projection_date
#   opt$forecast_date <- forecast_date
#   opt$end_date <- end_date
#   validation_date <- validation_date
#   pull_gt <- TRUE
#   plot_projections <- FALSE
#   full_fit <- FALSE
#   
#   source("COVID19_USA/R/scripts/produce_state_forecast_statelevel.R", local = TRUE)
#   
# }
# parallel::stopCluster(cl)
# 


# COMBINE THEM ALL AND SAVE -----------------------------------------------

# load data and combine

#round_directory <- paste(paste0("R",round_num), subdir, sep="/")

files_ <- list.files(file.path("data-prelim", sub_date),  
                     pattern = "JHU_IDD-CovidSP", 
                     full.names = TRUE, include.dirs = TRUE)
scen_id <- paste0(LETTERS[1:length(scenarios)], "-", sub_date)

data_comb <- NULL
for (i in 1:length(scenarios)){
    file_ <- grep(paste0(projection_date, "-JHU_IDD-CovidSP-", scenarios[i],".csv"), files_, value=TRUE)
    data_tmp <- readr::read_csv(file_) %>%
        mutate(scenario_id = scen_id[i],
               scenario_name = scenario_names[i]) %>%
        rename(model_projection_date = forecast_date) %>%
        filter(type!="point-mean")
    data_comb <- data_comb %>% bind_rows(data_tmp)
}

# data_comb <- data_comb %>% 
#   filter(!grepl("hosp", target))


# CHECKS

sum(grepl("hosp", data_comb$target))

length(unique(data_comb$quantile)) #24
length(unique(data_comb$target)) # 6*26 = 156  ## NEW: 8*26 = 208 (incl Infections)
length(unique(data_comb$target))/26 #6 NEW: 8
length(unique(data_comb$target_end_date)) # 26
length(unique(data_comb$location)) #56

sort(unique(data_comb$target_end_date))
unique(data_comb$scenario_id)
unique(data_comb$scenario_name)


# Cleaning of things

# data_comb <- data_comb %>% filter(location!=26) # Remove Michigan




# DROPS -------------------------------------------------------------------

drop_cases_st <- c("VI", "MP")
drop_deaths_st <- c("VI", "MP")
drop_hosp_st <- c("VI", "MP","GU", "PR") #c("AL", "FL", "GA", "KY", "LA", "MO", "MS", "NV", "OK", "OR", "TX", "UT", "WY")
drop_all_hosp <- FALSE
######################################

drop_cases_stonly <- stringr::str_pad(cdlTools::fips(drop_cases_st), width = 2, side = "left", pad = "0")
drop_deaths <- stringr::str_pad(cdlTools::fips(drop_deaths_st), width = 2, side = "left", pad = "0")
drop_hosp <- stringr::str_pad(cdlTools::fips(drop_hosp_st), width = 2, side = "left", pad = "0")

## drop cases for state and all underlying counties
drop_cases <- unique(data_comb$location)[which(stringr::str_sub(unique(data_comb$location), 1, 2) %in% drop_cases_stonly)]

## get unique label names
caselabs <- grep("case", unique(data_comb$target), value = TRUE)
deathlabs <- grep("death", unique(data_comb$target), value = TRUE)
hosplabs <- grep("hosp", unique(data_comb$target), value = TRUE)

data_comb <- data_comb %>%
    dplyr::filter(!(location %in% drop_cases & target %in% caselabs)) %>%
    dplyr::filter(!(location %in% drop_deaths & target %in% deathlabs)) %>%
    dplyr::filter(!(location %in% drop_hosp & target %in% hosplabs))

if(drop_all_hosp){
    data_comb <- dplyr::filter(data_comb, !(grepl("hosp", target)))
}



# Remove infections -------------------------------------------------------

data_comb_noinf <- data_comb %>% 
    filter(!grepl("inf", target))
data_comb_onlyinf <- data_comb %>% 
    filter(grepl("inf", target))

# Save it
readr::write_csv(data_comb_noinf, file.path("data-processed", "JHU_IDD-CovidSP", paste0(sub_date, "-JHU_IDD-CovidSP.csv")))
readr::write_csv(data_comb_onlyinf, file.path("data-processed", "JHU_IDD-CovidSP", paste0(sub_date, "-JHU_IDD-CovidSP_infections.csv")))

print(paste0("Final data saved in:  [  ", file.path("data-processed", "JHU_IDD-CovidSP", paste0(sub_date, "-JHU_IDD-CovidSP.csv")), "  ]"))


