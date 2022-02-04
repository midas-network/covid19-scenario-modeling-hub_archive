# Plot scenarios for Checking
gc(); rm(opt)




# OPTIONS -----------------------------------------------------------------

projection_date <- "2022-01-09"
team_model_name <- "JHU_IDD-CovidSP"
y_sqrt <- FALSE
plot_quantiles <- c(0.025, 0.975)

compare_to_prev <- FALSE

# SETUP -------------------------------------------------------------------

library(inference)
library(tidyverse)
library(cowplot)
library(ggpubr)

# Ground truth
pull_gt <- FALSE # pull or not
if(pull_gt){ rm(list=ls()); pull_gt <- TRUE }


# File names 

# projection data
proj_data_file <- paste0("data-processed/", team_model_name, "/", projection_date, "-", team_model_name, ".csv")
# Output PDF
plot_fname <- paste0("data-processed/", team_model_name, "/plots_", projection_date, "-", team_model_name, ".pdf")


# if comparing 
previous_data <- "https://raw.githubusercontent.com/midas-network/covid19-scenario-modeling-hub/master/data-processed/JHU_IDD-CovidSP/2022-01-09-JHU_IDD-CovidSP.csv"



# FUNCTIONS ---------------------------------------------------------------


pull_gs_data <- function(){
    
    # Ground Truth data
    options(gs_targets = c(
        "Incident Cases" = "confirmed_incidence_num",
        "Cumulative Cases" = "confirmed_cumulative_num",
        "Incident Hospitalizations" = "hospitalization",
        "Cumulative Hospitalizations" = "cumulative_hospitalization",
        "Incident Deaths" = "deaths_incidence_num",
        "Cumulative Deaths" = "deaths_cumulative_num"
    ))
    
    # Get the gold standard data
    g_targ = getOption("gs_targets")
    #gs_path = "https://raw.githubusercontent.com/midas-network/covid19-scenario-hub_website/master/visualization/data-goldstandard/"
    gs_path = "../covid19-scenario-hub_website/visualization/data-goldstandard/" #PATH TO THE FOLDER IN THE WEBSITE REPO
    gs_data = lapply(g_targ[c(1,2,3,5,6)], function(x) suppressMessages(data.table::fread(paste0(gs_path,x,".csv"))))
    # Note, gs_data will include a blank data frame for cumulative hospitalizations
    gs_data[[names(g_targ)[4]]] = gs_data[[3]][0,]
    
    gs_data = lapply(names(gs_data), function(x) gs_data[[x]] %>% mutate(outcome = x))
    gs_data <- data.table::rbindlist(gs_data) %>% as_tibble()
    
    return(gs_data)
}


plot_projections <- function(data, st, projection_date, legend_rows=1, y_sqrt=FALSE){
    
    if (y_sqrt){
        scale_y_funct <- scale_y_sqrt
    } else {
        scale_y_funct <- scale_y_continuous
    }
    
    projection_date <- lubridate::as_date(projection_date)
    
    data %>% 
        filter(scenario_name != "ground truth") %>%
        ggplot(aes(x = date)) +
        geom_ribbon(aes(ymin = low, ymax = high, fill = scenario_name), alpha = 0.20) +
        geom_line(aes(y = median, color = scenario_name), size=1.5, linetype=1) +
        geom_line(aes(y = point, color = scenario_name), linetype=2) +
        geom_vline(aes(xintercept=projection_date), color="grey", linetype=2, size=1.5) +
        geom_point(data=data %>% filter(pre_gt_end==TRUE), aes(y = value_gt), color="black") +
        geom_point(data=data %>% filter(pre_gt_end==FALSE), aes(y = value_gt), color="red") +
        scale_x_date(date_breaks = "1 month", date_labels = "%b %y") +
        scale_color_viridis_d("Scenario") +
        scale_fill_viridis_d("Scenario") +
        theme_bw() +
        theme(legend.position = "top", legend.text = element_text(size=8),
              axis.text.x = element_text(size=8, angle = 45, hjust=1),
              axis.text.y = element_text(size=8)) +
        guides(fill=guide_legend(nrow=,byrow=TRUE)) +
        xlab(NULL) +
        coord_cartesian(#ylim=c(0, max(pltdat_fc %>% pull(incD_qhigh), na.rm=TRUE)*1.1),
            xlim=c(projection_date - 7*3, lubridate::as_date(max(data$date)))) +
        facet_wrap(~outcome, ncol=1, scales = "free_y") +
        scale_y_funct(glue::glue("Weekly {ifelse(data$incid_cum=='inc', 'Incident', 'Cumulative')} Outcomes, {st}"))
    
}





# DATA --------------------------------------------------------------------

# State / FIPS data
reich_locs <- read_csv("https://raw.githubusercontent.com/reichlab/covid19-forecast-hub/master/data-locations/locations.csv")


# Ground Truth Data
gt_data <- pull_gs_data() %>% 
    mutate(outcome = tolower(outcome),
           outcome = gsub("incident", "inc", outcome),
           outcome = gsub("cumulative", "cum", outcome)) %>%
    select(date=time_value, location=fips, value, outcome, value) %>%
    separate(outcome, into=c("incid_cum", "outcome"), sep=" ") %>%
    mutate(outcome = recode(outcome, "cases"="case", "deaths"="death", "hospitalizations"="hosp")) %>%
    mutate(pre_gt_end = date<projection_date)





# Projections

proj_data <- read_csv(proj_data_file) 

if (compare_to_prev){
    prev_proj_data <- read_csv(previous_data) %>% 
        mutate(scenario_name = paste0("prev_", scenario_name))
    
    proj_data <- proj_data %>% 
        bind_rows(prev_proj_data)
}


# Projections - Clean up and merge
proj_data <- proj_data %>%
    filter(quantile %in% c(plot_quantiles[1], 0.5, plot_quantiles[2]) | is.na(quantile)) %>%
    mutate(quantile = ifelse(type=="point", "point", quantile)) %>% 
    separate(target, into = c("time_ahead", "time_unit", "A", "incid_cum", "outcome"), sep=" ") %>%
    select(-A) %>%
    rename(date = target_end_date) %>%
    as_tibble() %>%
    bind_rows(gt_data %>% rename(value_gt=value) %>% mutate(date = lubridate::as_date(date), scenario_name="ground truth")) %>%
    select(scenario_id, scenario_name, location, incid_cum, outcome, date, quantile, value, value_gt, pre_gt_end) %>%
    left_join(reich_locs %>% rename(state=abbreviation), by = "location") %>%
    arrange(scenario_id, scenario_name, state, incid_cum, outcome, date) 

proj_plot_data <- proj_data %>%
    pivot_wider(names_from = quantile, values_from = value)

# Rename the quantiles
colnames(proj_plot_data) <- gsub(plot_quantiles[1], "low", colnames(proj_plot_data))
colnames(proj_plot_data) <- gsub(0.5, "median", colnames(proj_plot_data))
colnames(proj_plot_data) <- gsub(plot_quantiles[2], "high", colnames(proj_plot_data))





# NATIONAL PLOT -----------------------------------------------------------

st <- "US"

# INCIDENT
proj_plot_data %>% 
    filter(state==st) %>%
    filter(incid_cum=="inc") %>%
    plot_projections(st, projection_date, legend_rows=1, y_sqrt=FALSE)

# CUMULATIVE
proj_plot_data %>% 
    filter(state==st) %>%
    filter(incid_cum=="cum") %>%
    plot_projections(st, projection_date, legend_rows=1, y_sqrt=FALSE)



# STATE PLOTS -------------------------------------------------------------

states_ <- unique(proj_plot_data %>% filter(scenario_name != "ground truth") %>% pull(state))
states_ <- c("US", states_[states_!="US"])

# INCIDENT
p_inc <- proj_plot_data %>% 
    filter(state==states_[1]) %>%
    filter(incid_cum=="inc") %>%
    plot_projections(st, projection_date, legend_rows=1, y_sqrt=FALSE)
p_legend <- ggpubr::get_legend(p_inc)


pdf(plot_fname, width=8.5, height=11)
for(st in states_){
    # INCIDENT
    p_inc <- proj_plot_data %>% 
        filter(state==st) %>%
        filter(incid_cum=="inc") %>%
        plot_projections(st, projection_date, legend_rows=1, y_sqrt=FALSE)
    
    # CUMULATIVE
    p_cum <- proj_plot_data %>% 
        filter(state==st) %>%
        filter(incid_cum=="cum") %>%
        plot_projections(st, projection_date, legend_rows=1, y_sqrt=FALSE)
    
    title <- ggdraw() +
        draw_label(glue::glue("{st} -- {projection_date} - {team_model_name}"), fontface = 'bold', x = 0.5, hjust = .5) +
        theme(plot.margin = margin(0, 0, 0, 0))
    
    # Plot it all together
    plot(cowplot::plot_grid(
        title,
        p_legend,
        cowplot::plot_grid(
            p_inc + theme(legend.position = "none"), 
            p_cum + theme(legend.position = "none"),
            nrow=1), 
        ncol=1, rel_heights = c(.05,.1, 1)))
}
dev.off()

