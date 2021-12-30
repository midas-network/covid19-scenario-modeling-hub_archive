
library(tidyverse)

# load data and combine
sub_date <- "2021-12-21"
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
target_limit <- lubridate::as_date("2021-12-18") + (7 * 13)
data_comb <- data_comb %>% filter(target_end_date<=target_limit)



# Save it
readr::write_csv(data_comb, paste0('data-processed/JHU_IDD-CovidSP/', sub_date, "-JHU_IDD-CovidSP.csv"))


