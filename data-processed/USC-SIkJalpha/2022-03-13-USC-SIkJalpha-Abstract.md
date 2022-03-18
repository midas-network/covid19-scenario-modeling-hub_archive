# Summary of results
The projection shows a significant resurgence in scenarios B and D due to the introduced variants. However, at the national level, the peaks remain below the omicorn peak and is more comparable to the delta wave in cases. In the scenarios without the variant, the optimistic waning produces a flatter projection compared to the pessimistic scenario. A slight surge at the end of the projection period is more prominent in the optimistic waning scenario. The peaks in hospitalizations and deaths remain at or below the delta peak at the national level for all scenarios.

# Explanation of observed dynamics given model assumptions
It is to be noted that the infection rates and death/hospitalization rates are estimated from the observed data by fixing the waning parameters. As a result, the estimated rates are different for optimistic and pessimistic scenarios.  To fit the observation, optimistic waning would require a higher transmission rate compared to pessimistic waning. Hence, the projections do not differ only by the waning parameters but also have different infection and death/hospitalization rates.


# Model assumptions
## Number/type of immune classes considered
The model explicitly accounts for various paths to partial immunity and the time at which it was acquired. These include (1) 1st time infections, (2) 2nd+ time infections, (3) infection after first dose, (4) infection after 2-doses, (5) infections after a booster, (6) first with no prior infection, (7) 2-doses with no prior infection, (8) booster with no prior infection, (9) first dose with prior infection(s) (10) 2-doses with prior infection(s), and (11) booster with prior infection(s). 
## Initial distribution of susceptibility
Susceptibility is identified over the whole period since Jan 2020 by keeping track of each of the states listed above. Having these states over time, age groups and variants allows for precise computation of immunity in the population at a given time. As a result, we can track new infections among the observed data that have protection from a prior immunity (from vaccine/booster/infection), while accounting for waning immunity.
### Proportion of people that were infected with Omicron before March 13
~39.77% of all infections
### Proportion of people that are naïve at start of projection (not vaccinated or infected)
8.76% - 11.19%
It is likely to be an overestimate as the reporting ratios are determined based on infection-induced seroprevalence data. These numbers are slightly higher than those observed in infection+vaccine induced seroprevalence from the CDC data. Further non-trivial changes in the model will be needed to calibrate with this data.
## Initial variant characteristics (including Omicron transmissibility, immune escape, and how uncertainty or non-identifiability was handled) 
Four variants are considered to be categorized as "Omicron": BA.1, BA1.1, BA.2, and BA.3. They are all assumed to have 50% immune escape property from the pre-omicron variants (combined into a single variant called "pre-omicron"). Fixing the immune escape parameter, the model is able to learn the transmissibility of all the four omicron variants based on the observed data.

## Process for setting/calibrating P(hosp given current infection) and P(death given current infection)
Learned from observed data. The severity reduction of Omicron variants compared to the delta is considered to be 70%. Although, this choice does not impact the projections.


## Waning immunity details
It is assumed that all waning happens through a time-dependent waning mechanism. The probability of transferring to a partially immune state by at time t is modeled as a gamma distribution such that: (i) the median is as per the scenario; (ii) the efficacy (given the partial immune protection against infection) after the first 60 days is the "initial" vaccine efficacy (e.g. 80% for 65+, 90% for <65). Protection against severe outcomes is derived from recently observed breakthrough surveillance data:
< 65: protection against hospitalization 0.80, protection against death 0.91
65+ : protection against hospitalization 0.87, protection against death 0.93


## Seasonality implementation
Contact rates changes over the year are derived from Cuebiq contact data.

## Emerging variant details (including introduction process)
It is assumed that 50 new weekly cases of the new variants are introduced distributed uniformly over seven days and proportional to state populations.

## Nonpharmaceutical interventions 
None

## Other updates in model assumptions from previous rounds (e.g., changes in reporting outcomes, booster implementation)
None.
