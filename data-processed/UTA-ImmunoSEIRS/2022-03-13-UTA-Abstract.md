# Summary of results
The projections predict that there will be a new surge at the beginning of fall 2022 for scenario D. In scenario C, cases, hospitalizations, and deaths will start to rise again by the end of 2022. New cases, hospital admissions and deaths will remain extremely low in scenario A until the end. While they will the number of cases will start to increase by the end of the projection period in scenario B. 

 
# Explanation of observed dynamics given model assumptions
It is expected that the number of hospitalizations to be lower in Scenario A and B, where Omicron IHR is 70% lower. The fact that Scenario C and D yields lower levels of deaths is due to the effect of immune escape against hospitalizations and deaths.
# Model assumptions
We use a novel stochastic age-structured SEIRS model that explicitly tracks the changes in immunity acquired from natural infection and vaccination. Population-level immunity changes depending on natural infection rates, vaccination rates, and the waning of immunity, and we modulate  transmission rates, symptomatic rates, hospitalization rates, and mortality rates, according to population immunity and the specific characteristics of the circulating variant. We initialize our model on August 14, 2021 using seroprevalence and vaccination data up to that date, and fit the transmission, hospitalization, and mortality rates to statewise data up to January 10, 2022.

References for our projections of the impact of Omicron on the US using the same model:
- Bouchnita, Anass, et al. "COVID-19 Scenario Projections: The Emergence of Omicron in the US-January 2022." (2022).


## Transmissibility
We fit a double strain model to estimate R0 for each immune escape levels, using available US data on Omicron growth rate. We have considered the following estimates for Omicron relative transmissibility:
- in the how immune escape scenario, we consider that Omicron is 105% more transmissible.

## Severity
- We assume that Omicron has 33% lower intrinsic severity than Delta. The death rate is also decreased by 33%.

## Generation time
The incubation period for Omicron is shortened to 3 days with Omicron.

## Waning immunity assumptions
Waning duration follows scenario specifications.

## Other updates in model assumptions from previous rounds (e.g., changes in reporting outcomes due to Omicron)
Booster doses are assumed to provide higher protection than primary series.