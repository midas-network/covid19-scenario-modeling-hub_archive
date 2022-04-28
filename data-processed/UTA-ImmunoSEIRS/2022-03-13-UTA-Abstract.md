# Summary of results
The projections predict that there will be a new surge at the beginning of fall 2022 for scenario D. In scenario C, cases, hospitalizations, and deaths will start to rise again by the end of 2022. New cases, hospital admissions and deaths will remain extremely low in scenario A until the end. While they will the number of cases will start to increase by the end of the projection period in scenario B. 

 
# Explanation of observed dynamics given model assumptions
The combination of rapid waning and variant emergence could induce a new surge in the summer.

# Model assumptions
We use a novel stochastic age-structured SEIRS model that explicitly tracks the changes in immunity acquired from natural infection and vaccination. Population-level immunity changes depending on natural infection rates, vaccination rates, and the waning of immunity, and we modulate  transmission rates, symptomatic rates, hospitalization rates, and mortality rates, according to population immunity and the specific characteristics of the circulating variant. We initialize our model on December 21, 2021 using seroprevalence and vaccination data up to that date, and fit the transmission, hospitalization, and mortality rates to statewise data up to March 12, 2022.
The model is stratified according to six age groups.
References for our projections of the impact of Omicron on the US using the same model:
- Bouchnita, Anass, et al. "COVID-19 Scenario Projections: The Emergence of Omicron in the US-January 2022." (2022).

## Number/type of immune classes considered
The model does not explicity divide the population into different classes of immunity level. Instead, it tracks the changes of population-immunity in the population and how it modulates susceptibility and severity of the disease.

## Initial distribution of susceptibility if available
### Proportion of people that were infected with Omicron before March 13
We estimated around 51% of the population to be infected by Omicron by March 13.

### Proportion of people that are naïve at start of projection (not vaccinated or infected)
The model does not compute the number of naïve population but it calculates the level of immunity in the population. Thus, it estimates around 52% of immunity from Omicron and 62% immunity from vaccines for the US (can slightly change according to the considered state).


## Initial variant characteristics (including Omicron transmissibility, immune escape, and how uncertainty or non-identifiability was handled) 
We conisder that the Omicron is 155% more transmissible and has 42.5%, 32%, and 22% chances to escape immunity against infection, hospitalization and death. It has a severity that is 36% lower than Omicron.

## Process for setting/calibrating P(hosp given current infection) and P(death given current infection)
The probabilities were calibrated through fitting with data. The effect of variant X was captured by simulating its growth function using a toy multi-strain model, and considering that key parameters depends on the prevalence of this variant.

## Waning immunity details (e.g., distribution used)
The model explicitly considers the level of immunity in the population. We consider that the waning is exponential and the degradation coefficient is adjusted such that the level of protection matches the scenario suggestion.

## Seasonality implementation
No seasonality is considered. 

## Emerging variant details (including introduction process)
The effect of variant X was captured by simulating its growth function using a toy multi-strain model, and considering that key parameters depends on the prevalence of this variant. The immune escape effect is captured by reducing the efficacy of protection depending on the prevalence of the new variant in the population.

## Nonpharmaceutical interventions 
We consider that behavior remains the same as it was at the beginning of March 2022.

## Other updates in model assumptions from previous rounds (e.g., changes in reporting outcomes, booster implementation)
We consider an increase in transmissibility by 30% caused by the variant BA.2.



