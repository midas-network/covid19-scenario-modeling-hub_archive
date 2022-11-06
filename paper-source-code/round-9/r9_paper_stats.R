library(data.table)
library(lubridate)
library(stringr)
library(ggplot2)
library(cowplot)
library(tidyverse)
library(scales)


## set working directory to local round9 manuscript folder

## load gold standard truth data ('gs')
load("./data/gold_standard.Rdata")

## load projection data ('r9')
load("./data/model_projections.Rdata")

## load zeroed data for cumulative count analyses ('z9')
load("./data/round9_zeroed_data.Rdata")

scenario.id="09-14"
projection.start.date="2021-09-12"
projection.end.date <- "2022-03-12"
rd <- 9


# Filter out infections
x <- r9 %>% filter(!str_detect(target, "inf"))

x <- x %>% mutate(location = str_pad(location, width=2, side = "left", pad = "0")) %>%
  dplyr::rename("model" = "model_name") %>%
  mutate(type = ifelse(is.na(quantile), "point", "quantile"))

#loc <- read.csv("./data-locations/locations.csv",stringsAsFactors = T)
#x <- left_join(x, loc)
x <- x %>% filter(str_detect(scenario_id, scenario.id))

# indices for each target type 
case_index <- grep("case", x$target)
death_index <- grep("death", x$target)
hosp_index <- grep("hosp", x$target)

# create target_type column for faceting of plots
x$target_type <- NA
x$target_type[case_index] <- "Reported Cases"
x$target_type[death_index] <- "Deaths"
x$target_type[hosp_index] <- "Hospitalizations"


start_date =  "2021-10-30"

## Extract median and 95% projection interval for Ensemble_LOP model  
## incident values per 100,000 individuals during the week of March 12, 2022
## in the no vaccination of 5-11 year olds and no variant scenario
x_US <-  x %>% filter(location=="US",model=="Ensemble_LOP") %>%
                dplyr::rename(pop_size=population)  %>%
                filter(str_detect(target, "inc"), quantile  %in% c(0.05,0.5,0.95), target_end_date %in% as.Date(c("2022-03-12"))) %>% #, type == "quantile"
                reshape2::dcast(target_type + scenario_id + pop_size +quantile  ~ target_end_date, value.var = "value") %>%
                dplyr::rename(end = `2022-03-12`)  %>%
                group_by(target_type, scenario_id) %>%
                mutate(end_rate_p100k = 100000*end/pop_size) %>%
                filter(scenario_id=="D-2021-09-14")
         
          
           
## Extract national-level median projections for all scenarios 
## incident values per 100,000 individuals at start and end of projection period
## for all models
incs <- x %>%  filter(location =="US") %>%
  dplyr::rename(pop_size=population)  %>%
  filter(str_detect(target, "inc"), quantile == 0.5, target_end_date %in% as.Date(c("2022-03-12", start_date))) %>% #, type == "quantile"
  reshape2::dcast(target_type + model + scenario_id + pop_size+ location  ~ target_end_date, value.var = "value")  %>%
  dplyr::rename(start=start_date, end = `2022-03-12`)  %>%
  group_by(target_type, model, scenario_id) %>%
  mutate(end_rate_p100k = 100000*end/pop_size,
         start_rate_p100k = 100000*start/pop_size) %>%
  mutate(target_type = factor(target_type, levels = c("Reported Cases", "Hospitalizations", "Deaths")))

incs %>% filter(model=="Ensemble_LOP") %>%
  filter(scenario_id=="B-2021-09-14")



## import absolute differences and relative reductions calculated using mean and
## meta-analysis methods
scenario_comp_path <- "data/scenario_comparison/state_meta_analysis_from_SLP.csv"
compare_scenarios <- read.csv(scenario_comp_path,stringsAsFactors = T)

summary(compare_scenarios)


compare_scenarios %>% filter(location=="US")%>%
  filter(comparison %in% c("A_B_ratio","C_D_ratio")) 


compare_scenarios %>% filter(location=="US")%>%
  filter(comparison %in% c("A_B_ratio","C_D_ratio")) %>% 
  mutate(est=1-est,lower=1-lower,upper=1-upper) 

state_comparisons <- compare_scenarios %>% filter(location != "US")

state_comparisons %>% filter(comparison %in% c("A_B_ratio","C_D_ratio")) %>% 
#mutate(est=1-est,lower=1-lower,upper=1-upper) %>% 
  group_by(comparison,outcome) %>% 
  summarise(est = quantile(est,c(0.25,0.5,0.75),na.rm=T))
#  summarize(min=min(upper),max=max(lower),median=median(est),mean=mean(est))


state_comparisons %>% filter(comparison %in% c("A_B_ratio","C_D_ratio")) %>%
  mutate(est=100*(1-est),lower=100*(1-lower),upper=100*(1-upper)) %>% 
  group_by(comparison,outcome) %>% 
#  summarise(est = quantile(est,c(0.05,0.5,0.95),na.rm=T))
  summarize(min=min(upper),max=max(lower),median=median(est),mean=mean(est))

