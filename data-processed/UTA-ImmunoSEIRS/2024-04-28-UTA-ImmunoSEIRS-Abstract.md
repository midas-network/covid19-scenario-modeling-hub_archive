# Summary of results
The results show the development of a COVID wave whose timing and magnitude is different depending on the location. In all projections, assumptions considered in scenario B (no vaccination and high immune escape) caused to the highest level of hospitalizations and deaths. Scenario E (all vaccination and low immune escape) was the one that caused least hospitalizations and deaths in the country and the 50 states. This suggests that the higher vaccination coverage with higher vaccine effectiveness, does drive the vaccine based immunity and has a significant impact. Additionally, we do not that in scenarios with lower immune escape and different vaccination scenario, the difference in hospitalizations number was not very significant as well a slight summer peak was observed. In the high immune escape scenarios, we did observe a summer peak under the different vaccination scenarios, as well as the impact of immunity derived from infections was reflected in the winter trend depending on the trend projected in summer wave.   

# Explanation of observed dynamics given model assumptions
It is expected that the number of hospitalizations to be lower in Scenario A, C, E, where immune escape is lower. Higher immune escape incorporated in the model does succeed in projection of the summer peak under scenarios B,D,F.

# Model assumptions: please describe:
We use a novel stochastic age-structured SEIRS model that explicitly tracks the changes in immunity acquired from natural infection and vaccination. Population-level immunity changes depending on natural infection rates, vaccination rates, and the waning of immunity, and we modulate transmission rates, hospitalization rates, and mortality rates, according to population immunity and the specific characteristics of the circulating variant. We fit the model to the hospitalization and death data between September 25, 2023 till mid April, 2024, and fit the transmission, hospitalization, and mortality rates to national and state-wise data. Additionally, we incorporated seasonality in the model incorporating specific humidity impact and fitted the seasonality magnitude parameter. The model is stratified according to six age groups. 

## Number/type of immune classes considered
Infection and vaccine derived immunity classes are included in the model. 

**##Initial distribution of susceptibility (if available)**
Other (NA)

## Initial variant characteristics (transmissibility of variants at t=0, and how uncertainty or non-identifiability was handled)
We parameterized the variant characteristics according to best literature estimates on transmissibility, immune escape, and severity. In case of uncertainty, we have used the estimates which provided the most accurate predictions in our previous projections.
We consider that the variants XBB, EG.5 and JN.1 have 30%, 20% and 30%% chances to escape immunity against infection, hospitalization and death. We fit the initial immunities attained by these variants. 

## Details about calibration of immunity at t=0 (calibration period considered, assumptions about/fitting of past immune escape and waning immunity, is the same calibration process used for all scenarios?)
We fit the initial immunities attained by variants at time t=0. The immune escape pertaining to low and high immune escape scenarios is modeled as a function such that the immune escape gradually changes at the constant rate for the circulating variant.

## Details about modeling of immune escape after t=0 (including how projected immune escape is handled in scenarios, e.g., whether a stepwise or continuous escape was considered and how immune escape affects infection- and vaccine-induced immunity)
The function is a stepwise function segregating the immune escape before and after the calibration period. 

## Assumptions regarding waning immunity against infection and symptoms (including values used for the duration and level of protection against infection or symptomatic disease, whether a point estimate was used or a range, and distribution used)
The model considers exponential decay for the waning of all immunity types. We assume a half-life time for the waning of immunity derived from vaccination equal to 6 months against infection and 12 against severe disease. We assume that booster-derived immunity wanes with a half-life time equal to 3 months and 8 months for protections against infection and severe disease, respectively. The half-life time of the immunity derived from natural infection with all variants is assumed to be 4 months for protection against infection and 8 against severe disease.

## Assumptions regarding waning immunity against severe disease (including whether immunity against severe disease, conditional on infection, is fixed vs declines over time; and if it wanes, specify how)
The model considers exponential decay for the waning of all immunity types. We assume a half-life time for the waning of immunity derived from vaccination equal to 6 months against infection and 12 against severe disease. We assume that booster-derived immunity wanes with a half-life time equal to 3 months and 8 months for protections against infection and severe disease, respectively. The half-life time of the immunity derived from natural infection with all variants is assumed to be 4 months for protection against infection and 8 against severe disease.

## Assumptions regarding boosting effect from multiple infections
Infection aquired immunity is modeled. 

## Is vaccination assumed to prevent infection and/or transmissibility?
The way our model structure is, this assumption is taken care of.

## Describe the process used to set or calibrate disease severity, ie P(hosp given current infection) and P(death given current infection) details. What are the datasets used for calibration of the death targets?
In the fitting period, we have considered the rate of hospitalization and death follow polynomial functions that we fit to data using the least square method. In the projection period, we keep the last estimate for both the hospitalization and death rates.

## Seasonality implementation, e.g., whether seasonality varies by geography and which datasets are used to fit seasonal parameters
Seasonality in the model is incorporated by means specific humidity at the national and state level. For doing so we incorporate a parameter that governs how the humidity function impacts the transmission rate and simultaneously fit this seasonality magnitude and the underlying transmission rate. 

## Details about modeling of age-specific outcomes, including assumptions on age-specific parameters (e.g., susceptibility, infection hospitalization risk or fatality risk, VE)
We have 6 age groups. The model is age-stratified. We have assumptions pertaing to VE for age specific from literature. The IHR, HDR are initialized studies and later updated by calibrating to fitting to data.  

## Details about modeling of high-risk individuals, e.g., susceptibility and infection hospitalization risk or infection fatality risk, VE
In this round, we updated the model to include high and low risk groups among each age groups. 

## Is empirical data on human mobility or contact patterns used in the model?
No

## Is there a background level of non pharmaceutical interventions?
No

## Is importation from other countries considered?
No

## Other updates in model assumptions from previous rounds (e.g., demographic dynamics)
Seasonality inclusion and segration based on low and high risk groups in addition to being age-stratidfied. 
