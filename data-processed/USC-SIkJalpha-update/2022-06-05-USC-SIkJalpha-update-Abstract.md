# Summary of results
In all scenarios, peaks in all outcomes are observed September and October due to BA.5 and its sub-variants. These peaks are lower than the omicron peak in January. Past this peak, outcomes rise again, more quickly in B and D compared to A and C, respectively, driven by variant X and waning immunity. In scenarios C and D the rise is significantly lower than A and B due to the increased third booster coverage. Data until July 3, 2022 are used to generate the update.

# Explanation of observed dynamics given model assumptions
The data on BA.4 and BA.5 was limited in the previous submission resulting in uncertainty in their prevelance and growth advantages. This caused sharp surge in June. With a month of additional data the surge is gradual.

# Model assumptions
## Number/type of immune classes considered
The model explicitly accounts for various paths to partial immunity with infections and arbitrary number of vaccine doses and the time at which it was acquired. These include (1) 1st time infections, (2) 2nd+ time infections without any dose, (3) a dose without prior infection (4) infection after a dose, and a (5) dose after infection. The vaccine related states are (3)-(5) which are repeated for five doses (first, second, booster 1, booster2, and booster 3).

## Initial distribution of susceptibility if available
Susceptibility is identified over the whole period since Jan 2020 by keeping track of each of the states listed above. Having these states over time, age groups and variants allows for precise computation of immunity in the population at a given time. As a result, we can track new infections among the observed data that have protection from a prior immunity (from vaccine/booster/infection), while accounting for waning immunity.
### Proportion of people that were infected with Omicron before June 5
~ 58.36% of all infections
### Proportion of people that are naïve at start of projection (not vaccinated or infected)
~ 0

## Initial variant characteristics (including Omicron transmissibility, immune escape, whether BA4/BA5 were considered and how uncertainty or non-identifiability was handled) 
Ten variants are considered: BA.1, BA.1.1, BA.2, BA.2.12.1, BA.3, BA.4, BA.5, variant X, pre-omicron (all variants before the rise of omicron combined as one), and other (all other variants combined as one). All BA* except BA.4 and BA.5 are assumed to have 50% immune escape from the pre-omicron variant. BA.4 and BA.5 are assumed to be either 40% or 60% immune escape (contributing to uncertainty). Fixing the immune escape parameter, the model is able to learn the transmissibility of all the four omicron variants based on the observed data. Further, it is possible to get unusually large values for transmission of variants that have low prevalence but show significant growth advantage. We enforce that maximum transmiisibility of BA.5 cannot exceed that of the most transmissible among the rest of the BA*. Thus, the advantage is driven by immune escape property.

## Process for setting/calibrating P(hosp given current infection) and P(death given current infection)
Learned from observed data. The severity of X is set as provided in the scenarios. 

## Waning immunity details (including values used for the duration and level of protection against infection or symptomatic disease, whether a point estimate was used or a sample from the specified values, distribution used)
It is assumed that all waning happens through a time-dependent waning mechanism. The probability of transferring to a partially immune state by at time t is modeled as a gamma distribution such that: (i) the median is as per the scenario; (ii) the efficacy (given the partial immune protection against infection) after the first 60 days is the "initial" vaccine efficacy (e.g. 80% for 65+, 90% for <65). Protection against severe outcomes is derived from recently observed breakthrough surveillance data: < 65: protection against hospitalization 0.80, protection against death 0.91 65+ : protection against hospitalization 0.87, protection against death 0.93. Although, these numbers have no impact on the results as the severe outcome rates scales itself to account for this due to almost all population having protection due to vaccine or past infection.

## Seasonality implementation
None

## Emerging variant details (including introduction process and estimate of variant X emergence timing and variability)
It is assumed that 50 new weekly cases of the new variants are introduced distributed uniformly over seven days and proportional to state populations.

## Nonpharmaceutical interventions 
None

## Case ascertainment assumptions (including relation to infections, e.g., what value or values were used to translate to case estimates and how were they estimated)
Wastewater data is used as a proxy for true cases. The time-series is smoothed and then scaled so that "true cases" in first half 2021 matches that obtained through seroprevalence data. Future probability of reporting is assumed to be the ratio seen over the last two weeks. The medin reporting probability come out to be 0.34 across all the states.

## Other updates in model assumptions from previous rounds (e.g., booster implementation)
The model has been updated to accommodate arbitrary number of boosters.
