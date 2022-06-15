
# Summary of results
We observed a steady drop of incident cases, hospitalization, and deaths in the first 8-9 week, followed by a substantial rebound in cases and hospitalization. There is a prominent 2nd peak from week 9 but gradually decline, before hitting another smaller peak due to new variant. Death dynamics has more temporal variability,
possibly due to system stochasticity (i.e., small death numbers compared to case and hospitalization).
Across all four simulated scenarios, restricted booster and introduction of new variant leads to the highest number of cases, hospitalization, and death, followed by restricted booster and no new variant. Broad booster with and without new variant do not differ much. 
# Explanation of observed dynamics given model assumptions
We suggest that broad vaccine booster has substantial impact on the overall dynamics that we observe (cases, hospitalization, and death) than introducing a new variant with higher immune escape. Broad booster not only reduces new infection but also reduces likelihood of transmission, hospitalization, and death. 
# Model assumptions
## Number/type of immune classes considered
We considered a single immune class with continuous waning level instead of discrete full/partial immune classes.
## Initial distribution of susceptibility if available
### Proportion of people that were infected with Omicron before June 15
Not explicitly modeled. However, the proportion can be estimated from cumulative prevalence of infection on historical data.
### Proportion of people that are naïve at start of projection (not vaccinated or infected)
Not explicitly modeled.
### Other
NA
## Initial variant characteristics (including Omicron transmissibility, immune escape, whether BA4/BA5 were considered and how uncertainty or non-identifiability was handled) 
Transmissibility, immune escape, hostalization, death rates are modeled as directed in the instruction. BA4/BA5 are not explicitly considered due to data-driven nature. However, BA4/BA5 cumulative prevalence in the population can be tracked via adding another variable when such data become available.
## Process for setting/calibrating P(hosp given current infection) and P(death given current infection)
Moving average of hospitalization and death rates across states are used to calibrate the model.
## Waning immunity details (e.g., distribution used)
Waning immunity is not explicitly modeled in this round 14.
## Seasonality implementation
Seasonality is applied via transfer learning from 2021 data.
## Emerging variant details (including introduction process and estimate of variant X emergence timing and variability)
Modeled as directed in the instruction (introduction number as daily new cases throughout the 16 week period).
## Nonpharmaceutical interventions 
NPI is modeled via transfer learning.
## Case ascertainment assumptions (including relation to infections, e.g., what value or values were used to translate to case estimates and how were they estimated)
We do not explicitly consider under-reporting (i.e., infection/case ratio) due to testing capacity or other constraints. 
## Other updates in model assumptions from previous rounds (e.g., changes in reporting outcomes due to Omicron)
Our model focuses on projecting reported cases, hospitalization, and death. We assume that hosptalization and death are more stable metrics of the COVID-19 pandemic. If necessary, "true incident cases" can be adjusted by applying an under-estimating rate from published studies.
