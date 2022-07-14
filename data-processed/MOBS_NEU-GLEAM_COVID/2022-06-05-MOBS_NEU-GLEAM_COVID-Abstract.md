# Summary of results
* The model indicates the presence of recurring epidemic waves.
* The vaccine campaign in the fall has a benefit but does not seem to be able to curb the fall/winter wave.
* In all scenarios, the emergence of variant X is increasing the surge peak. 
* Differences and heterogeneity across states are observed.  

# Explanation of observed dynamics given model assumptions
The epidemic waves are mostly driven by the waning time scale of the natural infection/vaccine induced protection
The variant X scenarios show a pronounced increase of deaths and hospitalization (more than cases) because of the 20% increased risk of hospitalization/deaths relative to the current variants.

# Model assumptions
## Number/type of immune classes considered
We considered four different classes of immunity corresponding to pre and post omicron infection, boosted individuals and waned individuals.These classes are replicated in the multistrain model also for variant X.

## Initial distribution of susceptibility if available
We define this through the calibration of the model on the Omicron wave data through an ABC approach. The distribution of the proportion of susceptible is depending on the scenario and geographic location.

### Proportion of people that were infected with Omicron before June 15
We define this through the calibration of the model on the Omicron wave data through an ABC approach. The distribution of the proportion of susceptible is depending on the scenario and geographic location.

### Proportion of people that are naïve at start of projection (not vaccinated or infected)
We define this through the calibration of the model on the Omicron wave data through an ABC approach. The distribution of the proportion of susceptible is depending on the scenario and geographic location.
### Other
N/A

## Initial variant characteristics (including Omicron transmissibility, immune escape, whether BA4/BA5 were considered and how uncertainty or non-identifiability was handled) 
Omicron transmissibility is obtained from calibration and varies across scenarios. We use a prior on effective transmissibility that accounts also for residual NPIs, seasonality and vaccine/prior exposure protection. BA.2 and BA.2.12.1 are introduced with an effective increase in transmissibility (prevalence of the variants estimated using CDC tracker variant proportions nowcast model). BA.4 and BA.5 are not currently modeled.

## Process for setting/calibrating P(hosp given current infection) and P(death given current infection)
Calibrated by looking at deaths and hospitalizations during the Omicron wave.

## Waning immunity details (including values used for the duration and level of protection against infection or symptomatic disease, whether a point estimate was used or a sample from the specified values, distribution used)
We use a gamma distribution for transitioning to the waned class. Waned protection measured with respect to prior Omicron infection and it has been calibrated to be between 3 to 4 months (median time). 

## Seasonality implementation
We use seasonal modulation of transmissibility. School calendars are also included in the model.

## Emerging variant details (including introduction process and estimate of variant X emergence timing and variability)
We introduce the cases as indicated by the scenario specifications stochastically across counties according to international traffic. Domestic dispersion of cases is included mechanistically in the model through commuting patterns and domestic origin-destination traffic flows. 

## Nonpharmaceutical interventions 
Status quo

## Case ascertainment assumptions (including relation to infections, e.g., what value or values were used to translate to case estimates and how were they estimated)
The cases are rescaled to match the last empirical data point according to location. 

## Other updates in model assumptions from previous rounds (e.g., booster implementation)
WE implemented the booster vaccination scheme according to the directions for each scenario. The model is a multistrain model. Calibration is driven by the hospitalization data. The deaths projections take into account the reporting delay through an additional stochastic process simulating the time from actual death to reporting. 