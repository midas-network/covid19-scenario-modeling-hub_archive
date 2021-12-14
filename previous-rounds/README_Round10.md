# COVID-19 Scenario Modeling Hub 

Last updated: 10-27-2021 for **Round 10 Scenarios**.


## Previous Round Scenarios and Results: 
[https://covid19scenariomodelinghub.org/viz.html](https://covid19scenariomodelinghub.org/viz.html)


Round 9: [Scenario Descriptions](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round9.md) and [Model Details]( https://github.com/midas-network/covid19-scenario-modeling-hub#teams-and-models)


## Rationale
Even the best models of emerging infections struggle to give accurate forecasts at time scales greater than 3-4 weeks due to unpredictable drivers such as a changing policy environment, behavior change, the development of new control measures, and stochastic events. However, policy decisions around the course of emerging infections often require projections in the time frame of months. The goal of long-term projections is to compare outbreak trajectories under different scenarios, as opposed to offering a specific, unconditional estimate of what “will” happen. As such, long-term projections can guide longer-term decision-making while short-term forecasts are more useful for situational awareness and guiding immediate response. The need for long-term epidemic projections is particularly acute in a severe pandemic, such as COVID-19, that has a large impact on the economy; for instance, economic and budget projections require estimates of outbreak trajectories in the 3-6 month time scale. 

From weather to infectious diseases, it has been shown that synergizing results from multiple models gives more reliable projections than any one model alone. In the COVID-19 pandemic this approach has been exemplified by the [COVID-19 Forecast Hub](https://covid19forecasthub.org/), which combines the results of over 30 models (see a [report](https://www.medrxiv.org/content/10.1101/2020.08.19.20177493v1) on the first wave of the pandemic). Further, a [comparison](https://www.medrxiv.org/content/10.1101/2020.11.03.20225409v1) of the impact of interventions across 17 models has illustrated how any individual model can grossly underestimate uncertainty, while ensemble projections can offer robust projections of COVID-19 the course of the epidemic under different scenarios at a 6-month time scale.

The [COVID-19 Forecasting Hub](https://covid19forecasthub.org/) provides useful and accurate short-term forecasts, but there remains a lack of publicly available model projections at 3-6 month time scale. Some single models are available online (e.g., [IHME](https://covid19.healthdata.org/united-states-of-america), or [Imperial College](https://www.imperial.ac.uk/mrc-global-infectious-disease-analysis/covid-19/report-33-vaccine/)), but a decade of infectious disease forecasts has demonstrated that projections from a single model are particularly risky. Single model projections are particularly problematic for emerging infections where there is much uncertainty about basic epidemiological parameters (such as the waning of immunity), the transmission process, future policies, the impact of interventions, and how the population may react to the outbreak and associated interventions. There is a need for generating long-term COVID-19 projections combining insights from different models and making them available to decision-makers, public health experts, and the general public. We plan to fill this gap by building a public COVID-19 Scenario Hub to harmonize scenario projections in the United States. 

We have specified a set of scenarios and target outcomes to allow alignment of model projections for collective insights. Scenarios have been designed in consultation with academic modeling teams and government agencies (e.g., CDC). 

## How to participate
The COVID-19 Scenario Modeling Hub is be open to any team willing to provide projections at the right temporal and spatial scales, with minimal gatekeeping. We only require that participating teams share point estimates and uncertainty bounds, along with a short model description and answers to a list of key questions about design. A major output of the projection hub would be ensemble estimates of epidemic outcomes (e.g., cases, hospitalization and/or deaths), for different time points, intervention scenarios, and US jurisdictions. 

Those interested to participate should register [here](https://docs.google.com/spreadsheets/d/1K3vsjDURG0R6-9p86y5h3s11eszwLvXWqCu2lfjlXnI/edit#gid=0). Registration does not commit participants to submitting model contributions. 

Model projections should be submitted via pull request to the data-processed folder of this GitHub repository. Technical instructions for submission and required file formats can be found [here](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/README.md). 


</br>


## Round 10 Scenarios    

Round 10 of SMH will concentrate on evaluating the impact of boosters and waning immunity on COVID-19 dynamics. We have designed a 2\*2 scenario structure where booster coverage is represented in one axis and the characteristics of waning immunity are on the other axis.

</br>

### Scenario Differences

<img src= "https://raw.githubusercontent.com/midas-network/covid19-scenario-modeling-hub/master/prevous-rounds/Round10_scenarios_table.PNG">

</br>

#### Interpretation and structure of waning:

**Interpretation:** These scenarios are intended to illustrate a gradual decay of immune protection with time, rather than the impact of an immune escape variant. 

**Model structure:** Teams are encouraged to model waning immunity as a partial loss of immune protection, where individuals go back to a partially immune state after a period prescribed in the scenarios (mean of 6 month or 1 year depending on the scenario). Individuals who have reached a partially immune state have reduced probabilities of reinfection and severe disease compared to naive individuals. <br>
**The same parameters should be used for waning immunity from natural infection and vaccination.**
 
**Model parameters defined in scenarios:** <br>
Interpretation of waning parameters is similar to that of round 8. <br>
Specifically, in the optimistic waning scenario, protection from infection is 60% for individuals < 65yrs in the partially immune state. This means that, for these individuals, the transition out of the partially immune state and into infection is 0.4\*force of infection applied to naive individuals of the same age. If we apply this waning parameter to vaccinated people, this corresponds to a VE of 60% against **infection**. <br/>
Further, in this scenario, protection against hospitalization is 90% for those under 65 yrs. This estimate is similar to VE against hospitalization and death, so it is **not a conditional probability**. This means that if we follow two individuals over time, one with partial immunity and one completely naive, the probability that the partially immune individual will be hospitalized from COVID19 is 0.1 times the probability that a naive individual will be hospitalized. Hence this probability combines protection against infection and protection against hospitalization given infection. If we apply this parameter to vaccinated individuals for whom immunity has partially waned, their VE against **hospitalization** becomes 90%. 

**Unconstrained model parameters:** <br>
Teams can choose different distributions of waning immunity (exponential, gamma); we only prescribe the mean. <br>
Teams should use their own judgments to parametrize protection against **symptoms** in the partially immune state, and any reduction in **transmission** that partially immune individuals may have. <br>
Teams can choose to treat individuals who have immunity from natural infection and vaccination differently from individuals who had a single exposure to the pathogen/antigen. <br>
We do not specify any waning for J&J (for which the starting point VE is much lower): teams can choose to ignore J&J, which represents a small fraction of all vaccinated in the US, or apply a different waning for J&J. <br>
We do not specify any waning for those who only get a 1st dose of Pfizer or Moderna and hence never acquire full vaccine immunity. We believe this represents a small fraction of all vaccinated. Teams can choose to apply a different waning to these individuals, or ignore them. <br>

All of these assumptions (especially the distribution of waning times) should be documented in meta-data.

#### Initial VE (before waning) and boosters:

**Initial VE (before waning):** We suggest that teams use a **VE of 80% against symptomatic COVID-19 in those over 65 yrs**, and **VE of 90% in those under 65 years**, while protection against infection and severe outcomes remains at teams’ discretion. This is based on data from [US](https://pubmed.ncbi.nlm.nih.gov/34619098/), [UK](https://khub.net/documents/135939561/338928724/Vaccine+effectiveness+and+duration+of+protection+of+covid+vaccines+against+mild+and+severe+COVID-19+in+the+UK.pdf/10dcd99c-0441-0403-dfd8-11ba2c6f5801), [CDC](https://www.cdc.gov/vaccines/acip/meetings/downloads/slides-2021-09-22/04-COVID-Link-Gelles-508.pdf), [NY](https://pubmed.ncbi.nlm.nih.gov/34529645/) and [CDC MMWR](https://www.cdc.gov/mmwr/volumes/70/wr/mm7034e2.htm?s_cid=mm7034e2_w).

**Impact of boosters on VE:** Boosters should be implemented in a way that individuals who have received a booster shot will revert to the same level of protection that they had before any waning occurred. 

**Booster coverage:** <br/> 

*  Past booster data until start of simulations should be based on state-specific booster uptakes for the period up to present.  Data on vaccine boosters coverage is available from [CDC](https://covid.cdc.gov/covid-data-tracker/#vaccinations_vacc-total-admin-rate-total) (13% coverage in 65+, 5% in 18+ on 10/14/2021). 
*  In high booster scenarios, we recommend a saturation level of 70% for booster coverage, which is **70%** of adults who have already received a full vaccine course. The timing and pace of getting to saturation is left at teams discretion; note that a 6-month interval between the initial vaccine course and boosters is recommended. We recommend that 70% be applied to the state-specific coverage of 2nd dose in adults. 70% is based on the upper bound of a September survey of [Kaiser Permanente](https://www.kff.org/coronavirus-covid-19/dashboard/kff-covid-19-vaccine-monitor-dashboard/) that monitors propensity to get a booster shot among those who have already been vaccinated.
*  In low booster scenarios, we recommend a saturation level of 40% for booster coverage, which is **40%** of adults who have already received a full vaccine course. The timing and pace of getting to saturation is left at teams discretion. We recommend that 40% be applied to the state-specific coverage of 2nd dose in adults. 40% is based on the lower bound of the [Kaiser Permanente survey](https://www.kff.org/coronavirus-covid-19/dashboard/kff-covid-19-vaccine-monitor-dashboard/) (full range of survey responses, 40-70%, across various socio-demographic groups and political affiliations).
*  We do not specify different parameters for different combinations of vaccines available (eg, initial vaccination with Pfizer followed by Moderna booster, etc). 

**Booster timing:** <br/> 
*  A recommendation for boosters targeted at older and high-risk adults was issued on [September 24, 2021](https://www.cdc.gov/media/releases/2021/p0924-booster-recommendations-.html). These recommendations are very inclusive and include multiple groups prone to high-risk exposures, representing a large fraction of all US adults. Accordingly, we do not consider a formal extension of ACIP recommendations to all adults. Instead we consider two saturation levels for boosters.
 
### Common Specifications
<br/>

**Vaccination** <br/> 
<br/> 
Coverage of initial vaccine courses (pre-boosters): Vaccine hesitancy is expected to cause vaccination coverage to slow and eventually saturate at some level below 100%. The coverage saturation, the speed of that saturation, and heterogeneity between states (or other geospatial scales) and/or age groups are at the discretion of the modeling teams. We suggest that the teams use estimates from the Delphi group, adjusted for potential bias in respondents ([link](https://delphi.cmu.edu/covidcast/indicator/?date=20210313&sensor=fb-survey-smoothed_covid_vaccinated_or_accept)) and the Pulse Survey overall estimates, adjusted for survey participant vaccination coverage ([link](https://data.cdc.gov/stories/s/Vaccine-Hesitancy-for-COVID-19/cnd2-a6zw)).

Vaccine-eligible population. The eligible population for 1st/2nd dose vaccination is presumed **to be individuals aged 12 years and older until November 15, and 5 years and older from November 15** through the end of the projection period. 

**For vaccine coverage in the 5-11 yo, starting on November 15, 2021, we recommend the same strategy as in round 9. Specifically, state-specific vaccine coverage in 12-17 yrs from May 2021 onwards should be applied to the 5-11 yo.**

*   <ins>VE</ins>: 
    *	We recommend that teams use the following for VE against symptoms: **VE=35% (first dose), VE=80% (2nd dose, > 65 yrs), VE= 90% (2nd dose, < 65 yrs)** for Moderna/Pfizer, against Delta. **This is the initial VE, before any waning**. VE is defined here as vaccine effectiveness against symptomatic disease. Teams should make their own informed assumptions about effectiveness and impacts on other outcomes (e.g., infection, hospitalization, death). <br/>
<br/>
*   <ins>Dose Available</ins>:
    * J&J no longer available (after May 2021) 
    *	Supply has eclipsed demand at this stage. 
    *	We do not anticipate any constraint in booster supply

**Variant progression and transmissibility:**  <br/>
Teams should use their own judgment to project the continued progress and transmissibility of the Delta variant, and related lineages, across US states. In this round, there is no new variant  that arrives in the US between now and the end of the projections. \
Teams can implement increases in transmissibility or severity of the Delta variant, but these should fit within the scenario specifications and  should be fully documented in meta-data.

**NPI:** <br/>
We don’t specify different levels of non-pharmaceutical interventions (NPI) use; however, teams should consider that most schools have returned to in-person education in fall 2021 and high level health officials have noted that “people should feel safe to mingle at Thanksgiving and Christmas”. The future level of NPIs are left at the discretion of the modeling teams and should be specified in the teams’ metadata. Teams should also note the change in CDC [mask recommendations](https://www.cdc.gov/coronavirus/2019-ncov/vaccines/fully-vaccinated.html) for vaccinated people in high-transmission areas on 07/27/2021.

</br>


### Submission Information

| Scenario                                                               | Scenario name for submission file | Scenario ID for submission file |
| ---------------------------------------------------------------------- |:---------------------------------:|:-------------------------------:|
| Scenario A. Optimistic waning, widespread boosters                     | optWan_highBoo                    | A-2021-11-09                    |
| Scenario B. Optimistic waning, restricted boosters                     | optWan_lowBoo                     | B-2021-11-09                    |
| Scenario C. Pessimistic waning, widespread boosters                    | pessWan_highBoo                   | C-2021-11-09                    |
| Scenario D. Pessimistic waning, restricted boosters                    | pessWan_lowBoo                    | D-2021-11-09                    | 


*   **Due date**: December 3, 2021 (desired); December 6, 2021 (hard deadline) 
*   **End date for fitting data**: No earlier than Nov 13, 2021 and no later than Nov 20, 2021 (cut-off date at the discretion of individual teams; no fitting should be done to data after Nov 20)
*   **Start date for scenarios**: Nov 14, 2021 (first date of simulated transmission/outcomes). The week ending Nov 20th is week 1 of projection (week from 2021-11-14 to 2021-11-20).  Note that if you used data until Nov 20th for calibration, your first week of projections (Nov 14- Nov 20) will be your model-fitted incidences for 1 wk ahead and the first target_end_date will be Nov 20, 2021.
*   **Simulation end date: Nov 12, 2022 (52-week horizon)**; Projections with horizon between 26 week and 52 week are also accepted.
</br>

### Scenario and Simulation Details

*	**Social Distancing Measures:**
    *	Includes combined effectiveness/impact of all non-pharmaceutical interventions and behavior change.
    * Current and future levels of social distancing are to be defined by the teams based on their understanding of current and planned control and behavior and expectations. Teams should consider that most jurisdictions are opening fairly quickly, and most schools intend to return to in-person education in the fall. No reactive interventions should be planned.
*	**Testing-Trace-Isolate:** constant at baseline levels
*	**Masking:** Included as part of “Social Distancing Measures” above.
* **Immune waning and Immune escape:** Immune waning as described above; immune escape as defined by the modeling team.
*	**Vaccination:**
    *	**Pfizer / Moderna**
        *	**Vaccine efficacy (2-dose vaccines):**
            * VE against symptoms: see above
            *	Effectiveness and impact on infection and other outcomes (hospitalizations, deaths) is at team’s discretion and should be clearly documented in team’s metadata.
            *	Doses 3.5 weeks apart
        *	**Vaccine availability:**
            *	No constraint in supply.
    *	**Johnson & Johnson**
        *	**Vaccine efficacy (1-dose):**
            *   70% VE against previous strains; 60% VE against B.1.1.7/B.1.617.2
        *	**Vaccine availability:**
            *	March-May 2021: based on data on administered doses, with continuing at rate current on date of projection for remainder of month (~10M total administered).
            *	June 2021-Nov 2022: No longer available; only 10M of 20M doses administered, supply, safety, and demand issues.
            * Manner for accounting for protection provided in the 10M vaccinated during March-May 2021 at team's discretion.
*	**Vaccine Hesitancy:** Vaccine hesitancy expected to cause vaccination coverage to slow and saturate below 100%. Speed and level of saturation and heterogeneity between states (or other geospatial scale) and/or age groups are at the discretion of the team.
*	**Delta (B.1.617.2) variant strain:** At teams’ discretion. No immune escape feature for Delta variant.
*   **Transmission assumptions**: models fit to US state-specific dynamic up until "End date for fitting data" specified above – no proscribed R<sub>0</sub>, interventions, etc.
*   **Pathogenicity assumptions**: no exogenous fluctuations in pathogenicity/transmissibility beyond seasonality effects.
*   **Vaccine effectiveness**: see recommendations (same VE in all scenarios); assumptions regarding time required to develop immunity, age-related variation in effectiveness, duration of immunity, and additional effects of the vaccine on transmission are left to the discretion of each team
*   **Vaccine immunity delay:** There is approximately a 14 day delay according to the Pfizer data; because we suspect the post first dose and post second dose delays may be of similar length, we do not believe there is any need to explicitly model a delay, instead groups can delay vaccine receipt by 14 days to account for it.
*   **Vaccine uptake:** See specific details.
*   **NPI assumptions**: NPI estimates should be based on current trends and reported planned changes.
*   **Database tracking of NPIs**: teams may use their own data if desired, otherwise we recommend the following sources as a common starting point:
    *   [Coronavirus Government Response Tracker | Blavatnik School of Government (ox.ac.uk)](https://www.bsg.ox.ac.uk/research/research-projects/coronavirus-government-response-tracker)
    *   [Coronavirus State Actions - National Governors Association (nga.org)](https://www.nga.org/coronavirus-state-actions-all/)
*   **Geographic scope**: state-level and national projections
*   **Results**: some subset of the following
    *   Weekly incident deaths
    *   Weekly cumulative deaths since start of pandemic (use JHU CSSE for baseline)
    *   Weekly incident reported cases
    *   Weekly cumulative reported cases since start of pandemic (use JHU CSSE for baseline)
    *   Weekly incident hospitalizations
    *   Weekly cumulative hospitalizations since simulation start
    *   **Weeks will follow epi-weeks (Sun-Sat) dated by the last day of the week**
*   **“Ground Truth”**: The same data sources as the forecast hub will be used to represent “true” cases, deaths and hospitalizations. Specifically, JHU CSSE data for cases and deaths and HHS data for hospitalization. 
*   **Metadata:** We will require a brief meta-data form, TBD, from all teams. 
*   **Uncertainty**: aligned with the Forecasting Hub we ask for **0 (min)**, 0.01, 0.025, 0.05, every 5% to 0.95, 0.975, and 0.99, **1 (max)** quantiles. 
*   **Ensemble Inclusion**: at present time, in order to be included in the ensemble models need to provide a full set of quantiles

</br>

</br>

## Previous Rounds' Scenarios    

- Round 2 Scenarios
- [Round 3 Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/Round3_Scenarios.md)
- [Round 4 Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round4.md)
- [Round 5 Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round5.md)
- [Round 6 Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round6.md)
- [Round 7 Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round7.md)
- [Round 8 Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round8.md)
- [Round 9 Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round9.md)

</br>


## Submitting model projections
Groups interested in participating can submit model projections for each scenario in a CSV file formatted according to our specifications, and a metadata file with a description of model information. See [here](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/README.md) for technical submission requirements. Groups can submit their contributions as often as they want; the date of when a model projection was made (projection date) is recorded in the model submission file.   

### Model projection dates
Model projections will have an associated `model_projection_date` that corresponds to the day the projection was made.    

For week-ahead model projections with `model_projection_date` of Sunday or Monday of EW12, a 1 week ahead projection corresponds to EW12 and should have `target_end_date` of the Saturday of EW12. For week-ahead projections with `model_projection_date` of Tuesday through Saturday of EW12, a 1 week ahead projection corresponds to EW13 and should have `target_end_date` of the Saturday of EW13. A week-ahead projection should represent the total number of incident deaths or hospitalizations within a given epiweek (from Sunday through Saturday, inclusive) or the cumulative number of deaths reported on the Saturday of a given epiweek. We have created [a csv file](template/covid19-death-forecast-dates.csv) describing projection collection dates and dates to which projections refer to can be found. Model projection dates in the COVID-19 Scenario Modeling Hub are equivelent to the forecast dates in the [COVID-19 Forecast Hub](https://covid19forecasthub.org/). 

### Gold standard data
We will use the daily reports containing COVID-19 cases and deaths data from the [JHU CSSE group](https://coronavirus.jhu.edu/map.html) as the gold standard reference data for cases and deaths in the US. We will use the distribution of the JHU data as provided by the [COVIDcast Epidata API](https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html) maintained by the [Delphi Research Group](https://delphi.cmu.edu/about/) at Carnegie Mellon University. 

For COVID-19 hospitalizations, we will use the same truth data as the COVID-19 Forecast Hub, i.e., the [HealthData.gov COVID-19 Reported Patient
Impact and Hospital Capacity by State Timeseries](https://healthdata.gov/Hospital/COVID-19-Reported-Patient-Impact-and-Hospital-Capa/g62h-syeh).
These data are released weekly although, sometimes, are updated more frequently.

A supplemental data source with daily counts that should be updated more frequently (typically daily) but does not include the full time-series
is [HealthData.gov COVID-19 Reported Patient Impact and Hospital Capacity by State](https://healthdata.gov/dataset/COVID-19-Reported-Patient-Impact-and-Hospital-Capa/6xf2-c3ie).

Work is in progress to distribute these hospitalization data through the Covidcast Epidata API. For more information about hospitalization data, see the [data section](https://github.com/reichlab/covid19-forecast-hub/blob/master/data-processed/README.md) on the COVID-19 Forecast Hub. 

### Locations
Model projections may be submitted for any state  in the US and the US at the national level.

### Probabilistic model projections
Model projections will be represented using quantiles of predictive distributions. Similar to the [COVID-19 Forecast hub](https://covid19forecasthub.org/), we encourage all groups to make available the following 25 quantiles for each distribution: `c(0, 0.01, 0.025, seq(0.05, 0.95, by = 0.05), 0.975, 0.99, 1)`. One goal of this effort is to create probabilistic ensemble scenarios, and having high-resolution component distributions will provide data to create better ensembles. 

## Ensemble model
We aim to combine model projections into an ensemble. Methods and further information will be shared when the first round of model projections have been received. 

## Data license and reuse
We are grateful to the teams who have generated these scenarios. The groups have made their public data available under different terms and licenses. You will find the licenses (when provided) within the model-specific folders in the [data-processed](./data-processed/) directory. Please consult these licenses before using these data to ensure that you follow the terms under which these data were released.

All source code that is specific to the overall project is available under an open-source [MIT license](https://opensource.org/licenses/MIT). We note that this license does NOT cover model code from the various teams or model scenario data (available under specified licenses as described above). 

## Computational power
Those teams interested in accessing additional computational power should contact Katriona Shea at k-shea@psu.edu.

## Shared Code Resources
Teams are encouraged to share code they think will be useful to other teams via the github repo. This directory can be found in [code_resources](https://github.com/midas-network/covid19-scenario-modeling-hub/tree/master/code_resources). 
It currently contains code to:
  - Pull age-specific, state-specific, time-series data on vaccination in the US from the CDC API. [get_cdc_stateagevacc.R](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/code_resources/get_cdc_stateagevacc.R)



## Teams and models
*   [*Johns Hopkins ID Dynamics COVID-19 Working Group — COVID Scenario Pipeline*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/JHU_IDD-CovidSP/metadata-JHU_IDD-CovidSP.txt)
    *   Joseph C. Lemaitre (EPFL), Juan Dent Hulse (Johns Hopkins Infectious Disease Dynamics),
        Kyra H. Grantz (Johns Hopkins Infectious Disease Dynamics), Joshua Kaminsky (Johns Hopkins Infectious
        Disease Dynamics), Stephen A. Lauer (Johns Hopkins Infectious Disease Dynamics), Elizabeth C. Lee (Johns
        Hopkins Infectious Disease Dynamics), Justin Lessler (UNC), Hannah R. Meredith (Johns Hopkins Infectious Disease Dynamics), 
        Javier Perez-Saez (Johns Hopkins Infectious Disease Dynamics), Shaun A. Truelove (Johns Hopkins Infectious 
        Disease Dynamics), Claire P. Smith (Johns Hopkins Infectious Disease Dynamics),
        Allison Hill (Johns Hopkins Infectious Disease Dynamics), Lindsay T. Keegan (University of Utah),
        Kathryn Kaminsky, Sam Shah, Josh Wills, Pierre-Yves Aquilanti (Amazon Web Service),
        Karthik Raman (Amazon Web Services),  Arun Subramaniyan (Amazon Web Services), Greg Thursam (Amazon Web 
        Services), Anh Tran (Amazon Web Services)
*   [*Johns Hopkins University Applied Physics Lab — Bucky*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/JHUAPL-Bucky/metadata-JHUAPL-Bucky.txt)
    *   Matt Kinsey (JHU/APL), Kate Tallaksen (JHU/APL), R.F. Obrecht (JHU/APL), Laura Asher (JHU/APL), 
        Cash Costello (JHU/APL), Michael Kelbaugh (JHU/APL), Shelby Wilson (JHU/APL), Lauren Shin (JHU/APL), 
        Molly Gallagher (JHU/APL), Luke Mullany (JHU/APL), Kaitlin Lovett (JHU/APL)
*   [*Karlen Working Group — pypm*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/Karlen-pypm/metadata-Karlen-pypm.txt)
    *   Dean Karlen (University of Victoria and TRIUMF)
*   [*Northeastern University MOBS Lab — GLEAM COVID*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/MOBS_NEU-GLEAM_COVID/metadata-MOBS_NEU-GLEAM_COVID.txt)
    *   Matteo Chinazzi (Laboratory for the Modeling of Biological and Socio-technical Systems, Northeastern
        University, Boston, MA), Jessica T. Davis (Laboratory for the Modeling of Biological
        and Socio-technical Systems, Northeastern University, Boston, MA), Kunpeng Mu (Laboratory
        for the Modeling of Biological and Socio-technical Systems, Northeastern University, Boston,
        MA), Xinyue Xiong (Laboratory for the Modeling of Biological and Socio-technical Systems,
        Northeastern University, Boston, MA), Ana Pastore y Piontti (Laboratory for the Modeling
        of Biological and Socio-technical Systems, Northeastern University, Boston, MA), Alessandro
        Vespignani (Laboratory for the Modeling of Biological and Socio-technical Systems, Northeastern
        University, Boston, MA)
*   [*University of Southern California — SI kJalpha*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/USC-SIkJalpha/metadata-USC-SIkJalpha.txt)
    *   Ajitesh Srivastava (University of Southern California)
*   [*University of Virginia — adaptive*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/UVA-adaptive/metadata-UVA-adaptive.txt)
    *   Przemyslaw Porebski (UVA), Srini Venkatramanan (UVA), Anniruddha Adiga (UVA), Bryan
        Lewis (UVA), Brian Klahn (UVA), Joseph Outten (UVA), James Schlitt (UVA), Patrick Corbett
        (UVA), Pyrros Alexander Telionis (UVA), Lijing Wang (UVA), Akhil Sai Peddireddy (UVA),
        Benjamin Hurt (UVA), Jiangzhuo Chen (UVA), Anil Vullikanti (UVA), Madhav Marathe (UVA)
*   [*Columbia University - Age-Stratified Model*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/CU-AGE-ST/metadata-CU-AGE-ST.txt)
    *   Marta Galanti (CU), Teresa Yamana (CU), Sen Pei (CU), Jeffrey Shaman (CU)
*   [*University of North Carolina at Charlotte - hierbin*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/UNCC-hierbin/metadata-UNCC-hierbin.txt)
    * Shi Chen (UNC Charlotte Department of Public Health Sciences & School of Data Science), Rajib Paul (UNC Charlotte Department of Public Health Sciences and School of Data Science), Daniel Janies (UNC Charlotte Department of Bioinformatics and Genomics), Jean-Claude Thill (UNC Charlotte Department of Geography and Earth Sciences and School of Data Science)
*   [*Institute for Health Metrics and Evaluation – IHME COVID model deaths unscaled*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/IHME-IHME_COVID_model_deaths_unscaled/metadata-IHME-IHME_COVID_model_deaths_unscaled.txt)
    * Robert C Reiner, Joanne Amlag, Ryan M. Barber, James K. Collins, Peng Zheng, James Albright, Catherine M. Antony, Aleksandr Y. Aravkin, Steven D. Bachmeier, Marlena S. Bannick, Sabina Bloom, Austin Carter, Emma Castro, Kate Causey, Suman Chakrabarti, Fiona J. Charlson, Rebecca M. Cogen, Emily Combs, Xiaochen Dai, William James Dangel, Lucas Earl, Samuel B. Ewald, Maha Ezalarab, Alize J. Ferrari, Abraham Flaxman, Joseph Jon Frostad, Nancy Fullman, Emmanuela Gakidou, John Gallagher, Scott D. Glenn, Erik A. Goosmann, Jiawei He, Nathaniel J. Henry, Erin N. Hulland, Benjamin Hurst, Casey Johanns, Parkes J. Kendrick, Samantha Leigh Larson, Alice Lazzar-Atwood, Kate E. LeGrand, Haley Lescinsky, Emily Linebarger, Rafael Lozano, Rui Ma, Johan Månsson, Ana M. Mantilla Herrera, Laurie B. Marczak, Molly K. Miller-Petrie, Ali H. Mokdad, Julia Deryn Morgan, Paulami Naik, Christopher M. Odell, James K. O’Halloran, Aaron E. Osgood-Zimmerman, Samuel M. Ostroff, Maja Pasovic, Louise Penberthy, Geoffrey Phipps, David M. Pigott, Ian Pollock, Rebecca E. Ramshaw, Sofia Boston Redford, Sam Rolfe, Damian Francesco Santomauro, John R. Shackleton, David H. Shaw, Brittney S. Sheena, Aleksei Sholokhov, Reed J. D. Sorensen, Gianna Sparks, Emma Elizabeth Spurlock, Michelle L. Subart, Ruri Syailendrawati, Anna E. Torre, Christopher E. Troeger, Theo Vos, Alexandrea Watson, Stefanie Watson, Kirsten E. Wiens, Lauren Woyczynski, Liming Xu, Jize Zhang, Simon I. Hay, Stephen S. Lim & Christopher J. L. Murray
*   [*University of Virginia - EpiHiper*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/UVA-EpiHiper/metadata-UVA-EpiHiper.txt)
    * Jiangzhuo Chen (UVA), Stefan Hoops (UVA), Parantapa Bhattacharya (UVA), Dustin Machi (UVA), Bryan Lewis (UVA), Madhav Marathe (UVA) 
*   [*University of Notre Dame - FRED*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/NotreDame-FRED/metadata-NotreDame-FRED.txt)
    *   Guido Espana, Sean Cavany, Sean Moore, Alex Perkins
  
</br>

## The COVID-19 Scenario Modeling Hub Coordination Team

 - Justin Lessler, University of North Carolina
 - Katriona Shea, Penn State University
 - Cécile Viboud, NIH Fogarty
 - Shaun Truelove, Johns Hopkins University
 - Rebecca Borchering, Penn State University
 - Claire Smith, Johns Hopkins University
 - Emily Howerton, Penn State University
 - Nick Reich, University of Massachussetts at Amherst
 - Wilbert Van Panhuis, University of Pittsburgh
 - Harry Hochheiser, University of Pittsburgh
 - Michael Runge, USGS
 - Lucie Contamin, University of Pittsburgh
 - John Levander, University of Pittsburgh
 - Jessica Kerr, University of Pittsburgh
 - J Espino, University of Pittsburgh
 - Luke Mullany, Johns Hopkins University
 - Kaitlin Lovett, John Hopkins University
 - Michelle Qin, Harvard University

 
