## Figure code for COVID-19 Scenario Modeling Hub Round 9 manuscript on 
## Childhood vaccination

## load required packages
library(tidyverse)
library(data.table)
library(ggpubr) # calculates correlation coefficients for plots
library(gridExtra)


## set working directory to local round9 manuscript folder

## load gold standard truth data ('gs')
load("./data/gold_standard.Rdata")

## load projection data ('r9')
load("./data/model_projections.Rdata")

## load zeroed data for cumulative count analyses ('z9')
load("./data/round9_zeroed_data.Rdata")

##############
## Figure 1 ##
##############
model_data=r9
location="US"
target_type="Incident"
selected_model="Ensemble_LOP"
model_name="Ensemble_LOP"
rndnum=9

# model data for plot
m_df <- r9 %>%
  filter(location_name == location, str_detect(target, "inc"), model_name == selected_model) %>%
  mutate(outcome = paste("Incident", target_type)) %>%
  pivot_wider(names_from = quantile, names_prefix = "q") %>%
  mutate(value = q0.5) %>%
  mutate(scenario_name_long = recode(scenario_name,
                                     ChildVax_noVar = "Child vaccination, no variant",
                                     ChildVax_Var = "Child vaccination, variant",
                                     noChildVax_noVar = "No child vaccination, no variant",
                                     noChildVax_Var = "No child vaccination, variant"))

min_model_date <- min(m_df$target_end_date)
max_model_date <- max(m_df$target_end_date)
pred_date = as.Date(min_model_date)-7
max_gd_date <- as.Date("2021-12-11")

# ground truth data for plot
inc_outcomes <- c("confirmed_incidence_num", "deaths_incidence_num", "hospitalization")
g_df <- rbindlist(gs, idcol = "outcome") %>%
  filter(outcome %in% inc_outcomes) %>%
  mutate(outcome = recode(outcome,
                          confirmed_incidence_num = "Incident Reported Cases",
                          deaths_incidence_num = "Incident Deaths",
                          hospitalization = "Incident Hospitalizations")) %>%
  filter(geo_value_fullname == location,
         time_value > pred_date - lubridate::period(4, "month"),
         time_value <= max_model_date) %>%
  mutate(flag = ifelse(time_value >= min_model_date, 1, 0)) # flag for whether ground truth is from after projection date

ggplot() + 
  geom_ribbon(data=m_df, aes(x=target_end_date, ymin=q0.025, ymax=q0.975,
                             fill=scenario_name_long, color=scenario_name_long), alpha=0.2) +
  geom_line(data=m_df, aes(x=target_end_date, y=value, color=scenario_name_long), size=1.5) +
  geom_vline(xintercept=as.Date("2021-11-01"), lty="dashed")+
  geom_point(data=g_df %>% filter(time_value <= max_gd_date), aes(x=time_value, y=value, shape = factor(flag)), color="black", size=2.5) +
  facet_wrap(~factor(outcome, levels=c("Incident Reported Cases", "Incident Hospitalizations", "Incident Deaths"),labels = c("Reported Cases", "Hospitalizations", "Deaths")),
             scales="free_y") + 
  scale_color_manual(labels = c("Child vaccination, no variant",
                                "Child vaccination, variant",
                                "No child vaccination, no variant",
                                "No child vaccination, variant"),
                     values = c("#E69F00", "#999999", "#009E73", "#56B4E9")) +
  scale_fill_manual(labels = c("Child vaccination, no variant",
                               "Child vaccination, variant",
                               "No child vaccination, no variant",
                               "No child vaccination, variant"),
                    values = c("#E69F00", "#999999", "#009E73", "#56B4E9")) +
  scale_shape_manual(values = c(19,1)) +
  guides(color=guide_legend(nrow=2, byrow=TRUE, override.aes=list(fill=NA)),
         fill = FALSE,
         shape = FALSE) +
  labs(x="", y="Weekly Incidence", color="") + 
  theme_bw() +
  theme(legend.position = "bottom",
        legend.key=element_blank(),
        text=element_text(size = 16)) +
  scale_y_continuous(label=scales::comma)

##############
## Figure 2 ##
##############

# set scenario to vaccination and no variant
scen = "A-2021-09-14"


endDate = "2021-10-30"
endDateName = "October 30, 2021"

gs_cum_case_Oct30 <- gs[["confirmed_cumulative_num"]] %>%
  filter(time_value %in% as.Date(c(endDate, "2021-09-11")), geo_value_fullname!="US") %>%
  mutate(fips = NULL) %>%
  rename(location_name = geo_value_fullname) %>%
  dcast(location_name~time_value, value.var="value") %>%
  ## update end date!
  mutate(obs = `2021-10-30` -`2021-09-11`)

# Isolate target type, scenario, median, ensemble, and target_date
z9_Oct30 <- z9 %>%
  filter(target_type =="Reported Cases", location !="US", target_end_date==endDate, model =="Ensemble_LOP", 
         dplyr::near(quantile, .5), scenario_id == scen) %>%
  rename(proj=value)

gginput_Oct30 <- left_join(gs_cum_case_Oct30,z9_Oct30,by="location_name") %>%
  filter(abbreviation %in% state.abb)


endDate = "2021-12-11"
endDateName = "December 11, 2021"

gs_cum_case_Dec11 <- gs[["confirmed_cumulative_num"]] %>%
  filter(time_value %in% as.Date(c(endDate, "2021-09-11")), geo_value_fullname!="US") %>%
  mutate(fips = NULL) %>%
  rename(location_name = geo_value_fullname) %>%
  dcast(location_name~time_value, value.var="value") %>%
  ## update end date!
  mutate(obs = `2021-12-11` -`2021-09-11`)

z9_Dec11 <- z9 %>%
  filter(target_type =="Reported Cases", location !="US", target_end_date==endDate, model =="Ensemble_LOP", 
         dplyr::near(quantile, .5), scenario_id == scen) %>%
  rename(proj=value) 

gginput_Dec11 <- left_join(gs_cum_case_Dec11,z9_Dec11,by="location_name") %>%
  filter(abbreviation %in% state.abb)

# plot
Oct30_plot<- ggplot(gginput_Oct30, 
                    aes(10000*obs/population, 10000*proj/population)) + 
#  geom_point(colour="gray",size=2) + 
  geom_text(aes(label = abbreviation, x = 10000*obs/population, y = 10000*proj/population),size=2.7) + #, size = population
  stat_cor(method = "pearson",label.x=20,label.y=8) +
  geom_abline(aes(slope=1, intercept=0), color="red") + 
  scale_x_sqrt(label=scales::comma) + 
  scale_y_sqrt(label=scales::comma) +
  ylab("Projected cases per 10,000 individuals") + # cumulative
  xlab("Observed cases per 10,000 individuals") +  # cumulative
  ggtitle(paste0("State-level ensemble projection performance (September 12, 2021 - ",endDateName,")")) +
  theme_bw()

Dec11_plot<- ggplot(gginput_Dec11, 
                    aes(10000*obs/population, 10000*proj/population)) + 
#  geom_point(colour="gray",size=2) + 
  geom_text(aes(label = abbreviation, x = 10000*obs/population, y = 10000*proj/population),size=2.7) + #, size = population
  stat_cor(method = "pearson",label.x=20,label.y=8) +
  geom_abline(aes(slope=1, intercept=0), color="red") + 
  scale_x_sqrt(label=scales::comma) + 
  scale_y_sqrt(label=scales::comma) +
  ylab("Projected cases per 10,000 individuals") + # cumulative
  xlab("Observed cases per 10,000 individuals") +  # cumulative
  ggtitle(paste0("State-level ensemble projection performance (September 12, 2021 - ",endDateName,")")) +
  theme_bw()

grid.arrange(Oct30_plot,Dec11_plot,nrow=1)


##############
## Figure 5 ##
##############
## age-specific scenario comparison figure
## import absolute differences and relative reductions calculated using mean and
## meta-analysis methods
scenario_comp_path <- "./scenario_comparison/"

young <- rbindlist(
  list(
    "AratioB"=fread(paste0(scenario_comp_path,"age-specific_comparison/young_relative_risk_by_model_from_cdfs_ab.csv")),
    "CratioD"=fread(paste0(scenario_comp_path,"age-specific_comparison/young_relative_risk_by_model_from_cdfs_cd.csv"))
  ),
  idcol = "comparison"
)[,!c("location")]
young <- young %>% mutate(percent_est_young = 100*(1-mean_est))
young <- young %>% dplyr::rename("se_est_young" = "se_est") %>%
  dplyr::rename("mean_est_young" = "mean_est")

all <- rbindlist(
  list(
    "AratioB" = fread(paste0(scenario_comp_path,"national_estimates/meta_input_relative_A_B.csv")),
    "CratioD" = fread(paste0(scenario_comp_path,"national_estimates/meta_input_relative_C_D.csv"))
  ),
  idcol ="comparison"
)
all <- all %>% mutate(percent_est = 100*(1-mean_est))

ratios <- left_join(young,all,by=c("comparison","model_name","outcome"))
ratios <- ratios %>% mutate(comparison=factor(comparison),
                            model_name=factor(model_name),
                            outcome=factor(outcome))

summary(ratios)


ggplot(data = ratios %>% filter(outcome=="cum case")) + 
  geom_point(aes(x=percent_est/100,y = percent_est_young/100, shape = comparison, color = model_name), size = 2.5)+ #, size = model, shape = model # position = position_dodge(width = 0.2),
  geom_abline(intercept = 0, slope = 1) +
  scale_shape_manual(values = c(15, 17),labels = c("No variant","Variant")) +
  guides(list(colour=guide_legend(title="Team"),shape=guide_legend(title="Scenario type")))+
  labs(#title = "Relative reduction in cases\n(November 1, 2021 - March 12, 2022)",
    y = "Relative reduction in cases for younger-age group",
    x = "Relative reduction in cases for all-age group")+
  scale_x_continuous(labels = scales::percent, limits=c(0,.355), expand=c(0,0)) +
  scale_y_continuous(labels = scales::percent, limits=c(0,.355), expand=c(0,0)) +
  coord_fixed() +
  theme_bw() + 
  theme(strip.background = element_blank(),
        panel.grid.minor = element_blank(),
        legend.position = "right",
        text = element_text(size=14))

###############
## Figure S1 ##
###############

projection.start.date="2021-09-12"
targets <- c("Reported Cases", "Hospitalizations", "Deaths")

v_line = data.frame(x = as.numeric(as.Date(projection.start.date)),
                    y = Inf,
                    lab = paste0("Projections begin\n",projection.start.date),
                    target_type = "Reported Cases")

r9_ci <- pivot_wider(r9, names_from = quantile, names_prefix = "q") %>%
  rename(value = qNA) %>%
  filter(!(model_name %in% c("Ensemble", "Ensemble_LOP_untrimmed"))) %>%
  mutate(model_name = ifelse(model_name == "Ensemble_LOP", "Ensemble", model_name))

r9_ci$pro <- ifelse(r9_ci$scenario_name %in% c("ChildVax_noVar","ChildVax_Var"), "Child vaccination", "No child vaccination")
r9_ci$pro <- factor(r9_ci$pro, levels =c("Child vaccination", "No child vaccination"))
r9_ci$wan <- ifelse(r9_ci$scenario_name %in% c("ChildVax_noVar","noChildVax_noVar"), "No variant", "Variant")
r9_ci$wan <- factor(r9_ci$wan, levels = c("No variant", "Variant"))
r9_ci$pro_short <- ifelse(r9_ci$pro == "Child vaccination", "Child vax", "No child vax")
r9_ci$wan_short <- ifelse(r9_ci$wan == "No variant", "No var", "Var")
r9_ci$full_scenario <- ifelse(r9_ci$scenario_name == "ChildVax_noVar", "Child vaccination, no variant",
                             ifelse(r9_ci$scenario_name == "ChildVax_Var", "Child vaccination, variant",
                                    ifelse(r9_ci$scenario_name == "noChildVax_noVar", "No child vaccination, no variant", "No child vaccination, variant")))

model_names <- c("Ensemble",
                 "CU-AGE-ST",
                 "JHU_IDD-CovidSP",
                 "JHUAPL-Bucky",
                 "MOBS_NEU-GLEAM_COVID",
                 "NotreDame-FRED",
                 "UNCC-hierbin",
                 "USC-SIkJalpha",
                 "UVA-adaptive",
                 "UVA-EpiHiper")

r9_ci$model_name <- factor(r9_ci$model_name, levels = model_names)

truth <- bind_rows(gs, .id = "id") %>%
  filter(id %in% c("confirmed_incidence_num", "deaths_incidence_num", "hospitalization")) %>%
  mutate(target_type = ifelse(id == "confirmed_incidence_num", "Reported Cases",
                              ifelse(id == "deaths_incidence_num", "Deaths", "Hospitalizations")),
         flag = ifelse(time_value >= min_model_date, 1, 0)) %>%
  rename(location = fips, location_name = geo_value_fullname)

model_size <- c("Ensemble" = 0.7,  "CU-AGE-ST" = 0.3, "JHU_IDD-CovidSP" = 0.3, "JHUAPL-Bucky" = 0.3,
                "MOBS_NEU-GLEAM_COVID" = 0.3, "NotreDame-FRED" = 0.3, "UNCC-hierbin" = 0.3, "USC-SIkJalpha" = 0.3,
                "UVA-adaptive" = 0.3, "UVA-EpiHiper" = 0.3)

model_colors <- c("Ensemble" = "#000000", "CU-AGE-ST" = "#D55E00", "JHU_IDD-CovidSP" = "#E69F00",
                  "JHUAPL-Bucky" = "0072B2",  "MOBS_NEU-GLEAM_COVID" = "#009E73",
                  "NotreDame-FRED" = "#332288", "UNCC-hierbin" = "#661100", "USC-SIkJalpha" = "#F0E442",
                  "UVA-adaptive" = "#CC79A7", "UVA-EpiHiper" = "#99FF33")

breaks <- seq(as.Date("2020-01-01"), as.Date("2022-03-01"), "2 month")

for(i in targets){
  # filter dat
  temp <- r9_ci %>% filter(location == "US", target_type == i, str_detect(target, "inc")) # , trunc_flag == 0
  start.date = as.Date("2021-01-01")
  
  # plot 4x4 grid
  print(ggplot()+
    geom_vline(data = v_line %>% dplyr::select(-target_type), aes(xintercept = x), color = "grey60")+
    geom_point(data = filter(truth, location == "US", target_type == i, time_value <= max_gd_date), size = 1,
               aes(x = time_value, y = value, shape = factor(flag))) +
    geom_line(data = temp, aes(x = target_end_date, y = value, color = model_name)) +
    geom_ribbon(data = temp, aes(x = target_end_date, ymin = q0.25, ymax = q0.75, fill = model_name), alpha = 0.2) +
    ggtitle(paste0("Individual model projections & 50% projection intervals - ", i)) +
    facet_grid(cols = vars(pro), rows = vars(wan), switch = "y")+
    scale_color_manual(values = model_colors) +
    scale_fill_manual(values = model_colors) +
    scale_size_manual(values = model_size)+  
    scale_shape_manual(values = c(19,1)) +
    guides(shape = FALSE) +
    scale_x_date(limits = c(as.Date(start.date), as.Date(max(temp$target_end_date, na.rm = TRUE))))+
    scale_y_continuous(label=scales::comma)+
    theme_bw()+
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), 
          axis.title = element_blank(),
          legend.text = element_text(size = 6),
          legend.title = element_blank(),
          plot.title = element_text(hjust = 0.5),
          strip.background = element_blank(),
          strip.placement = "outside"))
  
  
}  

