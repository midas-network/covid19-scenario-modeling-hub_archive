# Summary of results
In Round 12, similar to Round 11, the model projects upcoming peaks in all outcomes in all scenarios. In all scenarios, the peaks for national-level new cases happen around mid to late January,
hospitalizations peak late January to early February and deaths peak in mid Februray.
Their is a little difference between Scenario A and Scenario B (and C and D). However, the deaths and hospitalizations are significantly higher in Scenarios C and D (pessimistic severity) compared to A and B (optimistic severity).

# Explanation of observed dynamics given model assumptions
- There is little difference in Scenario A and B (also between C and D): The model takes the provided immune escape as input and learns the transmission rates. 
It turns out that in the low immune escape scenario, the susceptibility is high enough to cause a similar peak to the high immune escape scenario.
- Cases are identical in Scenario A and C (also B and D): The model does not account for reporting changes due to the severity of the disease. 
As provided in the scenarios, the severity only impacts hospitalizations and deaths.
- High peaks in deaths and hospitalization: Based on the model analysis, it is likely that for some states, the severity reduction is more than 70%. However, for this submission,
the severity reduction was set to the provided values. Therefore, the model may be over-predicting the deaths and hospitalization compared to the ground truth.

# Model assumptions
## Initial distribution of susceptibility
Susceptibility is identified over the whole time period since Jan 2020. The model explicitly accounts for various paths to partial immunity and the time at which it was acquired. 
These include (1) 1st time infections, (2) 2nd+ time infections, (3) infection after 2-doses, (4) infections after a booster, (5) 2-doses with no prior infection, 
(6) booster with no prior infection, (7) 2-doses with prior infection(s), and (8) booster with prior infection(s). 
Having these states over time, age groups, and variants allows for precise computation of immunity in the population at a given time. 
As a result, we can track new infections among the observed data that have protection from a prior immunity (from vaccine/booster/infection), while accounting for waning immunity.

## Transmissibility
Transmission rates are estimated for each age group and each variant separately. The estimation is based on the susceptibility on a given day and the new infections created in the recent weeks.
The model assumes that individuals infect others at a different rate depending on how long ago they were infected. Essentially, this creates a 2/3 element vector that is a 
discrete approximation of the distribution governing transmission.

## Generation time
Generation time is not explicitly calculated or specified. It is subsumed by the estimated transmission rates vector.

## Waning immunity assumptions
Three sets of hyperparameters were considered to account for waning immunity, each assumed to be equally likely. These are given below:
Waning sub-scenario 1
< 65: protection against infection 0.5, protection against hospitalization 0.9, protection against death 0.95
65+ : protection against infection 0.3, protection against hospitalization 0.8, protection against death 0.9

Waning sub-scenario 2
< 65: protection against infection 0.4, protection against hospitalization 0.8, protection against death 0.9
65+ : protection against infection 0.15, protection against hospitalization 0.75, protection against death 0.85

Waning sub-scenario 3
< 65: protection against infection 0.3, protection against hospitalization 0.7, protection against death 0.85
65+ : protection against infection 0, protection against hospitalization 0.7, protection against death 0.8

In all sub-scenarios, the mean transition time to transition to partially immune state is 0.5 years.

## Other updates in model assumptions from previous rounds (e.g., changes in reporting outcomes due to Omicron)
The model in the prior round used the transmission rates estimated in the prior three weeks to project into the future. 
Noting that, in this round, this would include high transmission rates due to the holiday/new year period, this model puts lower weight on the projections associated with it.
Apart from this and the explicitly provided changes in round 12, no other changes were made in the model.
