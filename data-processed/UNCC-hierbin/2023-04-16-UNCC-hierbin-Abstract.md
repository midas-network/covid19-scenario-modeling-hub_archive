
# Summary of results
In general, the simulated results showed that COVID-19 probably entered endemic stage in the U.S. regardless of scenarios. There were a few seasonal surges, but the magnitudes were not as high as previous outbreaks during the epidemic stage (especially Omicron wave). COVID-related hospitalization and death were extinct in a few states, probaby due to system stochasticity (e.g., similar to the early stages of a birth-death Markovian process). Vaccination definitely brought hospitalization and death down, but it seemed that the effect from immune evasiveness overshadowed the effects from vaccination. In addition, we observed seasonality, but it was probably due to how the model handled seasonality in model structure. Overall, the variability of the results (e.g., range of estimates) seemed low, probably due to the more deterministic structure of the model (a simpler exponential curve fitting method to produce baseline predictions compared to much more complicated and nonlinear LSTM model in several previous rounds).
# Explanation of observed dynamics given model assumptions
We suggest that the high immune evasive sceanrio (50% per year) produced a substantial number of cases, which caused increase in hospitalization and death in the later stages of simulation. Vaccination helped bring these number down across states. Providing annual booster to all individuals reduced hospitalization and death compared to 65+ only, but the differences between the two scenarios (all vs 65+) were not substantial . Perhaps economic factors should be further considered for more informed decisions on annual booster vaccine campaigns in 2023 and 2024. 
# Model assumptions
## Number/type of immune classes considered
We considered a single immune class with continuous waning level (modeled as an exponentially decay function with time) instead of discrete full/partial immune classes.
## Initial distribution of susceptibility (if available)
Not explicitly modeled. However, the proportion could be estimated from cumulative prevalence of infection on historical data, if necessary.
We don't believe there were any people not vaccinated nor infected at the beginning of the simulation. This was addressed in waning immunity and immune escape sections below.
## Initial variant characteristics (transmissibility of variants at t=0, and how uncertainty or non-identifiability was handled) 
Transmissibility, immune escape, hostalization, death rates were modeled as directed in the instruction. Transmissibility at t=0 was estimated from exponential curve fitting with additional calibration on incident case data (i.e., no sudden "jumps" between last observed data and first simulated data).
## Details about calibration of immunity at t=0 (calibration period considered, assumptions about/fitting of past immune escape and waning immunity, is the same calibration process used for all scenarios?)
Population-level immunity was modeled implicitly. We used the past 10d data for calibration and it was consistent across all six scenarios.
## Details about modeling of immune escape after t=0 (including how projected immune escape is handled in scenarios, e.g., whether a stepwise or continuous escape was considered)
Continuous immune escape was modeled at population level, similar to how waning immunity was modeled mathematically. Different scenarios shared same immune escape mechanism but different parameterization.
## Assumptions regarding waning immunity against infection and symptoms (including values used for the duration and level of protection against infection or symptomatic disease, whether a point estimate was used or a range, and distribution used)
Waning immunity was modeled as exponential decay function over time at population level. Values were used as directed by the SMH round 17 instruction. Additional system stochasticity (e.g., distribution of current waning/protection level, eventual levels of protection against infection) was included in the model.
## Assumptions regarding waning immunity against severe disease (including whether immunity against severe disease, conditional on infection, is fixed vs declines over time; and if it wanes, specify how)
Waning immunity was also modeled as exponential decay function over time at population level against hospitalization and death. Additional system stochasticity (e.g. levels of protections) was included in the model.
## Describe the process used to set or calibrate disease severity, ie P(hosp given current infection) and P(death given current infection) details. What are the datasets used for calibration of the death targets?
Both long-term (starting from Omicron wave in 2022) and short term (10d) data were used to calibrate hospitalization and death rate as the initial condition for simulation. 
## Seasonality implementation
Seasonality was estimated from 2020-2022 data for two years to develop a trigonometric kernel for projection the next two years.
## Is there a background level of non pharmaceutical interventions?
NPI was not modeled explicitly, as directed.
## Other updates in model assumptions from previous rounds (e.g., changes in reporting outcomes due to Omicron)
Additional system stochasticity was modeled as random walk in conjunction with seasonality and projected cumulative case trajectory from exponential curve fitting. No demographic dynamics modeled in this round.
