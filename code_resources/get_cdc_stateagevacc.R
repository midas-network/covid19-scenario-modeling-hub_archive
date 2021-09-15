

# This code pulls the age-specific vaccination data from the CDC API



save_dir <- "data/vaccination"
dir.create(save_dir, recursive = TRUE)


## ADD Data from CDC on ages available
vacc_us <- read_csv("https://data.cdc.gov/api/views/unsk-b7fc/rows.csv?accessType=DOWNLOAD")
vacc_us <- vacc_us %>% select(Date, MMWR_week, Location, contains("Administered_Dose1_")) %>%
    mutate(date = lubridate::as_date(lubridate::mdy(Date))) %>% select(-Date) %>% select(date, dplyr::everything()) %>%
    rename(USPS = Location)
vacc_us <- vacc_us  %>%
    mutate(Administered_Dose1_Pop_Pct = Administered_Dose1_Pop_Pct / 100,
           Administered_Dose1_Recip_65PlusPop_Pct = Administered_Dose1_Recip_65PlusPop_Pct / 100,
           Administered_Dose1_Recip_12PlusPop_Pct = Administered_Dose1_Recip_12PlusPop_Pct / 100,
           Administered_Dose1_Recip_18PlusPop_Pct = Administered_Dose1_Recip_18PlusPop_Pct / 100) %>%
    mutate(pop12plus = round(Administered_Dose1_Recip_12Plus / (Administered_Dose1_Recip_12PlusPop_Pct)),
           pop18plus = round(Administered_Dose1_Recip_18Plus / (Administered_Dose1_Recip_18PlusPop_Pct)),
           pop65plus = round(Administered_Dose1_Recip_65Plus / (Administered_Dose1_Recip_65PlusPop_Pct)),
           pop0to100 = round(Administered_Dose1_Recip / (Administered_Dose1_Pop_Pct)),
           pop0to64 = pop0to100 - pop65plus,
           pop18to64 = pop18plus - pop65plus,
           Administered_Dose1_Recip_12to17 = Administered_Dose1_Recip_12Plus - Administered_Dose1_Recip_18Plus,
           Administered_Dose1_Recip_18to64 = Administered_Dose1_Recip_18Plus - Administered_Dose1_Recip_65Plus,
           Administered_Dose1_Recip_0to64 = Administered_Dose1_Recip - Administered_Dose1_Recip_65Plus) %>%
    mutate(pop12to17 = pop12plus - pop18plus,
           Administered_Dose1_Recip_12to17Pop_Pct = Administered_Dose1_Recip_12to17 / pop12to17,
           Administered_Dose1_Recip_18to64Pop_Pct = Administered_Dose1_Recip_18to64 / pop18to64,
           Administered_Dose1_Recip_0to64Pop_Pct = Administered_Dose1_Recip_0to64 / pop0to64,
           Administered_Dose1_Recip_0to100Pop_Pct = Administered_Dose1_Recip / pop0to100) %>%
    mutate(Administered_Dose1_Recip_12to17Pop_Pct = replace(Administered_Dose1_Recip_12to17Pop_Pct, Administered_Dose1_Recip_12Plus<=0 | Administered_Dose1_Recip_12to17<=0, 0),
           Administered_Dose1_Recip_12to17 = replace(Administered_Dose1_Recip_12to17, Administered_Dose1_Recip_12Plus<=0 | Administered_Dose1_Recip_12to17<=0, 0)) %>%
    rename(Administered_Dose1_Recip_0to100 = Administered_Dose1_Recip)

vacc_us_admin <- vacc_us %>%
    mutate(dose1 = Administered_Dose1_Recip_0to100) %>%
    select(date, USPS, dose1, contains("Administered_Dose1_Recip")) %>%
    pivot_longer(contains("Administered_Dose1_Recip"),
                 names_to = c("var"),
                 names_pattern = "Administered_Dose1_Recip_(.+)",
                 values_to = "estimate") %>%
    mutate(type = ifelse(grepl("Pop_Pct", var), "prop_vacc_age", "dose1_age")) %>%
    mutate(var = gsub("Pop_Pct", "", var)) %>%
    pivot_wider(names_from = "type",
                values_from = "estimate") %>%
    mutate(var = gsub("Plus","_100", var),
           var = gsub("to", "_", var)) %>%
    rename(age_group = var) %>%
    separate(age_group, c("age_l","age_r"), remove=FALSE)

vacc_us_pop <- vacc_us %>%
    select(date, USPS, starts_with("pop")) %>%
    pivot_longer(starts_with("pop"),
                 names_to = c("var"),
                 names_pattern = "pop(.+)",
                 values_to = "pop") %>%
    mutate(var = gsub("plus","_100", var),
           var = gsub("to", "_", var)) %>%
    rename(age_group = var) %>%
    separate(age_group, c("age_l","age_r"), remove=FALSE)

vacc_cdc <- full_join(vacc_us_pop, vacc_us_admin) %>%
    mutate(age_l = as.integer(age_l),
           age_r = as.integer(age_r),
           #prop_vacc_age = round(as.double(prop_vacc_age/100),3),
           source="CDC")

write_csv(vacc_cdc, paste0(save_dir, "/vaccination_cdc_", Sys.Date(), ".csv"))

