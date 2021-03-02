# COVID-19 Scenario Modeling Hub 

## Rationale
Even the best models of emerging infections struggle to give accurate forecasts at time scales greater than 3-4 weeks due to unpredictable drivers such as a changing policy environment, behavior change, the development of new control measures, and stochastic events. However, policy decisions around the course of emerging infections often require projections in the time frame of months. The goal of long-term projections is to compare outbreak trajectories under different scenarios, as opposed to offering a specific, unconditional estimate of what “will” happen. As such, long-term projections can guide longer-term decision-making while short-term forecasts are more useful for situational awareness and guiding immediate response. The need for long-term epidemic projections is particularly acute in a severe pandemic, such as COVID-19, that has a large impact on the economy; for instance, economic and budget projections require estimates of outbreak trajectories in the 3-6 month time scale. 

From weather to infectious diseases, it has been shown that synergizing results from multiple models gives more reliable projections than any one model alone. In the COVID-19 pandemic this approach has been exemplified by the [COVID-19 Forecast Hub](https://covid19forecasthub.org/), which combines the results of over 30 models (see a [report](https://www.medrxiv.org/content/10.1101/2020.08.19.20177493v1) on the first wave of the pandemic). Further, a [comparison](https://www.medrxiv.org/content/10.1101/2020.11.03.20225409v1) of the impact of interventions across 17 models has illustrated how any individual model can grossly underestimate uncertainty, while ensemble projections can offer robust projections of COVID-19 the course of the epidemic under different scenarios at a 6-month time scale.

The [COVID-19 Forecasting Hub](https://covid19forecasthub.org/) provides useful and accurate short-term forecasts, but there remains a lack of publicly available model projections at 3-6 month time scale. Some single models are available online (e.g., [IHME](https://covid19.healthdata.org/united-states-of-america), or [Imperial College](https://www.imperial.ac.uk/mrc-global-infectious-disease-analysis/covid-19/report-33-vaccine/)), but a decade of infectious disease forecasts has demonstrated that projections from a single model are particularly risky. Single model projections are particularly problematic for emerging infections where there is much uncertainty about basic epidemiological parameters (such as the waning of immunity), the transmission process, future policies, the impact of interventions, and how the population may react to the outbreak and associated interventions. There is a need for generating long-term COVID-19 projections combining insights from different models and making them available to decision-makers, public health experts, and the general public. We plan to fill this gap by building a public COVID-19 Scenario Hub to harmonize scenario projections in the United States. 

We have specified a  set of scenarios and target outcomes to allow alignment of model projections for collective insights. Scenarios have been designed in consultation with academic modeling teams and government agencies (e.g., CDC). 

## How to participate
The COVID-19 Scenario Modeling Hub is be open to any team willing to provide projections at the right temporal and spatial scales, with minimal gatekeeping. We only require that participating teams share point estimates and uncertainty bounds, along with a short model description and answers to a list of key questions about design. A major output of the projection hub would be ensemble estimates of epidemic outcomes (e.g., cases, hospitalization and/or deaths), for different time points, intervention scenarios, and US jurisdictions. 

Those interested to participate should register [here](https://docs.google.com/spreadsheets/d/1K3vsjDURG0R6-9p86y5h3s11eszwLvXWqCu2lfjlXnI/edit#gid=0). Registration does not commit participants to submitting model contributions. 

Model projections for the first round will be due by Friday January 8th, 2021. Model projections should be submitted via pull request to the data-processed folder of this GitHub repository. Technical instructions for submission and required file formats can be found [here](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/README.md). 

## Scenarios
Scenarios will be updated during subsequent rounds of submissions. 
Last updated: 03-02-2021 for second round scenarios

### Common Assumptions
*   **Submission date**: March 11, 2021 
*   **Baseline date**: See specific details below
*   **End date for fitting data**: March 6, 2021 - no fitting should be done to data from after this date
*   **Start date for third-round scenarios**: March 7, 2021 (week ending March 12) - first date of simulated outcomes
*   **Simulation end date**: at least through week ending June 5, 2021 (13-week horizon); preferably Sept 4, 2021 (26-week horizon)
*   **Transmission assumptions**: models fit to US state-specific dynamic up until "End date for fitting data" specified above – no proscribed R<sub>0</sub>, interventions, etc.
*   **Pathogenicity assumptions**: no exogenous fluctuations in pathogenicity/transmissibility beyond seasonality effects
*   **Vaccine effectiveness**: level of effectiveness and available doses are specified for each scenario; assumptions regarding time required to develop immunity, age-related variation in effectiveness, duration of immunity, and additional effects of the vaccine on transmission are left to the discretion of each team
*   **Vaccine allocation**: between-state allocation is based on population per the CDC/NAS [guidelines](https://www.nap.edu/catalog/25917/framework-for-equitable-allocation-of-covid-19-vaccine#resources) (proportional allocation); within-state allocation and the impact of vaccine hesitancy are left to the discretion of each team
*   **Vaccine immunity delay:** There is approximately a 14 day delay according to the Pfizer data; because we suspect the post first dose and post second dose delays may be of similar length, we do not believe there is any need to explicitly model a delay, instead groups can delay vaccine receipt by 14 days to account for it
* **Vaccine uptake:** See specific details below.
*   **Vaccine rollout**: rollout to follow [ACIP recommendations](https://www.cdc.gov/vaccines/acip/meetings/downloads/slides-2020-12/slides-12-20/02-COVID-Dooling.pdf) unless known to be contradicted by state recommendations
    *   Phase 1a: health care workers, long-term care facilities
    *   Phase 1b: frontline essential workers, adults 75+
    *   Phase 1c: other essential workers, adults with high-risk conditions, adults 65-74
*   **NPI assumptions**: phased reductions of NPIs in 2021 that align with patterns observed at different times in the course of the epidemic in 2020 (see scenario-specific guidance); teams have some liberty on how to implement these reductions within the guidelines
*   **Database tracking of NPIs**: teams may use their own data if desired, otherwise we recommend the following sources as a common starting point:
    *   [Coronavirus Government Response Tracker | Blavatnik School of Government (ox.ac.uk)](https://www.bsg.ox.ac.uk/research/research-projects/coronavirus-government-response-tracker)
    *   [Coronavirus State Actions - National Governors Association (nga.org)](https://www.nga.org/coronavirus-state-actions-all/)
*   **Geographic scope**: state-level and national projections
*   **Results**: some subset of the following
    *   Weekly incident deaths
    *   Weekly cumulative deaths since start of pandemic (use JHU CSSE for baseline)
    *   Weekly incident cases
    *   Weekly cumulative cases since start of pandemic (use JHU CSSE for baseline)
    *   Weekly incident hospitalizations
    *   Weekly cumulative hospitalizations since simulation start
    *   **Weeks will follow epi-weeks (Sun-Sat) dated by the last day of the week**
*   **“Ground Truth”**: The same data sources as the forecast hub will be used to represent “true” cases, deaths and hospitalizations. Specifically, JHU CSSE data for cases and deaths and HHS data for hospitalization. 
*   **Metadata:** We will require a brief meta-data form, TBD, from all teams. 
*   **Uncertainty**: aligned with the Forecasting Hub we ask for 0.01, 0.025, 0.05, every 5% to 0.95, 0.975, and 0.99 quantiles
*   **Ensemble Inclusion**: at present time, in order to be included in the ensemble models need to provide a full set of quantiles

## Third Round Scenarios

### Scenario A. High Vaccination, Moderate NPI

* **Scenario name for submission file:** `highVac_modNPI`  
* **Scenario id for submission file:** `A-2021-03-05` 
*   **Social Distancing Measures**:
    *   Includes combined effectiveness/impact of all non-pharmaceutical interventions and behavior change.
    *   <span style="text-decoration:underline;">Declines gradually over a period of 5 months</span> starting at the beginning of March and ending in August at **<span style="text-decoration:underline;">50% of the effectiveness of control</span>** observed for February 2021. 
    *   Decline can be implemented at teams’ discretion (e.g., daily or monthly stepdowns), but should occur over the full period.
    *   The effectiveness of control in February 2021 should be based on the last two weeks of the month. 
    *   Reduction should be implemented based on each team’s best judgment, but should be done in such a way that a 100% reduction (0% of Feb 2021 effectiveness) would approximate an epidemic without NPIs (e.g. no masks, no social distancing) in place, but still including immunity, vaccination, etc. We recognize that there is uncertainty about what the effects would be without NPIs; this uncertainty should be incorporated into the scenario projections.
*   **Testing-Trace-Isolate:** constant at baseline levels
*   **Masking:** Included as part of “Social Distancing Measures” above.
*   **Vaccination - Pfizer & Moderna**
    *   **Vaccine efficacy (2-dose vaccines)**:
        *   <span style="text-decoration:underline;">First dose: **_90% against disease_**</span>, 14 days after 1<sup>st</sup> dose
        *   <span style="text-decoration:underline;">Second dose: **_95% against disease_**</span>, 14 days after 2<sup>nd</sup> dose
        *   Transmission impact at teams’ discretion and should be clearly documented in team’s metadata.
        *   Doses 3.5 weeks apart
    *   **Vaccine availability**: 
        *   <span style="text-decoration:underline;">December, January, and February: based on data on administered doses</span> (second doses should be taken into account)
        *   <span style="text-decoration:underline;">March-August:** _35 million_** administered first doses/month</span>, with the intention of protocols being followed (70M doses/mo)
        *   If the maximum level of vaccination specified (e.g., 90% for this scenario) is reached in all population groups, assume that no more vaccination occurs (i.e., do not model new doses beyond this amount) 
    *   The specified scenarios do not include the Johnson and Johnson one-dose vaccine, so it should not be modeled. Next round may include the explicit introduction of J&J vaccine.
*   **B.1.1.7 Variant strain**: Teams can model the B.1.1.7 variant as appropriate to their model. Any assumptions should be clearly defined in the metadata. 

    The default assumptions are that the variant is 1.5x more transmissible than current strains and reaches 50% dominance by March 15 and 100% dominance by May 1 [(see MMWR report)](https://www.cdc.gov/mmwr/volumes/70/wr/mm7003e2.htm); here a 1.5x increase in transmissibility is defined as the increase in the expected number of cases infected by a single case over their entire course of infection when there are no interventions or immunity in the population (e.g., a 1.5x increase in R<sub>0</sub> in a classic epidemic model). No differences in severity, mortality, or VE are assumed in default.

*   **Vaccine coverage:_<span style="text-decoration:underline;"> No more than 90%</span>_** of any population group receives the vaccine

     




### Scenario B. High Vaccination, Low NPI

*   **Scenario name for submission file:** `highVac_lowNPI`
*   **Scenario id for submission file:** `B-2021-03-05`
*   **Social Distancing Measures**:
    *   Includes combined effectiveness/impact of all non-pharmaceutical interventions and behavior change.
    *   <span style="text-decoration:underline;">Declines gradually over a period of 5 months</span> starting at the beginning of March and ending in August at **<span style="text-decoration:underline;">20% of the effectiveness of control (i.e., an 80% reduction in effectiveness)</span>** observed for February 2021. 
    *   Decline can be implemented at teams’ discretion (e.g., daily or monthly stepdowns), but should occur over the full period.
    *   The effectiveness of control in February 2021 should be based on the last two weeks of the month. 
    *   Reduction should be implemented based on each team’s best judgment, but should be done in such a way that a 100% reduction (0% of Feb 2021 effectiveness) would approximate an epidemic without NPIs (e.g. no masks, no social distancing) in place but would still including immunity, vaccination, etc. 
*   **Testing-Trace-Isolate:** constant at baseline levels
*   **Masking:** Included as part of “Social Distancing Measures” above.
*   **Vaccination - Pfizer & Moderna**
    *   **Vaccine efficacy (2-dose vaccines)**:
        *   <span style="text-decoration:underline;">First dose: **_90% against disease_**</span>, 14 days after 1<sup>st</sup> dose
        *   <span style="text-decoration:underline;">Second dose: **_95% against disease_**</span>, 14 days after 2<sup>nd</sup> dose
        *   Transmission impact at teams’ discretion and should be clearly documented in team’s metadata.
        *   Doses 3.5 weeks apart
    *   **Vaccine availability**: 
        *   <span style="text-decoration:underline;">December, January, and February: Administered doses</span> (second doses should take into account)
        *   <span style="text-decoration:underline;">March-August:** _35 million_** administered first doses/month</span>, with the intention of protocols being followed (70M doses/mo) 
        *   If the maximum level of vaccination specified (e.g., 90% in this scenario) is reached in all population groups, assume that no more vaccination occurs (i.e., do not model new doses beyond this amount) 
    *   The specified scenarios do not include the Johnson and Johnson one-dose vaccine, so it should not be modeled. Next round may include the explicit introduction of J&J vaccine.
*   **B.1.1.7 Variant strain**: Teams can model the B.1.1.7 variant as appropriate to their model. Any assumptions should be clearly defined in the metadata. 

    The default assumptions are that the variant is 1.5x more transmissible than current strains and reaches 50% dominance by March 15 and 100% dominance by May 1 [(see MMWR report)](https://www.cdc.gov/mmwr/volumes/70/wr/mm7003e2.htm); here a 1.5x increase in transmissibility is defined as the increase in the expected number of cases infected by a single case over their entire course of infection when there are no interventions or immunity in the population (e.g., a 1.5x increase in R<sub>0</sub> in a classic epidemic model). No differences in severity, mortality, or VE are assumed in default.

*   **Vaccine coverage:_<span style="text-decoration:underline;"> No more than 90%</span>_** of any population group receives the vaccine

 

### Scenario C. Low Vaccination, Moderate NPI



*   **Scenario name for submission file:** `lowVac_modNPI`
*   **Scenario id for submission file:** `C-2021-03-05`
*   **Social Distancing Measures**:
    *   Includes combined effectiveness/impact of all non-pharmaceutical interventions and behavior change.
    *   <span style="text-decoration:underline;">Declines gradually over a period of 5 months</span> starting at the beginning of March and ending in August at **<span style="text-decoration:underline;">50% of the effectiveness of control</span>** observed for February 2021. 
    *   Decline can be implemented at teams’ discretion (e.g., daily or monthly stepdowns), but should occur over the full period.
    *   The effectiveness of control in February 2021 should be based on the last two weeks of the month. 
    *   Reduction should be implemented based on each team’s best judgment, but should be done in such a way that a 100% reduction (0% of Feb 2021 effectiveness) would approximate an epidemic without NPIs (e.g. no masks, no social distancing) in place but would still including immunity, vaccination, etc. 
*   **Testing-Trace-Isolate:** constant at baseline levels
*   **Masking:** Included as part of “Social Distancing Measures” above.
*   **Vaccination - Pfizer & Moderna**
    *   **Vaccine efficacy (2-dose vaccines)**:
        *   <span style="text-decoration:underline;">First dose: **_50% against disease_**</span>, 14 days after 1<sup>st</sup> dose
        *   <span style="text-decoration:underline;">Second dose: **_75% against disease_**</span>, 14 days after 2<sup>nd</sup> dose
        *   Transmission impact at teams’ discretion and should be clearly documented in team’s metadata.
        *   Doses 3.5 weeks apart
    *   **Vaccine availability**: 
        *   <span style="text-decoration:underline;">December, January, and February: based on data on administered doses</span> (second doses should take into account)
        *   <span style="text-decoration:underline;">March-August:** _20 million_** administered first doses/month</span>, with the intention of protocols being followed (40M doses/mo) 
        *   If the maximum level of vaccination specified (e.g., 50% in this scenario) is reached in all population groups, assume that no more vaccination occurs (i.e., do not model new doses beyond this amount) 
    *   The specified scenarios do not include the Johnson and Johnson one-dose vaccine, so it should not be modeled. Next round may include the explicit introduction of J&J vaccine.
*   **B.1.1.7 Variant strain**: Teams can model the B.1.1.7 variant as appropriate to their model. Any assumptions should be clearly defined in the metadata. 

    The default assumptions are that the variant is 1.5x more transmissible than current strains and reaches 50% dominance by March 15 and 100% dominance by May 1 [(see MMWR report)](https://www.cdc.gov/mmwr/volumes/70/wr/mm7003e2.htm); here a 1.5x increase in transmissibility is defined as the increase in the expected number of cases infected by a single case over their entire course of infection when there are no interventions or immunity in the population (e.g., a 1.5x increase in R<sub>0</sub> in a classic epidemic model). No differences in severity, mortality, or VE are assumed in default.

*   **Vaccine coverage:_<span style="text-decoration:underline;"> No more than 50%</span>_** of any population group receives the vaccine



### Scenario D. Low Vaccination & Low NPI



*   **Scenario name for submission file:** `lowVac_lowNPI`
*   **Scenario id for submission file:** `D-2021-03-05`
*   **Social Distancing Measures**:
    *   Includes combined effectiveness/impact of all non-pharmaceutical interventions and behavior change.
    *   <span style="text-decoration:underline;">Declines gradually over a period of 5 months</span> starting at the beginning of March and ending in August at **<span style="text-decoration:underline;">20% of the effectiveness of control (i.e., an 80% reduction in effectiveness)</span>** observed for February 2021. 
    *   Decline can be implemented at teams’ discretion (e.g., daily or monthly stepdowns), but should occur over the full period.
    *   The effectiveness of control in February 2021 should be based on the last two weeks of the month. 
    *   Reduction should be implemented based on each team’s best judgment, but should be done in such a way that a 100% reduction (0% of Feb 2021 effectiveness) would approximate an epidemic without NPIs (e.g. no masks, no social distancing) in place but would still including immunity, vaccination, etc.. 
*   **Testing-Trace-Isolate:** constant at baseline levels
*   **Masking:** Included as part of “Social Distancing Measures” above.
*   **Vaccination - Pfizer & Moderna**
    *   **Vaccine efficacy (2-dose vaccines)**:
        *   <span style="text-decoration:underline;">First dose: **_50% against disease_**</span>, 14 days after 1<sup>st</sup> dose
        *   <span style="text-decoration:underline;">Second dose: **_75% against disease_**</span>, 14 days after 2<sup>nd</sup> dose
        *   Transmission impact at teams’ discretion and should be clearly documented in team’s metadata.
        *   Doses 3.5 weeks apart
    *   **Vaccine availability**: 
        *   <span style="text-decoration:underline;">December, January, and February: based on data on administered doses</span> (second doses should take into account)
        *   <span style="text-decoration:underline;">March-August:** _20 million_** administered first doses/month</span>, with the intention of protocols being followed (40M doses/mo) 
        *   If the maximum level of vaccination specified (e.g., 50% in this scenario) is reached in all population groups, assume that no more vaccination occurs (i.e., do not model new doses beyond this amount) 
    *   The specified scenarios do not include the Johnson and Johnson one-dose vaccine, so it should not be modeled. Next round may include the explicit introduction of J&J vaccine.
*   **B.1.1.7 Variant strain**: Teams can model the B.1.1.7 variant as appropriate to their model. Any assumptions should be clearly defined in the metadata. 

    The default assumptions are that the variant is 1.5x more transmissible than current strains and reaches 50% dominance by March 15 and 100% dominance by May 1 [(see MMWR report)](https://www.cdc.gov/mmwr/volumes/70/wr/mm7003e2.htm); here a 1.5x increase in transmissibility is defined as the increase in the expected number of cases infected by a single case over their entire course of infection when there are no interventions or immunity in the population (e.g., a 1.5x increase in R<sub>0</sub> in a classic epidemic model). No differences in severity, mortality, or VE are assumed in default.

*   **Vaccine coverage:_<span style="text-decoration:underline;"> No more than 50%</span>_** of any population group receives the vaccine



**References:**

-          VE against disease:[ https://www.nejm.org/doi/full/10.1056/NEJMc2036242](https://www.nejm.org/doi/full/10.1056/NEJMc2036242)

-          VE against infection:


        `o`  [ https://www.medrxiv.org/content/10.1101/2021.02.15.21251623v1](https://www.medrxiv.org/content/10.1101/2021.02.15.21251623v1)


        `o`  [ https://www.thelancet.com/journals/lancet/article/PIIS0140-6736(21)00448-7/fulltext](https://www.thelancet.com/journals/lancet/article/PIIS0140-6736(21)00448-7/fulltext)

-          Doses:[ https://www.politico.com/news/2021/02/23/us-3-million-vaccine-doses-per-day-april-471146](https://www.politico.com/news/2021/02/23/us-3-million-vaccine-doses-per-day-april-471146)

-          J&J:[ https://www.npr.org/sections/coronavirus-live-updates/2021/01/29/961887796/johnson-johnson-vaccine-is-66-effective-in-preventing-moderate-to-severe-covid-1](https://www.npr.org/sections/coronavirus-live-updates/2021/01/29/961887796/johnson-johnson-vaccine-is-66-effective-in-preventing-moderate-to-severe-covid-1) 

 

New vaccine deliveries:

([https://ktla.com/news/nationworld/biden-team-aiming-for-bigger-vaccination-numbers-as-u-s-vaccine-manufacturing-ramps-up/](https://ktla.com/news/nationworld/biden-team-aiming-for-bigger-vaccination-numbers-as-u-s-vaccine-manufacturing-ramps-up/)) – all before J&J

[https://www.politico.com/news/2021/02/23/us-3-million-vaccine-doses-per-day-april-471146](https://www.politico.com/news/2021/02/23/us-3-million-vaccine-doses-per-day-april-471146)

-          145 million doses: Feb 22 – March 31 (113 mill per month)

-          200 million: end of May (100 mill per month)

-          200 million: end of July (100 mill per month)

 New vacc targets:

- 2 million per day (Biden) – 30 million courses per month

- 3 million per day (Wen) – 45 million courses per month

 

J&J vaccine:

-          Release:

-          End of March: 20 million doses

-          June target: 100 million doses (assume 20M April 1, 20M May 1, 25M June 1, 35M July 1)

-          VE: 66-72% (85% against severe)



## Submitting model projections
Groups interested in participating can submit model projections for each scenario in a CSV file formatted according to our specifications, and a metadata file with a description of model information. See [here](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/README.md) for technical submission requirements. Groups can submit their contributions as often as they want; the date of when a model projection was made (projection date) is recorded in the model submission file.   

### Model projection dates
Model projections will have an associated `model_projection_date` that corresponds to the day the projection was made.    

For week-ahead model projections with `model_projection_date` of Sunday or Monday of EW12, a 1 week ahead projection corresponds to EW12 and should have `target_end_date` of the Saturday of EW12. For week-ahead projections with `model_projection_date` of Tuesday through Saturday of EW12, a 1 week ahead projection corresponds to EW13 and should have `target_end_date` of the Saturday of EW13. A week-ahead projection should represent the total number of incident deaths or hospitalizations within a given epiweek (from Sunday through Saturday, inclusive) or the cumulative number of deaths reported on the Saturday of a given epiweek. We have created [a csv file](template/covid19-death-forecast-dates.csv) describing projection collection dates and dates to which projections refer to can be found. Model projection dates in the COVID-19 Scenario Modeling Hub are equivelent to the forecast dates in the [COVID-19 Forecast Hub](https://covid19forecasthub.org/). 

### Gold standard data
We will use the daily reports containing COVID-19 cases and deaths data from the [JHU CSSE group](https://coronavirus.jhu.edu/map.html) as the gold standard reference data for cases and deaths in the US. We will use the distribution of the JHU data as provided by the [COVIDcast Epidata API](https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html) maintained by the [Delphi Research Group](https://delphi.cmu.edu/about/) at Carnegie Mellon University. 

For COVID-19 hospitalizations, we will use the same truth data as the COVID-19 Forecast Hub, i.e., the [HealthData.gov COVID-19 Reported Patient
Impact and Hospital Capacity by StateTimeseries](https://healthdata.gov/dataset/covid-19-reported-patient-impact-and-hospital-capacity-state-timeseries).
These data are released weekly although, sometimes, are updated more frequently.

A supplemental data source with daily counts that should be updated more frequently (typically daily) but does not include the full time-series
is [HealthData.gov COVID-19 Reported Patient Impact and Hospital Capacity by State](https://healthdata.gov/dataset/covid-19-reported-patient-impact-and-hospital-capacity-state).

Work is in progress to distribute these hospitalization data through the Covidcast Epidata API. For more information about hospitalization data, see the [data section](https://github.com/reichlab/covid19-forecast-hub/blob/master/data-processed/README.md) on the COVID-19 Forecast Hub. 

### Locations
Model projections may be submitted for any state  in the US and the US at the national level.

### Probabilistic model projections
Model projections will be represented using quantiles of predictive distributions. Similar to the [COVID-19 Forecast hub](https://covid19forecasthub.org/), we encourage all groups to make available the following 23 quantiles for each distribution: `c(0.01, 0.025, seq(0.05, 0.95, by = 0.05), 0.975, 0.99)`. One goal of this effort is to create probabilistic ensemble scenarios, and having high-resolution component distributions will provide data to create better ensembles. 

## Ensemble model
We aim to combine model projections into an ensemble. Methods and further information will be shared when the first round of model projections have been received. 

## Data license and reuse
We are grateful to the teams who have generated these scenarios. The groups have made their public data available under different terms and licenses. You will find the licenses (when provided) within the model-specific folders in the [data-processed](./data-processed/) directory. Please consult these licenses before using these data to ensure that you follow the terms under which these data were released.

All source code that is specific to the overall project is available under an open-source [MIT license](https://opensource.org/licenses/MIT). We note that this license does NOT cover model code from the various teams or model scenario data (available under specified licenses as described above). 

## Teams and models
Teams that have submitted model projections will be acknowledged here. 

## The COVID-19 Scenario Modeling Hub Team
 - Justin Lessler, Johns Hopkins University
 - Katriona Shea, Penn State University
 - Cécile Viboud, NIH Fogarty
 - Shaun Truelove, Johns Hopkins University
 - Rebecca Borchering, Penn State University
 - Nick Reich, University of Massachussetts at Amherst
 - Wilbert Van Panhuis, University of Pittsburgh
 - Michael Runge, USGS
 - Lucie Contamin, University of Pittsburgh
 - John Levander, University of Pittsburgh
 - Jessica Salerno, University of Pittsburgh
 - Claire Smith, Johns Hopkins University
 
