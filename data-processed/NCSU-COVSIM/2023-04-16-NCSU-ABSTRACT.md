# Summary of results
The following projections were made for North Carolina. For the 2 year period starting April 16th, 2023, we found that cumulative hospitalizations could range from ~27,200 (Scenario E) to ~33,000 (Scenario B). We also found that cumulative deaths could range from ~3,970 (Scenario E) to ~5,060 (Scenario B). Additionally, we found that differences between scenarios where greater when comparing immune escape levels in comparison to vaccination uptake.

# Explanation of observed dynamics given model assumptions
In the higher immune escape settings, individuals have a greater chance of being infected. This intuitively leads to higher hospitalization and subsequent death during infection peaks relative to low immune escape scenarios. In low immune escape settings, higher vaccination uptake has a greater impact in preventing hospitalizations and deaths.

# Model assumptions: please describe:
## Number/type of immune classes considered
We model 3 types of immunity: naively susceptible, recovered, and susceptible but previously infected. The susceptible but previosly infected have additional protection from symptomatic disease and severe outcomes.

## Initial distribution of susceptibility (if available)
We assume aproximately 45% of population is susceptible by October 1st, 2022. This was estimated considering a mortality rate of 0.125% and an ascertainment rate of cases of 35% for
the Omicron variant.

## Initial variant characteristics (transmissibility of variants at t=0, and how uncertainty or non-identifiability was handled)
We consider only a single strain. The transmission characteristics were derived over the fitting period, when fitting to hospitalizations and deaths. We use previously fitted transmission parameters for previous omicron variants as reference during this process. 

## Details about calibration of immunity at t=0 (calibration period considered, assumptions about/fitting of past immune escape and waning immunity, is the same calibration process used for all scenarios?)
Scenario A was calibrated, and this calibration was used for all scenarios. Given the relatively short time scale of the calibration window relative to the time required to observe the impacts of different waning immunity parameters this did not cause issues for our calibration.  

## Details about modeling of immune escape after t=0 (including how projected immune escape is handled in scenarios, e.g., whether a stepwise or continuous escape was considered)
We model a stepwise escape of immunity. Immunity escape was occuring constantly over the time horizon rather multiple variant waves. It was implemented in a similar way to the waning immunity. If an agent was randomly selected for undergo immunity escape rather than waning immunity, which was conditional on the probability of immune escape specified by the scenario and the randomly generated waning immunity time, then the agent would escape returning to the susceptible state randomly within the next year. If an agent had a shorter time to wane through random waning immunity than through random immune escape then the waning would happen first.    

## Assumptions regarding waning immunity against infection and symptoms (including values used for the duration and level of protection against infection or symptomatic disease, whether a point estimate was used or a range, and distribution used)
We assume agents immunity from vaccination and infection will wane after a random amount of time following a uniform distirbtion [60,420]. Until this waning occurs they are immune from infection. After this time they return to the susceptible state; however, they now have an additional 40% additional protection from symtoms in the future.

## Assumptions regarding waning immunity against severe disease (including whether immunity against severe disease, conditional on infection, is fixed vs declines over time; and if it wanes, specify how)
We assume that once infected individuals have a constant reduction in the probability of hospitalization and death.

## Describe the process used to set or calibrate disease severity, ie P(hosp given current infection) and P(death given current infection) details. What are the datasets used for calibration of the death targets?
We fit the disease severity disease parameters in a two step process. First we tune the probability of hospitalization given symptomatic infection by fitting to the number of people hospitalized from the NC DHHS by iteratively searching and refining parameter estimates over a grid space. Given the fit hospitalizations, the probability of death given hospialization is fit following a parameter grid search. We use NC DHHS deaths for calibration.

## Seasonality implementation
Children and teens contacts are reduced in the summer to model schools not being in session. There is a seasonal increase in transmission during the winter months.

## Is there a background level of non pharmaceutical interventions?
There is a small background percent of masking in the simulation. 

## Other updates in model assumptions from previous rounds (e.g., demographic dynamics)
