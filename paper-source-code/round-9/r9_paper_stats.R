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

###############
## Figure S2 ##
###############
## State-level estimates for number of vaccinated 5-11 year olds per capita 
## vs. projected cases occurring between November 1, 2021 and March 12, 2022. 

load("./data/age_vacc_data.Rdata")

vacc_covg_date = as.Date("2021-09-11")
vacc_12to17 <- vacc_cdc %>% filter(age_group=="12_17",date==vacc_covg_date)
vacc_12to17 <- vacc_12to17 %>% dplyr::rename(abbreviation=USPS)

loc_vax <- left_join(pop_5to11,vacc_12to17,by="abbreviation") %>% 
  dplyr::rename(pop_12to17=pop)  %>%
  mutate(age_group=NULL,age_l=NULL,age_r=NULL,dose1=NULL,dose1_age=NULL,source=NULL) %>%
  mutate(est_5to11_doses=prop_vacc_age*pop_5to11)

state_vax_comp <- left_join(state_comparisons,loc_vax, by =c("location","abbreviation","location_name","population"))

ratios <- state_comparisons %>% 
  mutate(est=1-est) %>%
  reshape2::dcast(outcome + location ~ comparison, value.var = "est")  %>%
  mutate(A_B_diff=NULL,C_D_diff=NULL) %>%
  dplyr::rename(pctchange_BA='A_B_ratio',pctchange_DC='C_D_ratio') %>%
  select(outcome, location, pctchange_BA, pctchange_DC) %>%
  reshape2::melt(c("outcome", "location"))%>%
  mutate(outcome = factor(outcome, levels = c("Cumulative Cases","Cumulative Hospitalizations","Cumulative Deaths")))

state_vax_comp <- left_join(ratios,loc_vax, by =c("location")) 


# Plotting variables
change_labs <- c("No Variant", "Variant")
names(change_labs) <- c("pctchange_BA","pctchange_DC")


change_labs_2 <- c("Reported Cases", "Hospitalizations","Deaths")
names(change_labs_2) <- c(1,2,3)

# indices for each target type
case_index <- grep("Case", state_vax_comp$outcome)
death_index <- grep("Death", state_vax_comp$outcome)
hosp_index <- grep("Hosp", state_vax_comp$outcome)

# create target_type column for faceting of plots
state_vax_comp$outcome_f <- NA
state_vax_comp$outcome_f[case_index] <- 1#"Reported Cases"
state_vax_comp$outcome_f[hosp_index] <- 2#"Hospitalizations"
state_vax_comp$outcome_f[death_index] <- 3#"Deaths"


# plot state-level relative reductions from childhood vaccination by estimated doses in 5-11 year olds per state population size
ggplot(state_vax_comp %>%
         filter(abbreviation %in% state.abb) %>% filter(est_5to11_doses>0),aes(value,est_5to11_doses/population,group_by(outcome_f))) +
  #  geom_point()+
  geom_text(aes(label = abbreviation, x = value, y = est_5to11_doses/population),size=2.7) + #, size = population
  stat_cor(method = "pearson") +
  ylab("Estimated vaccinations in 5 to 11 year old age-group per capita by state \n (March 2022 - based on covg for 12 to 17 group on September 11, 2021)") +
  xlab("Relative reductions from childhood vaccination by state")+
  scale_x_continuous(labels = label_percent(accuracy = 1))+
  scale_y_continuous(limits=c(0.02,0.07))+
  facet_grid(cols = vars(variable),rows=vars(outcome_f), labeller = labeller(variable = change_labs,outcome_f = change_labs_2))+
  theme_bw()


