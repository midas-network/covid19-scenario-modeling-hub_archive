# Summary of results
Our projections show that at national level confirmed cases peak in late Jan. (best scenario) - early Feb. (worst scenario), followed by a quick drop to a level that will last for a while. Among the four scenarios, even the best one (B: optimistic severity, low immune escape) might reach 8 million cases (in the peak week), possibly stressing the testing capacity. Similar trends are projected for hospitalizations, with a less dramatic gap between current and previous peaks comparing with cases, due to less severe outcomes of Omicron infections and protection provided by vaccines. Deaths will not exceed the previous peaks for the same reasons. There are significant heterogeneities between states regarding peak size and timing in cases/hospitalizations/deaths.

# Explanation of observed dynamics given model assumptions
- The surge of cases is mainly due to immune escape of the Omicron variant. The population is largely susceptible to Omicron, comparing with the Delta variant. The effective R of Omicron is large, driving Omicron to infect a large fraction of the population in a short time.
- Hospitalizations and deaths rise due to large number of infections; but because of the reduction in severity of Omicron infection relative to Delta, the projected numbers are less dramatic when comparing with previous waves.
- Our projected cases rise to peak less quickly than what some other models project. This is mainly because that we have not considered possible changes to the case ascertainment in the recent Omicron wave. If the cases are indeed underreported, due to less severity of Omicron infections relative to Delta, then the recent R_effective is under-estimated. An adjustment to the case ascertainment can give us a higher R_effective to initialize our disease model, and a more rapid increase of cases to the peak.

# Model assumptions
## Initial distribution of susceptibility
Initialization of susceptibility is based county level data of previous confirmed cases, age specific case ascertainment rate, state level data of prior vaccinations, and waning of immunity (from infection and/or vaccine). We initialize each individual to one of naively susceptible, vaccinated, partially susceptible (with waned immunity), and non-susceptible (currently or recently infected) states, depending on whether and when the individual is/was infected and/or vaccinated.

## Transmissibility
Transmissibility is the same between Delta and Omicron. It is calibrated for each state by fitting effective reproduction number to the most recent estimate based on the confirmed cases data of that state.

## Generation time
Generation time is not an explicit parameter in our model. It depends on transmissibility which we calibrate separately for different states, as well as infectivity/susceptibility of infector/infecte=d, duration of infectiousness for different ages, and contact duration between infector and infected. Generation time differs between different variants due to different infectious/susceptible subpopulations and different network structures within those subpopulations.

## Waning immunity assumptions
We model waning immunity explicitly in our disease model using a partially susceptible state. A recovered/vaccinated node is moved to the partially susceptible state after a random dwell time, sampled from an exponential distribution with mean of 6 months. Protection on nodes in the partially susceptible state is 60%/40% against infection for 64-yo/65+yo, 90%/80% against severe disease for 64-yo/65+yo.

## Other updates in model assumptions from previous rounds (e.g., changes in reporting outcomes due to Omicron)
Our model assumptions remain the same as round 11, except for the parameterization of immune escape and severity reduction of Omicron infections, which are updated according to the SMH scenario description.
