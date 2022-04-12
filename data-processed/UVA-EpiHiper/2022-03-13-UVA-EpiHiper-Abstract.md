# Summary of results
1. The scenarios with new variant (B,D) have significantly larger number of cases/hospitalizations/deaths after summer 2022 than scenarios without (A,C).
2. There is only marginal difference between optimistic waning and pessimistic waning scenarios.
3. In the long run, incidence numbers remain at a level that depends on the scenario, with minor fluctuations.

# Explanation of observed dynamics given model assumptions
1. Although the new variant has the same intrinsic transmissibility as Omicron, immune escape means a more susceptible population (more people can be infected with larger probabilities).
2. We calibrate our model seperately for the optimistic waning and pessimistic waning scenarios, towards the same confirmed cases data. The calibrated disease transmissibility is higher for the optimistic waning scenarios. This reduces the difference of waning between scenarios in the projection too.
3. With waning and without vaccination beyond the third dose (booster), infected people keep returning to the waned states and getting reinfected.

# Model assumptions
## Number/type of immune classes considered
We consider the following classes: vaccinated (with 1 dose, 2 doses, booster), exposed to Omicron or a previous variant, exposed to variant X, and a class with waned immunity.

## Initial distribution of susceptibility if available
Initialization of susceptibility is based county level data of previous confirmed cases, age specific case ascertainment rate, state level data of prior vaccinations, and waning of immunity (from infection and/or vaccine). We initialize each individual to one of naively susceptible, vaccinated, partially susceptible (with waned immunity), and non-susceptible (currently or recently infected) states, depending on whether and when the individual is/was infected and/or vaccinated. The number of individuals in the partially susceptible state depends on the distribution of waning time which varies between scenarios.

### Proportion of people that were infected with Omicron before March 13
We only assume that all infections are Omicron at the beginning of the simulation (mid-Feb. 2022). We do not distinguish the variants of prior infections.

### Proportion of people that are naïve at start of projection (not vaccinated or infected)
The proportion of people that are naively susceptible at start of projection varies in different states. At national level, it is about 8%.

## Initial variant characteristics (including Omicron transmissibility, immune escape, and how uncertainty or non-identifiability was handled) 
We determine Omicron transmissibility by calibration, with noise added to the calibrated value to incorporate uncertainty. We implement immune escape as specified in the scenario description.

## Process for setting/calibrating P(hosp given current infection) and P(death given current infection)
We set hospitalization rate and fatality rate in our disease model through probabilities of state transitions (from exposed to symptomatic to hospitalization to death).

## Waning immunity details (e.g., distribution used)
We assume that immune waning has an exponential distribution with median of either 10 months or 4 months, depending on the scenario, for the time to transition to a partially susceptible state; the protection on nodes in the partially susceptible state is as specified in the scenario description.

## Seasonality implementation
We do not explicitly consider seasonality.

## Emerging variant details (including introduction process)
We divide 50 cases per week by the size of US population to get an individual level probability and use it in each state to sample the number of new variant cases introduced to that state in each week.

## Nonpharmaceutical interventions
We have modeled the following NPIs: (i) A fraction of the population chooses to reduce non-essential (shopping, religion, and other) activities. (ii) All K-12 schools are closed from mid-June 2022 to mid-August 2022 and again from late-December 2022 to the beginning of 2023; and face masks are used in school while schools are open. (iii) A fraction of symptomatic people choose to self-isolate themselves at home. Compliances are 15% on average for (i), 100% for (ii), and 75% for (iii).

## Other updates in model assumptions from previous rounds (e.g., changes in reporting outcomes, booster implementation)
We do not assume changes in reporting outcomes. We assume booster is 50% of fully vaccinated people and at most one round of booster is administered to anyone.
