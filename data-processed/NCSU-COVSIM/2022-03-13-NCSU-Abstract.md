# Summary of results
We observed additional waves of hospitalizations and deaths only under scenarios with a new variant. We observed that the cumulative hospitalizations and deaths were
close among all scenarios. 

# Explanation of observed dynamics given model assumptions
We believe that the short reinfection times, long time horizon, and highly infective nature of the disease are causing the convergence in cumulative hospitalizations and deaths. 

# Model assumptions
## Number/type of immune classes considered
We consider two immune classes: fully immune and partially immune. Partial immunity is tracked with an indicator variable attached to each agent. 
This changes the transition probabilities when moving through the disease compartments.

## Initial distribution of susceptibility if available
### Proportion of people that were infected with Omicron before March 13
Not available
### Proportion of people that are naïve at start of projection (not vaccinated or infected)
Not available
### Other
Not available

## Initial variant characteristics (including Omicron transmissibility, immune escape, and how uncertainty or non-identifiability was handled) 
Omicron transmissibility was parameterized to be 1.33x more transmissible than seasonal Delta. Immune escape was parameterized to be 50%. These two 
results were identified from our Round 12 scenarios. The likelihood of hospitalization was parameterized to be 50% that of Delta. The probability of 
death was parameterized to be 66% that of Delta. The parameter space bounded by Round 12 scenarios was explored to parameterize the severity of omicron. 

## Process for setting/calibrating P(hosp given current infection) and P(death given current infection)
These values were set by searching the parameter space established by Round 12 scenarios. Parameters that validated the metrics of "Current number of people 
hospitalized" and "cumulative deaths" were chosen to be used.

## Waning immunity details (e.g., the distribution used)
When agents enter the recovered state, they are assigned a time until they return to the susceptible state. In general, this time follows the 
distribution min(60 days, exp(4 or 10 months)) depending on the scenario. When variants are emerging, agents according to the immune escape of the 
variant will wane uniformly across the variant emergence window; otherwise, they follow the general distribution.

## Seasonality implementation
Seasonality was implemented to capture the delta and omicron waves. 

## Emerging variant details (including introduction process)
We introduce the emerging variant at a constant rate over the 16 weeks. Since we use a single strain simulation model, agents who will be susceptible 
to the new variant wane uniformly over the 16 weeks.

## Nonpharmaceutical interventions 
We assume that the masking level remains constant at the last observed value. Masks reduce infectivity and susceptibility by 50%.

## Other updates in model assumptions from previous rounds (e.g., changes in reporting outcomes, booster implementation)
We incorporated weekly incident hospitalizations and weekly incident deaths into our reporting.
