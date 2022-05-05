# Summary of results
Outbreaks are produced in all 4 scenarios; high levels especially in the new variant scenarios.

# Explanation of observed dynamics given model assumptions
-Our model predicts increase of cases even in short term projections (see forecast hub) 
-Fall seasonality affects projections 
-case ascertainment rate is expected to decline but decline is not implemented in the projections

# Model assumptions
## Number/type of immune classes considered
R (recovered) includes both vaccinated and infected individuals and these individual can't become infected upon contact with a case. The individuals in R however will progressively return to the susceptible group with a rate given by the waning distribution.

## Initial distribution of susceptibility if available

### Proportion of people that were infected with Omicron before March 13
Not available

### Proportion of people that are naïve at start of projection (not vaccinated or infected)
0%

### Other
20% of population is initially susceptible to non-variant strain.
The reproductive number Rt is inferred at the beginning of the simulation and is the same in scenario A and C. The two scenarios differ for the duration of immunity but we could not implement the difference in reduction of protection. 

## Initial variant characteristics (including Omicron transmissibility, immune escape, and how uncertainty or non-identifiability was handled) 
There is a single strain at the beginning.

## Process for setting/calibrating P(hosp given current infection) and P(death given current infection)
CFR (case-fatality rate) is calculated from cases and deaths reported by JHU. 
CFR (case-hospitalization rate) is calculated from cases reported from JHU and state-level hospitalization reported by HHS.
We applied a gamma distributed delay from cases to hospitalization and from cases to death.


## Waning immunity details (e.g., distribution used)
Exponential distribution.

## Seasonality implementation
The model has a spring/summer (-2% weekly from beginning of simulations for 3 months) and a fall/winter seasonal forcing on R0 (+2% weekly from Sept 15th for 3 months)

## Emerging variant details (including introduction process)
Cases introduced in state proportionally to population density.

## Nonpharmaceutical interventions 
No additional measure imposed (any residual measure is captured by inferred Rt).

## Other updates in model assumptions from previous rounds (e.g., changes in reporting outcomes, booster implementation)
Recovered compartment includes now both vaccinated and naturally infected individuals. 
