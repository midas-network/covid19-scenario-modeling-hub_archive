# Summary of results
We found that cumulative hospitalizations range from ~14,500 (Scenario B) to 43,500 (Scenario C). We found that cumulative deaths range from ~20,500 
(Scenario B) to ~28,500 (Scenario C). We found that greater virus severity dominated lower virus severity regardless of immune escape for cumulative
hospitalizations and deaths. We found that greater immune escape dominated lower immune escape regardless of severity for cumulative hospitalizations 
and deaths.   

# Explanation of observed dynamics given model assumptions
In the higher severity setting, infected individuals have a greater chance of hospitalization and subsequent death. This intuitively leads to 
increased cumulative hospitalizations and deaths. In the increased immune escape setting, more individuals are susceptible, leading to more 
hospitalizations and deaths opportunities. 

# Model assumptions
## Initial distribution of susceptibility
We incorporate underlying vaccination and booster that match with observed uptake. These inputs are populated with the latest observed uptake by county
and a forecasted uptake through July 1, 2022. We distribute cumulative cases, hospitalizations, and deaths as of July 1, 2021, at the county level to 
census tracts via the proportion of the population. We assume a case ascertainment rate of 33% for this initial seeding. We assume that all agents are 
equally to be vaccinated.

## Transmissibility
Transmission is seasonally parameterized to reported hospitalizations and deaths. We assume the transmission rate to be 15% greater than delta.

## Generation time
We do not modify any parameters relating to agents' time in any states from our original parameterization of the wild strain.

## Waning immunity assumptions
At the introduction of the omicron variant, we assume that all agents in the recovered state are eligible to move back to the susceptible state. The 
scenario governs the proportion that moves back to the susceptible state. We assume that this movement occurs uniformly over four weeks as Omicron
becomes dominant. After Omicron is dominant, our minimum waning immunity time is six months; therefore, no additional waning will occur within this 
short time horizon. 

## Other updates in model assumptions from previous rounds (e.g., changes in reporting outcomes due to Omicron)
No additional modeling assumptions were made.
