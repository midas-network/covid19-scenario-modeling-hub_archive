# Summary of results
Our projections predict that the emergence of variant X will coincide with a surge driven by BA.4/BA.5 emergence and Omicron-derived immunity waning. The magnitude of this surge will depend on the history of immunization and infection in each state. Variant X is expected to prolongate the duration of the wave and delay the decrease of infections in some states. It can also cause new waves in other states. In particular, we notice that in general, the states that were not affected by the BA.4/BA.5 surge will be the most vulnerable to variant X. That's because they did not build a sufficient level of population-immunity to contain the emergence of variant X. 

We project that the broarder booster administration will help in bringing the cases down rapidly upon the emergence of variant X, but the epidemic will take off again when the boosting campaign is complete. In the absence of variant X, we project that the number of cases will remain low until the end of the projection period. Although we observe signs of a new surge in May 2023 in most states.

# Explanation of observed dynamics given model assumptions
The emergence of variant X will take place during the peak of the infection wave caused by BA.4/BA.5. As a result, there will be a high level of immunity in the population which will reduce the impact of variant X in some states. Due to the immune escape of variant X to Omicron-derived immunity, a portion of individuals who got infected during the BA.4/BA.5 wave or the previous Omicron surges will be reinfected with variant X. This will delay the fall of cases, hospital admissions, and deaths. In the states where the initial level of immunity are high, it is expected that the emergence of BA.4/BA.5 will not cause a big surge. However, these states will be most vulnerable to variant X, because the levels of population-immunity will be low at that moment. 
 
The expanded booster coverage is effective in bring the cases down. However, it will also prevent the development of immunity derived from variant X infections. This type of population-mmunity is expected to be more effective in preventing infections with variant X. Thus, we project that the epidemic will take off as soon as the booster campaign stops because of the short waning period of immunity acquired by the boosters. The same dynamics is observed when the continued risk-focused booster is considered. However, the effectiveness of the booster campaign in bringing the number of infections down will be reduced. But this will help build more variant X-infection derived immunity which will slow down the growth of infections.

# Model assumptions
## Number/type of immune classes considered
We are using a new class of epidemiological models that explicitly tracks the level of population-immunity in the population and its impact of the susceptibility and severity of the circulating variants. In the current version of the model, we are considering fourteen types of of protection levels: seven against infection and seven against severe disease. The source of these immunities are as follows:
	- infections with Omicron BA.1,
	- infections with BA.2,
	- infections with BA.2.12.1,
	- infections with BA.4/BA.5,
	- infections with variant X,
	- primary vaccination,
	- booster vaccination (both first and second boosters).

## Initial distribution of susceptibility if available
### Proportion of people that were infected with Omicron before June 15
In the USA, the model estimates that around 62.5% of the population were infected at least once by an Omicron variant by June 15.

### Proportion of people that are naïve at start of projection (not vaccinated or infected)
We fit the model to cases, hospital admissions, and deaths from Feb 22 to May 28, 2022. We use the CDC data from on the Nationwide COVID-19 Infection-Induced Antibody Seroprevalence to estimate the level of population-immunity from infections in each state on Feb 22, 2022. Then, we calculate the level of vaccination-derived population-immunity in each state, using available data for primary and booster vaccination coverages. 

### Other
N/A

## Initial variant characteristics (including Omicron transmissibility, immune escape, whether BA4/BA5 were considered and how uncertainty or non-identifiability was handled) 
We parameterized the variant characteristics according to best literature estimates on transmissibility, immune escape, and severity. In case of uncertainty, we have used the estimates which provided the most accurate predictions in our previous projections. 

We assume that BA.1 is 155% more transmissible than Delta, and has 42.5%, 32%, 22% chances to escape protection against infection, hospitalization, and death, respectively, gained from infections with pre-Omicron variants and primary vaccination. We assume that BA.2 is 40% more transmissible than BA.1. We consider that BA.2.12.1 has 30% chances to escape protection against infection, gained from BA.1 and BA.2 infections. Lastly, we assume that BA.4/BA.4 have 40% chance to escape protection against infection, gained from all previous Omicron infections.

## Process for setting/calibrating P(hosp given current infection) and P(death given current infection)
In the fitting period, we have considered the rate of hospitalization and death follow polynomial functions that we fit to data using the least square method. In the projection period, we keep the last estimate for both the hospitalization and death rates.

## Waning immunity details (including values used for the duration and level of protection against infection or symptomatic disease, whether a point estimate was used or a sample from the specified values, distribution used)
The model considers exponential decay for the waning of all immunity types. We assume a half-life time for the waning of immunity derived from vaccination equal to 6 months against infection and 12 against severe disease. We assume that booster-derived immunity wanes with a half-life time equal to 3 months and 8 months for protections against infection and severe disease, respectively. The half-life time of the immunity derived from natural infection with all variants is assumed to be 4 months for protection against infection and 8 against severe disease. 

## Seasonality implementation
We don't assume any seasonal effect, except for the school closure from June to August of every year, and from December 18, 2022 to January 2, 2023.

## Emerging variant details (including introduction process and estimate of variant X emergence timing and variability)
The growth function for the proportion of infections with variant X is calculated using a separate toy multi-strain SEIRS model. The model is parameterized using estimate for population-immunity in the US derived from the main model. One limitation of the current implementation is that we use the same growth function for variant X for all states.

## Nonpharmaceutical interventions 
We do not consider any non-pharmaceutical interventions in the projections.

## Case ascertainment assumptions (including relation to infections, e.g., what value or values were used to translate to case estimates and how were they estimated)
We consider a baseline reporting level of 20%, which means that one out of every five infections is reported. However, we this ratio can change depending on the level of immunity in the population. Indeed, when immunity increases, there are fewer symptomatic cases and therefore less reported infections.

## Other updates in model assumptions from previous rounds (e.g., booster implementation)
The new version incorporates the new variants BA.2.12.1, BA.4/BA.5, and X. At the moment, we do not make difference between the first and second boosters because we assume that newly boosted individuals have the same level of protection regardless of the booster order.
