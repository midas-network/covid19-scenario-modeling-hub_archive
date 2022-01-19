# Summary of results
We observed a sharp increase of incident cases, hospitalization, and deaths in the first week, followed by gradual decline through the simulation period. After 4-6 weeks, the curves stablize at a much lower level.
Across all four simulated scenarios, pessimistic severity and low immune escape combination leads to the highest number of cases, hospitalization, and death, followed by pessimistic severity and high immune escape combination. Optimistic severity and high immune escape combination consistently yields the lowest numbers of projections.
# Explanation of observed dynamics given model assumptions
Given the recent surge of the Omicron variant across states and its duration, all four scenarios suggest that the current Omicron wave is peaking in a week or two and will be in the downwind path shortly. Pessimistic severity, given its specification, will lead to much higher virulence, resulting in much larger numbers of hospitalization and death. 
# Model assumptions
## Initial distribution of susceptibility
Initial distribution of susceptibility is set as all individuals in the state except recently infected or recovered. Boosted individuals will have a certain probability to be infected again by the Omicron variant (i.e., being susceptible).
## Transmissibility
Transmissibility is modeled as an interaction between both immune escape specifications and current Omicron dynamics. 
## Generation time
Generation time is implicitly modeled due to the data-driven nature of our model.
## Waning immunity assumptions
Waning immunity is implicitly modeled in both round #11 and #12.
## Other updates in model assumptions from previous rounds (e.g., changes in reporting outcomes due to Omicron)
We do not explicitly consider under-reporting due to testing capacity or other constraints. Our model focuses on projecting reported cases, hospitalization, and death. We assume that hosptalization and death are more stable metrics of the current Omicron wave. If necessary, "true incident cases" can be adjusted by applying an under-estimating rate.
