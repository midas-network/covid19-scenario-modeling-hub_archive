
# Summary of results
We observed a steady drop of incident cases, hospitalization, and deaths in the 8-9 week, before the new variant comes in. The waning has caused a large 2nd wave from week 9 but gradually decline to the level at the beginning of simulation.
Across all four simulated scenarios, pessimistic waning and introduction of new variant (scenario D) leads to the highest number of cases, hospitalization, and death, followed by pessimistic waning and no new variant (scenario C). Optimistic waning conditions do not differ much, regardless of new variant or not. 
# Explanation of observed dynamics given model assumptions
We suggest that waning immunity may have stronger effect on the overall dynamics that we observe (cases, hospitalization, and death) than introducing a new variant with higher immune escape. 
# Model assumptions
## Number/type of immune classes considered
We considered a single immune class with continuous waning level instead of discrete full/partial immune classes.
## Initial distribution of susceptibility if available
### Proportion of people that were infected with Omicron before March 13
Not explicitly modeled; can be estimated from cumulative prevalence of infection on 03/22/2022.
### Proportion of people that are naïve at start of projection (not vaccinated or infected)
Not explicitly modeled.
### Other
NA
## Initial variant characteristics (including Omicron transmissibility, immune escape, and how uncertainty or non-identifiability was handled) 
Same transmissibility of Omicron as before. Other characteristics modeled as directed in the instruction..
## Process for setting/calibrating P(hosp given current infection) and P(death given current infection)
Last 7d hospitalization and death rates are used as starting point to calibrate the model.
## Waning immunity details (e.g., distribution used)
Exponential distribution is used to model wanining immunity.
## Seasonality implementation
Seasonality is applied via transfer learning from 2021 data.
## Emerging variant details (including introduction process)
Modeled as directed in the instruction.
## Nonpharmaceutical interventions 
NPI is modeled via transfer learning.
## Other updates in model assumptions from previous rounds (e.g., changes in reporting outcomes due to Omicron)
We do not explicitly consider under-reporting due to testing capacity or other constraints. Our model focuses on projecting reported cases, hospitalization, and death. We assume that hosptalization and death are more stable metrics of the COVID-19 pandemic. If necessary, "true incident cases" can be adjusted by applying an under-estimating rate from published studies.
