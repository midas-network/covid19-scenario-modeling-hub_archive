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
Last updated: 01-22-2021 for second round scenarios

### Common Assumptions
*   **Submission date**: January 29, 2021 (soft deadline)
*   **Baseline date**: December 15, 2020 - date of baseline intervention levels
*   **End date for fitting data**: January 23, 2021 - no fitting should be done to data from after this date
*   **Start date for first-round scenarios**: January 24, 2021 (week ending January 30) - first date of simulated outcomes; model should not be fit to data from after this date 
*   **Simulation end date**: at least through week ending April 24, 2021 (13-week horizon); preferably July 24, 2021 (26-week horizon)
*   **Transmission assumptions**: models fit to US state-specific dynamic up until "End date for fitting data" specified above – no proscribed R<sub>0</sub>, interventions, etc.
*   **Pathogenicity assumptions**: no exogenous fluctuations in pathogenicity/transmissibility beyond seasonality effects
*   **Vaccine effectiveness**: level of effectiveness and available doses are specified for each scenario; assumptions regarding time required to develop immunity, age-related variation in effectiveness, duration of immunity, and additional effects of the vaccine on transmission are left to the discretion of each team
*   **Vaccine allocation**: between-state allocation is based on population per the CDC/NAS [guidelines](https://www.nap.edu/catalog/25917/framework-for-equitable-allocation-of-covid-19-vaccine#resources) (proportional allocation); within-state allocation and the impact of vaccine hesitancy are left to the discretion of each team
*   **Vaccine immunity delay:** There is approximately a 14 day delay according to the Pfizer data; because we suspect the post first dose and post second dose delays may be of similar length, we do not believe there is any need to explicitly model a delay, instead groups can delay vaccine receipt by 14 days to account for it
* **Vaccine uptake:** It is unlikely vaccine uptake will be 100% within prioritized groups, however sufficient data are not available to specify this; we will leave this to team discretion, but we ask that they include these assumptions in their meta-data file
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

## Second Round Scenarios

### Scenario A: “Optimistic” Scenario, No Variant Strain 
* **Scenario name for submission file:** `optimistic_no_var`  
* **Scenario id for submission file:** `A-2021-01-22` 
*   **Social Distancing Measures**: baseline state orders with regards to NPIs continue for six weeks from their start date (i.e., the date each individual state started the policy regime in place at baseline), interventions step down from baseline to the lowest levels seen since September 2020 in a particular jurisdiction over two one-month steps
*   **Testing-Trace-Isolate:** constant at baseline levels
*   **Masking:** maintained at baseline levels indefinitely
*   **Vaccine efficacy**: 95% after two doses, 50% after one dose, doses 3.5 weeks apart
*   **Vaccine availability**: Actually administered doses in December and January, vaccine administration rate observed so far in January persists through the end of the month, 25 million courses distibuted per month thereafter (NOTE: administration refers to actual receipt by an individual, distribution to the doses being sent to states)
*   **Variant strain**: no variant strain

### Scenario B: “Optimistic” Scenario, Variant Strain 
* **Scenario name for submission file:** `optimistic_var`  
* **Scenario id for submission file:** `B-2021-01-22` 
*   **Social Distancing Measures**: baseline state orders with regards to NPIs continue for six weeks from their start date (i.e., the date each individual state started the policy regime in place at baseline), interventions step down from baseline to the lowest levels seen since September 2020 in a particular jurisdiction over two one-month steps
*   **Testing-Trace-Isolate:** constant at baseline levels
*   **Masking:** maintained at baseline levels indefinitely
*   **Vaccine efficacy**: 95% after two doses, 50% after one dose, doses 3.5 weeks apart
*   **Vaccine availability**: Actually administered doses in December and January, vaccine administration rate observed so far in January persists through the end of the month, 25 million courses distibuted per month thereafter (NOTE: administration refers to actual receipt by an individual, distribution to the doses being sent to states)
*   **Variant strain**: variant is 1.5x more transmissible than current strains and reaches 50% dominance by March 15 and 100% dominance by May 1 [(see MMWR report)](https://www.cdc.gov/mmwr/volumes/70/wr/mm7003e2.htm)

### Scenario C: Fatigue and Hesitancy Scenario, No Variant Strain
* **Scenario name for submission file:** `fatigue_no_var`  
* **Scenario id for submission file:** `C-2021-01-22`
*   **Social Distancing Measures**: current elevated state orders with regards to NPIs continue for stated length or three weeks after the NPI is started if length is unstated; thereafter interventions step down from baseline to an additional 5% below the lowest levels seen since May 2020 in a particular jurisdiction over two one-month steps
*   **Testing-Trace-Isolate:** constant at baseline levels
*   **Masking:** adherence to these measures steps down from baseline to an additional 5% below the lowest levels seen since September 2020 in a particular jurisdiction over two one-month steps
*   **Vaccine efficacy**: 95% after two doses, 50% after one dose, doses 3.5 weeks apart. 
*   **Vaccine availability**: Actually administered doses in December and January, vaccine administration rate observed to date in January persists indefinitely until the proportion vaccinated reaches the hesitancy threshold
*   **Vaccine hesitancy:** no more than 50% of any priority group accepts the vaccine
*   **Variant strain**: no variant strain

### Scenario D: Fatigue and Hesitancy Scenario, Variant Strain
* **Scenario name for submission file:** `fatigue_var`  
* **Scenario id for submission file:** `D-2021-01-22`
*   **Social Distancing Measures**: current elevated state orders with regards to NPIs continue for stated length or three weeks after the NPI is started if length is unstated; thereafter interventions step down from baseline to an additional 5% below the lowest levels seen since May 2020 in a particular jurisdiction over two one-month steps
*   **Testing-Trace-Isolate:** constant at baseline levels
*   **Masking:** adherence to these measures steps down from baseline to an additional 5% below the lowest levels seen since September 2020 in a particular jurisdiction over two one-month steps
*   **Vaccine efficacy**: 95% after two doses, 50% after one dose, doses 3.5 weeks apart. 
*   **Vaccine availability**: Actually administered doses in December and January, vaccine administration rate observed to date in January persists indefinitely until the proportion vaccinated reaches the hesitancy threshold
*   **Vaccine hesitancy:** no more than 50% of any priority group accepts the vaccine
*   **Variant strain**: variant is 1.5x more transmissible than current strains and reaches 50% dominance by March 15 and 100% dominance by May 1 [(see MMWR report)](https://www.cdc.gov/mmwr/volumes/70/wr/mm7003e2.htm)

### Other Scenarios
*   We will welcome updated submissions for any scenarios asked for in prior rounds

## First Round Scenarios

### Scenario A: “Optimistic” Scenario 
* **Scenario name for submission file:** `optimistic`  
* **Scenario id for submission file:** `A-2020-12-22` 
*   **Social Distancing Measures**: baseline state orders with regards to NPIs continue for six weeks from their start date (i.e., the date each individual state started the policy regime in place at baseline), interventions step down from baseline to the lowest levels seen since September 2020 in a particular jurisdiction over two one-month steps
*   **Testing-Trace-Isolate:** constant at baseline levels
*   **Masking:** maintained at baseline levels indefinitely
*   **Vaccine efficacy**: 95% after two doses, 50% after one dose, doses 3.5 weeks apart
*   **Vaccine availability**: Actually distributed doses in December (approx.), 25 million courses (50 million doses) in January, 25 million courses per month thereafter

### Scenario B: Business as Usual + Moderate Vaccine Scenario:
* **Scenario name for submission file:** `moderate`  
* **Scenario id for submission file:** `B-2020-12-22`
*   **Social Distancing Measures**: current elevated state orders with regards to NPIs continue for stated length or three weeks after the NPI is started if length is unstated; thereafter interventions step down from baseline to the lowest levels seen since May 2020 in a particular jurisdiction over two one-month steps
*   **Testing-Trace-Isolate:** constant at baseline levels
*   **Masking: **maintained at baseline levels indefinitely
*   **Vaccine efficacy**: 70% after two doses, 20% after one dose, doses 3.5 weeks apart
*   **Vaccine availability**: Actually distributed doses in December (approx.), 12.5 million courses in January, 25 million courses per month thereafter

### Scenario C: Fatigue and Hesitancy Scenario:
* **Scenario name for submission file:** `fatigue`  
* **Scenario id for submission file:** `C-2020-12-22`
*   **Social Distancing Measures**: current elevated state orders with regards to NPIs continue for stated length or three weeks after the NPI is started if length is unstated; thereafter interventions step down from baseline to an additional 5% below the lowest levels seen since May 2020 in a particular jurisdiction over two one-month steps
*   **Testing-Trace-Isolate:** constant at baseline levels
*   **Masking:** adherence to these measures steps down from baseline to an additional 5% below the lowest levels seen since September 2020 in a particular jurisdiction over two one-month steps
*   **Vaccine efficacy**: 95% after two doses, 50% after one dose, doses 3.5 weeks apart. 
*   **Vaccine availability**: Actually distributed doses in December (approx.), 12.5 million courses in January, 25 million courses per month thereafter
*   **Vaccine hesitancy:** no more than 50% of any priority group accepts the vaccine

### Scenario D: Counterfactual Scenario
* **Scenario name for submission file:** `counterfactual`  
* **Scenario id for submission file:** `D-2020-12-22`
*   **Social Distancing Measures**: current elevated state orders with regards to NPIs continue for stated length or three weeks after the NPI is started if length is unstated; thereafter interventions step down from baseline to the lowest levels seen since May 2020 in a particular jurisdiction over two one-month steps
*   **Testing-Trace-Isolate: **constant at baseline levels
*   **Masking:** maintained at baseline levels indefinitely
*   **Vaccine** : no vaccine

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
 - Nick Reich, Univeristy of Massachussetts at Amherst
 - Wilbert Van Panhuis, University of Pittsburgh
 - Lucie Contamin, University of Pittsburgh
 - John Levander, University of Pittsburgh
 - Jessica Salerno, University of Pittsburgh
 - Claire Smith, Johns Hopkins University
 
