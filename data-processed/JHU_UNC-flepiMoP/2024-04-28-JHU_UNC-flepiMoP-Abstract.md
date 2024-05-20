# Summary of results
Differences across scenarios are mainly driven by immune escape scenarios - with high immune escape leading to a more sustained increase in transmission lasting throughout the year. Low immune escape scenarios result in a limited amount of transmission over the summer with a pronounced winter peak. In some states, high immune escape projects a summer peak in addition to a larger winter peak.

# Explanation of observed dynamics given model assumptions
Dynamics are largely driven by immune escape, which defines the level of protection of the vaccine over time. This, paired with the rate of waning, strongly affects the possibility of a summer peak in addition to the winter peak.

# Model assumptions: please describe:
## Number/type of immune classes considered
We model immune classes as a ladder of immune protection, where a level 10 protection is fully protected from infection (directly following infection), and level 0 corresponds to full susceptibility. People move down this ladder due to waning and drift, and up the ladder following vaccination. 

## Initial distribution of susceptibility (if available)
This follows from prior fits from Round 17.

## Initial variant characteristics (transmissibility of variants at t=0, and how uncertainty or non-identifiability was handled)
Variants are not directly modelled. Initial transmissibility is fit from prior rounds (uncertainty is inherent in these prior fits). 

## Details about calibration of immunity at t=0 (calibration period considered, assumptions about/fitting of past immune escape and waning immunity, is the same calibration process used for all scenarios?)
Initial immunity is fit from prior rounds. Calibration for this round was specifically for the time period from March 2023 - April 2024, using scenario F as the calibration scenario (high immune escape). Waning of immunity is fit from prior rounds. This calibration was then used to project all other scenarios. 

## Details about modeling of immune escape after t=0 (including how projected immune escape is handled in scenarios, e.g., whether a stepwise or continuous escape was considered and how immune escape affects infection- and vaccine-induced immunity)
A continuous escape is considered. We assume that drift from the vaccine strain follows the provided rate of immune escape and determines how much protection is provided from the vaccine, and also defines the rate of waning down the immune ladder. 

## Assumptions regarding waning immunity against infection and symptoms (including values used for the duration and level of protection against infection or symptomatic disease, whether a point estimate was used or a range, and distribution used)
Protection against hospitalization is defined in scenarios. We mapped this to an initial VE against infection of 50%. The duration of protection is driven by rate of waning (no discrimination between vaccine induced or natural immunity) with prior of 10 months and is inferred.

## Assumptions regarding waning immunity against severe disease (including whether immunity against severe disease, conditional on infection, is fixed vs declines over time; and if it wanes, specify how)
Rate of waning is the same as against infection, as the levels of protection against infection also define protection against severe outcomes. 

## Assumptions regarding boosting effect from multiple infections
None.

## Is vaccination assumed to prevent infection and/or transmissibility?
Infection only. 

## Describe the process used to set or calibrate disease severity, ie P(hosp given current infection) and P(death given current infection) details. What are the datasets used for calibration of the death targets?
Disease severity estimates are based on some previous serology studies and have slight variations across states and age groups.

## Seasonality implementation, e.g., whether seasonality varies by geography and which datasets are used to fit seasonal parameters
Seasonality is inferred from the start of the pandemic. They are state-specific monthly terms (with a rolling mean applied) that adjust transmissibility.

## Details about modeling of age-specific outcomes, including assumptions on age-specific parameters (e.g., susceptibility, infection hospitalization risk or fatality risk, VE)
IFR and IHR are age-specific (0-17, 18-64, 65+). 

## Details about modeling of high-risk individuals, e.g., susceptibility and infection hospitalization risk or infection fatality risk, VE
We divide the 18-64 age group into low-risk and high-risk individuals, with differential IHR (high risk 4.3 times higher) and IFR (high risk 9.3 times higher). 

## Is empirical data on human mobility or contact patterns used in the model?
None.

## Is there a background level of non pharmaceutical interventions?
None.

## Is importation from other countries considered?
None.

## Other updates in model assumptions from previous rounds (e.g., demographic dynamics)
None, other than including high-risk and low-risk for the 18-64 age group. 
