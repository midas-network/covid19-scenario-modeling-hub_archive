# Summary of results
We observed a steady drop of incident cases, hospitalization, and deaths in the 8-9 week, before the new variant comes in. The waning has caused a large 2nd wave from week 9 but gradually decline to the level at the beginning of simulation.
Across all four simulated scenarios, pessimistic waning and introduction of new variant (scenario D) leads to the highest number of cases, hospitalization, and death, followed by pessimistic waning and no new variant (scenario C). Optimistic waning conditions do not differ much, regardless of new variant or not. 
# Explanation of observed dynamics given model assumptions
We suggest that waning immunity may have stronger effect on the overall dynamics that we observe (cases, hospitalization, and death) than introducing a new variant with higher immune escape. 
# Model assumptions
## Initial distribution of susceptibility
Initial distribution of susceptibility is set as all individuals in the state except recently infected or recovered. Boosted individuals will have a certain probability to be infected again by the Omicron variant (i.e., being susceptible).
## Transmissibility
Transmissibility is modeled as an interaction between both immune escape specifications and waning mmunity. 
## Generation time
Generation time is implicitly modeled due to the data-driven nature of our model.
## Waning immunity assumptions
Waning immunity is implicitly modeled in both round #11 and #12.
## Other updates in model assumptions from previous rounds (e.g., changes in reporting outcomes due to Omicron)
We do not explicitly consider under-reporting due to testing capacity or other constraints. Our model focuses on projecting reported cases, hospitalization, and death. We assume that hosptalization and death are more stable metrics of the COVID-19 pandemic. If necessary, "true incident cases" can be adjusted by applying an under-estimating rate from published studies.
