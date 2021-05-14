
library(tidyverse)

# load data and combine
sub_date <- "2021-05-02"
files_ <- list.files(file.path("data-prelim", sub_date), full.names = TRUE, include.dirs = TRUE)

scenarios_ <- c("highVac_modNPI", "highVac_lowNPI", "lowVac_modNPI","lowVac_lowNPI")
scen_id <- paste0(LETTERS[1:4], "-2021-05-02")

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

# Save it
readr::write_csv(data_comb, paste0('data-processed/JHU_IDD-CovidSP/', sub_date, "-JHU_IDD-CovidSP.csv"))


