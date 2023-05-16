
# Summary of results
In general, the simulated results showed that COVID-19 probably entered endemic stage in the U.S. regardless of scenarios. There were a few seasonal surges, but the magnitudes were not as high as previous outbreaks during the epidemic stage (especially Omicron wave). COVID-related hospitalization and death were extinct in a few states, probaby due to system stochasticity (e.g., similar to the early stages of a birth-death Markovian process). Vaccination definitely brought hospitalization and death down, but it seemed that the effect from immune evasiveness overshadowed the effects from vaccination. In addition, we observed seasonality, but it was probably due to how the model handled seasonality in model structure. Overall, the variability of the results (e.g., range of estimates) seemed low, probably due to the more deterministic structure of the model (a simpler exponential curve fitting method to produce baseline predictions compared to much more complicated and nonlinear LSTM model in several previous rounds).
# Explanation of observed dynamics given model assumptions
We suggest that the high immune evasive sceanrio (50% per year) produced a substantial number of cases, which caused increase in hospitalization and death in the later stages of simulation. Vaccination helped bring these number down across states. Providing annual booster to all individuals reduced hospitalization and death compared to 65+ only, but the differences between the two scenarios (all vs 65+) were not substantial . Perhaps economic factors should be further considered for more informed decisions on annual booster vaccine campaigns in 2023 and 2024. 
# Model assumptions
## Number/type of immune classes considered
We considered a single immune class with continuous waning level instead of discrete full/partial immune classes.
## Initial distribution of susceptibility if available
### Proportion of people that were infected with Omicron
Not explicitly modeled. However, the proportion can be estimated from cumulative prevalence of infection on historical data.
### Proportion of people that are naïve at start of projection (not vaccinated or infected)
Not explicitly modeled but we don't believe there were any people not vaccinated nor infected at the beginning of the simulation.
### Other
NA
## Initial variant characteristics (including Omicron transmissibility, immune escape, and how uncertainty or non-identifiability was handled) 
Transmissibility, immune escape, hostalization, death rates were modeled as directed in the instruction. 
## Process for setting/calibrating P(hosp given current infection) and P(death given current infection)
Moving average of hospitalization and death rates in past 10 days (short-term) as well as over the entire span (long-term) across states are used to calibrate the model.
## Waning immunity details (including values used for the duration and level of protection against infection or symptomatic disease, whether a point estimate was used or a sample from the specified values, distribution used)
Waning immunity was modeled as exponential decay function over time.
## Seasonality implementation
Seasonality was estimated from 2020-2021 data prior to Omicron wave.
## Emerging variant details (including introduction process and estimate of variant X emergence timing and variability)
Not modeled explicitly, as directed.
## Nonpharmaceutical interventions 
NPI was not modeled explicitly, as directed.
## Case ascertainment assumptions (including relation to infections, e.g., what value or values were used to translate to case estimates and how were they estimated)
We did not explicitly consider under-reporting (i.e., infection/case ratio). This model only tracked reported cases. However, if necessary, an adjustment parameter (under-reporting rate) could be applied. 
## Other updates in model assumptions from previous rounds (e.g., changes in reporting outcomes due to Omicron)
System stochasticity was modeled as random walk in conjunction with seasonality and projected cumulative case trajectory from exponential curve fitting.
