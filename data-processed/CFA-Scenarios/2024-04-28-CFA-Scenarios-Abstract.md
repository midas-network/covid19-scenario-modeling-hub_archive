# Summary of results 

For most states, under the specified scenarios and model assumptions, we project two COVID-19 waves in the next year.  The first wave is predicted more consistently, with a peak typically during September-October 2024.  When a second wave is projected, it it is more variable with regard to peak size and timing.   

Scenarios with a high immune escape variant result in a first peak that is typically about 25% higher than under the low immune escape assumption in our aggregated, US projection.  Given the scenarios considered here, over the course of the next year we project that booster uptake will on average avert 52k to 80k (95% PI) hospitalizations nationally under the high immune escape assumption, and 68k to 82k (95% PI) hospitalizations under the low immune escape assumption, if vaccine uptake is similar to last year. If low-risk individuals do not get vaccinated, the average hospitalizations averted would reduce to 38k to 59k (95% PI) and 47k to 63k (95% PI) under high and low immune escape scenarios, respectively. 

# Explanation of observed dynamics given model assumptions 

Because much of the first wave is projected to occur before the modeled booster campaign begins on September 1, 2024, the campaigns have a minimal effect on the timing or height of this peak.  In the latter part of this wave, and during the subsequent wave when one occurred, we see an impact due to vaccinations in the scenarios with booster uptake.   

# Model assumptions: please describe: 

We created state-specific COVID-19 burden projections using a deterministic, modified SEIS model with additional stratifications and partial immunity. Each infection state is stratified by age, immune history, vaccination history, waning status (for Susceptibles), and infecting strain (for all other compartments). 

External introductions of new variants are represented by introducing a small, transient new-variant infection hazard for 18- to 49-year-olds, over a one-month period.  We assume that new variants are introduced on average three months apart, with intrinsic infectiousness values sampled from the posterior distribution for previous strains for each state. 

## Initial distribution of susceptibility (if available) 

Inferred separately for each state during the fitting procedure. 

## Initial variant characteristics (transmissibility of variants at t=0, and how uncertainty or non-identifiability was handled) 

At t=0, only the three modeled ancestral strains are present (overwhelmingly dominated by JN.1), with transmissibility inferred separately for each state during the fitting procedure. 

## Details about calibration of immunity at t=0 (calibration period considered, assumptions about/fitting of past immune escape and waning immunity, is the same calibration process used for all scenarios?) 

State-based models are fit to 26 months of COVID-19 hospitalization, seroprevalence, and strain prevalence data. The U.S. model is an aggregate of the state models.   Cross-immunity between ancestral strains is inferred.  Protection against infection is strain-specific: past infection with a more similar variant, or vaccination with a better-matched vaccine, provides a higher level of protection against the challenging strain. The same posterior distribution samples are used for all scenarios. 

## Details about modeling of immune escape after t=0 (including how projected immune escape is handled in scenarios, e.g., whether a stepwise or continuous escape was considered) 

Immune escape happens when new variants are introduced.  One new variant is introduced at a uniform random time during each 3-month interval.  The immune escape of each successive variant compared to the last variant is calculated as $1 - (1 - IE)^{0.25}$, where $IE$ is the annual immune escape specified by the scenario. 

## Assumptions regarding waning immunity against infection and symptoms (including values used for the duration and level of protection against infection or symptomatic disease, whether a point estimate was used or a range, and distribution used) 

Waning of efficacy against infection is assumed to be approximately logistic, decreasing halfway from the initial to final value in about 6 months.  Initial heterotypic immunity is inferred, and eventually wanes down to 0.0.  Homotypic immunity always starts at 1.0, and wanes down to an inferred minimum, typically between 0.4 and 0.5.  Symptomatic disease is not explicitly modeled.  

## Assumptions regarding waning immunity against severe disease (including whether immunity against severe disease, conditional on infection, is fixed vs declines over time; and if it wanes, specify how) 

Immunity against severe disease conditional on infection is fixed and does not decline over time. This immunity is inferred separately for each state during the fitting procedure. 

## Assumptions regarding boosting effect from multiple infections
Immunogenic events (vaccinations and infections) boost immunity up to the level of the most relevant infection-based cross-immunity.  Multiple infections do not increase protection above the level of the most relevant previous infection, they merely reset the clock on waning.

## Is vaccination assumed to prevent infection and/or transmissibility?
Vaccination reduces the force of infection for a (partially) susceptible individual, and reduces the infection-hospitalization ratio, but does not affect onward transmissibility once infected.

## Describe the process used to set or calibrate disease severity, ie P(hosp given current infection) and P(death given current infection) details. What are the datasets used for calibration of the death targets? 

We infer the age group-specific infection hospitalization ratios separately for each state during the fitting procedure. Specifically, we fit the model to the weekly hospitalization data with an assumption that hospitalization lags infection by a week. Since we do not project death incidence, we did not calibrate the infection fatality ratios. 

## Seasonality implementation 

Seasonality is inferred by state, with a peak in seasonal forcing typically in late December, and amplitudes ranging between 4% and 15%.  We assume forcing follows a sine function with a 1-year period. 

## Details about modeling of age-specific outcomes, including assumptions on age-specific parameters (e.g., susceptibility, infection hospitalization risk or fatality risk, VE)
We assume age-structured mixing of the population, and infer infection-hospitalization ratios that are state- and age- specific.  We do not assume that there are inherent differences in susceptibility or immune competance based on age.

## Details about modeling of high-risk individuals, e.g., susceptibility and infection hospitalization risk or infection fatality risk, VE
High-risk individuals are not modeled explicitly.  Because we infer the IHR, it is not possible to tease apart high vs low risk IHR while keeping them coherent across fitting and projection periods. We use the fraction of high-risk individuals by state to determine vaccine uptake in the 65Boo scenarios.

## Is empirical data on human mobility or contact patterns used in the model?
We use age-structured contact matrices that were inferred from empirical data.

## Is there a background level of non pharmaceutical interventions? 

No NPIs are explicitly modeled. 

## Is importation from other countries considered?
We model external introductions to each state, but do not ascribe them to domestic versus international importation to the state.

## Other updates in model assumptions from previous rounds (e.g., demographic dynamics) 

This is our first submission. 
