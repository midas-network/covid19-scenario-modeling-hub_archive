
# Summary of results
The results show higher incidences for the higher immune escape scenario. The median peaks are distributed around the prior peaks in 2022. For lower immune escape scenarios, the median peaks are at or below the 2022 peaks. Fixing the immune escape, vaccination brings the severe outcomes down as expected. At the national level, for low immune escape and the "All booster" scenario, almost all individual runs produce a peak at or under the 2022 peaks.

# Explanation of observed dynamics given model assumptions
Various hyper-parameters were used to generate the individual runs, of which waning immunity seemed to create the most significant differences.  Some runs did not calibrate well with the recently seen data and were removed. The peaks of individual runs occur at various times at various severity, showing 2-3 peaks per year. However, the median time-series shows one peak per year during the winter.

# Model assumptions: please describe:
## Number/type of immune classes considered
The model explicitly accounts for various paths to partial immunity and the time at which it was acquired. These include (1) 1st time infections, (2) 2nd+ time infections, (3) infection after a dose, (4) a dose with no prior infection or from a previous dose, (5) a dose after infection. We keep track of sequential doses of the first, second, and two boosters with separate time-series. The next boosters are considered to be on the same time-series as the second booster.

## Initial distribution of susceptibility (if available)
N/A

## Initial variant characteristics (transmissibility of variants at t=0, and how uncertainty or non-identifiability was handled)
Transmission rates are estimated based on infection time-series estimates and genomic surveillance. The contact matrix is estimated from the age-wise split of reported cases. The rest of the parameters are assumed to occur across a reasonable range and they contribute to uncertainty.

## Details about calibration of immunity at t=0 (calibration period considered, assumptions about/fitting of past immune escape and waning immunity, is the same calibration process used for all scenarios?)
The same immunity level and calibration process were used for scenarios at and before t=0. Waning immunity is described in a following entry. BA.1 is assumed to have 0.5 immune escape over pre-omicron variants. BA.4/5 are assumed to have 0.5 immune escape over BA.1. "Level 6" variants have 0.5 immune escape over BA.4/5. Other values around the mentioned choices were tried but did not impact the results significantly.

## Details about modeling of immune escape after t=0 (including how projected immune escape is handled in scenarios, e.g., whether a stepwise or continuous escape was considered)
The model works on discrete-time at weekly granularity. The immune escape happens per time-step.

## Assumptions regarding waning immunity against infection and symptoms (including values used for the duration and level of protection against infection or symptomatic disease, whether a point estimate was used or a range, and distribution used)
It is assumed that all waning happens through a time-dependent waning mechanism. The probability of transferring to a partially immune state at time t is modeled as a gamma distribution such that: (i) the median ranges from 2 to 5 months with residual immunity ranging from 0 to 0.3 (pre-omicron variants are summed to have a slower waning of 6 months); (ii) the efficacy (given the partial immune protection against infection) after the first 60 days is the "initial" vaccine efficacy as suggested by the scenarios. 

## Assumptions regarding waning immunity against severe disease (including whether immunity against severe disease, conditional on infection, is fixed vs declines over time; and if it wanes, specify how)
The severity given infection is constant per age group over time.
## Describe the process used to set or calibrate disease severity, ie P(hosp given current infection) and P(death given current infection) details. What are the datasets used for the calibration of the death targets?
True infections estimated from a combination of seroprevalence

## Seasonality implementation
Contact rates changes over the year are derived from Cuebiq contact data.

## Is there a background level of non-pharmaceutical interventions?
No

## Other updates in model assumptions from previous rounds (e.g., demographic dynamics)
N/A
