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
Last updated: 12-17-2020

### Scenario A: “Optimistic” Scenario 
Scenario name for submission file: `optimistic`  
Scenario id for submission file: `A-2020-12-22` 

Social Distancing Measures: Baseline elevated state orders in regards to NPIs go on for 6 weeks.
After 6 weeks, interventions step down from baseline to the lowest levels seen since May 2020 in a particular jurisdiction, over 2 one month steps. 
Testing-Trace-Isolate: Constant at baseline levels
Masking: Masking is maintained at baseline levels indefinitely. 
Vaccine: vaccine efficacy 95% after 2 doses, 25% after first dose
Time between doses: 4 weeks
Rollout following ACIP recommendations unless known to be contraindicated by state recommendations. (https://www.cdc.gov/vaccines/acip/meetings/downloads/slides-2020-12/COVID-02-Dooling.pdf)
Phase 1a: HCW, LTCF
Phase 1b: essential workers (education, food & ag, utilities, etc.)
Phase 1c: adults with high-risk conditions, adults 65+
Nationally: 25 million courses January and 25 million per month thereafter.
Allocation proportional to state population.

### Scenario B: Business as Usual + Moderate Vaccine Scenario:
Scenario name for submission file: `moderate`  
Scenario id for submission file: `B-2020-12-22`

Social Distancing Measures: Current elevated state orders in regards to NPIs go on for stated length, or 3 weeks if length unstated
After 3 weeks, interventions step down from baseline to the lowest levels seen since May 2020 in a particular jurisdiction, over 2 one month steps.  
Testing-Trace-Isolate: Constant at baseline levels
Masking: Masking is maintained at baseline levels indefinitely. 
Vaccine: vaccine efficacy 70% after 2 doses, 20% after first dose
Time between doses: 4 weeks
Rollout following ACIP recommendations unless known to be contraindicated by state recommendations. (https://www.cdc.gov/vaccines/acip/meetings/downloads/slides-2020-12/COVID-02-Dooling.pdf)
Phase 1a: HCW, LTCF
Phase 1b: essential workers (education, food & ag, utilities, etc.)
Phase 1c: adults with high-risk conditions, adults 65+
~12.5 million courses January, 25 million per month thereafter

### Scenario C: Pessimistic/Counterfactual scenario relative to current conditions:
Scenario name for submission file: `counterfactual`  
Scenario id for submission file: `B-2020-12-22`

Social Distancing Measures: Current elevated state orders in regards to NPIs go on for stated length, or 3 weeks if length unstated
After 3 weeks, interventions step down from baseline to the lowest levels seen since May 2020 in a particular jurisdiction, over 2 one month steps.
Testing-Trace-Isolate: Constant at baseline levels
Masking: Masking is maintained at baseline levels indefinitely. 
Vaccine: No vaccine

### Scenario D: Pessimistic scenario with compliance below lowest rates seen so far
Scenario name for submission file: `pessimistic`  
Scenario id for submission file: `D-2020-12-22`

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
 
