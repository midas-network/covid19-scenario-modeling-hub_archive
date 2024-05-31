# System and library
rm(list = ls())
library(dplyr)

# Workflow
# Calculate census data by age group of interest
# The age groups include all the years included in the range:
#   - "0-4" include all the years from 0 to 4: 0, 1, 2, 3, and 4.
#   - "65-130" include all the years after 64 (not included).
#   - etc.
census_link <- 
  paste0("https://www2.census.gov/programs-surveys/popest/datasets/2020-2022/",
         "state/asrh/sc-est2022-agesex-civ.csv")
census_pop <- read.csv(census_link)
census_pop <- dplyr::mutate(
  census_pop,
  fips = gsub("00", "US", ifelse(nchar(STATE) < 2, paste0("0", STATE),
                                 as.character(STATE)))) %>%
  dplyr::filter(SEX == 0) %>%
  dplyr::select(fips, age = AGE, value = contains("POPEST2022")) 

census_agegroup <- lapply(c("0-64", "65-130", "0-130"), function(age_grp) {
  age_min = as.numeric(strsplit(age_grp, "-")[[1]][1])
  age_max = as.numeric(strsplit(age_grp, "-")[[1]][2])
  df <- dplyr::filter(census_pop, age >= age_min, age <= age_max)
  df_age_group <-  dplyr::group_by(df, fips) %>%
    dplyr::summarise(tot_pop = sum(value), .groups = "keep")  %>%
    dplyr::ungroup() %>%
    dplyr::mutate(age_group = age_grp)
  return(df_age_group)
}) %>% bind_rows()

### Update column to match "locations.csv" files
df_loc <- read.csv("data-locations/locations.csv")
df_loc <- dplyr::select(df_loc, -population)

df_loc_2022 <- dplyr::select(census_agegroup, location = fips, 
                             population = tot_pop, age_group) 
df_loc_2022 <- dplyr::right_join(df_loc_2022, df_loc, by = "location")

write.csv(df_loc_2022, "data-locations/locations_2022.csv", 
          row.names = FALSE)
