# COVID-19 Scenario Modeling Hub 

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6584489.svg)](https://doi.org/10.5281/zenodo.6584489)  

Last updated: 7-22-2022 for **Round 15 Scenarios**.


## Previous Round Scenarios and Results:    

[https://covid19scenariomodelinghub.org/viz.html](https://covid19scenariomodelinghub.org/viz.html)

Round 14: [Scenario Descriptions](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/previous-rounds/README_Round14.md) and [Model Details]( https://github.com/midas-network/covid19-scenario-modeling-hub_archive#teams-and-models)

</br>


## Rationale    

Even the best models of emerging infections struggle to give accurate forecasts at time scales greater than 3-4 weeks due to unpredictable drivers such as a changing policy environment, behavior change, the development of new control measures, and stochastic events. However, policy decisions around the course of emerging infections often require projections in the time frame of months. The goal of long-term projections is to compare outbreak trajectories under different scenarios, as opposed to offering a specific, unconditional estimate of what “will” happen. As such, long-term projections can guide longer-term decision-making while short-term forecasts are more useful for situational awareness and guiding immediate response. The need for long-term epidemic projections is particularly acute in a severe pandemic, such as COVID-19, that has a large impact on the economy; for instance, economic and budget projections require estimates of outbreak trajectories in the 3-6 month time scale. 

From weather to infectious diseases, it has been shown that synergizing results from multiple models gives more reliable projections than any one model alone. In the COVID-19 pandemic this approach has been exemplified by the [COVID-19 Forecast Hub](https://covid19forecasthub.org/), which combines the results of over 30 models (see a [report](https://www.medrxiv.org/content/10.1101/2020.08.19.20177493v1) on the first wave of the pandemic). Further, a [comparison](https://www.medrxiv.org/content/10.1101/2020.11.03.20225409v1) of the impact of interventions across 17 models has illustrated how any individual model can grossly underestimate uncertainty, while ensemble projections can offer robust projections of COVID-19 the course of the epidemic under different scenarios at a 6-month time scale.

The [COVID-19 Forecasting Hub](https://covid19forecasthub.org/) provides useful and accurate short-term forecasts, but there remains a lack of publicly available model projections at 3-6 month time scale. Some single models are available online (e.g., [IHME](https://covid19.healthdata.org/united-states-of-america), or [Imperial College](https://www.imperial.ac.uk/mrc-global-infectious-disease-analysis/covid-19/report-33-vaccine/)), but a decade of infectious disease forecasts has demonstrated that projections from a single model are particularly risky. Single model projections are particularly problematic for emerging infections where there is much uncertainty about basic epidemiological parameters (such as the waning of immunity), the transmission process, future policies, the impact of interventions, and how the population may react to the outbreak and associated interventions. There is a need for generating long-term COVID-19 projections combining insights from different models and making them available to decision-makers, public health experts, and the general public. We plan to fill this gap by building a public COVID-19 Scenario Hub to harmonize scenario projections in the United States. 

We have specified a set of scenarios and target outcomes to allow alignment of model projections for collective insights. Scenarios have been designed in consultation with academic modeling teams and government agencies (e.g., CDC). 

</br>


## How to participate    

The COVID-19 Scenario Modeling Hub is be open to any team willing to provide projections at the right temporal and spatial scales, with minimal gatekeeping. We only require that participating teams share point estimates and uncertainty bounds, along with a short model description and answers to a list of key questions about design. A major output of the projection hub would be ensemble estimates of epidemic outcomes (e.g., cases, hospitalization and/or deaths), for different time points, intervention scenarios, and US jurisdictions. 

Those interested to participate should email scenariohub@midasnetwork.us .

Model projections should be submitted via pull request to the data-processed folder of this GitHub repository. Technical instructions for submission and required file formats can be found [here](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/data-processed/README.md). 

</br>


## Round 15 Scenarios     

Round 15 is an update of Round 14 that considers the timing of the fall booster campaign (first dimension) with the epidemiology of circulating strains (2nd dimension) over a **40**-week period. We follow the usual 2 * 2 table structure. We consider that reformulated boosters will be made available for all adults on Sep 11 or Nov 13, and that booster uptake will be indexed on the flu campaign.

<img src= "https://raw.githubusercontent.com/midas-network/covid19-scenario-modeling-hub_archive/master/previous-rounds/Round15_scenarios_table.PNG">

The VE of reformulated boosters available in the fall should be set to **80% against symptomatic disease** with all Omicron lineages (including BA.4/5) and pre-Omicron variants. However the VE of reformulated boosters should be decreased for variant X. Variant X partially escapes immunity conferred by all available vaccines and prior infection with Omicron and pre-Omicron lineages.

There may be an expansion of the 2nd booster recommendations to all adult age groups, sometime between the start of the projection period and the time when reformulated vaccines become available. Consideration of this expansion is left at teams’ discretion.


### **Waning Immunity:**

1. Waning of immunity against infection

Models should include waning against infection. 
The median waning time of protection against infection should range between **3-8** months. Teams can sample this range, or use any value within this range as a point estimate. Teams can consider differences in waning of natural and vaccine-induced immunity, or in waning after Omicron infection vs waning from other types of SARS-CoV-2 exposures; however the median waning time should remain within the **3-8** month range. </br>
We recommend that in the waned classes, teams consider a reduction from baseline levels of protection ranging between 40 and 60%, corresponding to x0.60 and x0.40 of the baseline levels reported immediately after exposure (vaccination or infection). This follows the same scheme as in round 13-14. Teams can sample the recommended range of protection reductions, which is 40-60%, or use any value within this range as a point estimate. </br>
These guidelines should not preclude teams from considering longer waning times, especially if they would like to integrate detailed waning data. A recent study suggests that vaccine-induced immunity [wanes](https://www.thelancet.com/journals/lancet/article/PIIS0140-6736(22)00089-7/fulltext) on long time scales and has not stabilized at 9 months. Accordingly, teams can choose to model longer time scales of waning, with a lower set point than prescribed above. If they do so, teams should ensure that in their formulation, 50% of their population has a 40-60% reduced protection 3-8 months after (re-)exposure, aligned with the above guidelines.  

2. Waning of immunity against severe disease

Absent a new variant, the risk of severe disease conditional on infection remains unchanged. This is the same assumption as in rd 13-14, which considers that while there is fast waning of immunity against infection, there is no waning in the risk of severe disease conditional on infection.  

### **New variant X:**

In scenarios B and D, we model the emergence of a new variant X, with moderate immune escape, set at 40%, and moderately increased risk of severe disease given infection, set at 20%.  

*Infection with variant X (immune escape).*  Let’s consider an individual who is currently in a state of immunity to infection, gained from past exposure to SARS-CoV-2 antigens (ie, infection with the wild type, Alpha, Delta, Omicron…) or vaccination (any number of doses). This individual, upon exposure to variant X, will have a 40% probability of infection with X, or a 40% increased probability of infection in a leaky model. 
Infection with variant X provides immunity to previously observed variants (e.g., Delta, Omicron). After infection with variant X, immune waning should progress as specified by the scenarios.  

*Severe disease with new variant X, given infection.* In the new variant scenarios B and D, the risk of severe disease, conditional on infection and an individual’s immune class, increases by 20% relative to Omicron. In other words, the risk of severe disease given a new variant infection is x1.20 the risk of severe disease with Omicron infection, for a comparable individual in the same immune class. The factor by which the risk of severe disease, conditional on infection, increases with the new variant is the same for hospitalization and death. As a result, the new variant CFR is x1.20 Omicron CFR, for a given immune class. 
By increasing the severity of variant X, conditional on infection, we implicitly consider the impact of two potential mechanisms that are non mutually exclusive: (i) variant X can partially evade a broad range of immune mediators that may have prevented progression to severe disease, and (ii) variant X may be intrinsically more severe, irrespective of immune escape and infectivity features (as seen with Delta).  

*Transmissibility.* The intrinsic transmissibility of the new variant should be the same as that of the strains circulating at the start of the projection period (same R0 as Omicron variants and subvariants = same effective transmissibility in a fully naive population, with the R0 value of Omicron left at teams discretion)  

*Variant introduction and ramp up.* Variant X is to be seeded in **the first full week of September 2022 (Sep 4-10, 2022), with 50 active infections of variant X** to be introduced during this week in the US (illustrating incoming variants from abroad). There will be a continuous influx of 50 weekly infections of variant X for a total of 16 weeks, **until the week of December 18-24, 2022, inclusive.** Geographic dispersion of these infections is left at teams discretion. The ramp up of the new variant due to local transmission is also left at the teams’ discretion.

### **Variant BA.2.75:**
Because there is little data on variant BA.2.75’s prevalence and fitness in the US, BA.2.75 should not be explicitly taken into account in the models.


### **VE of existing and reformulated vaccines:**

In June 2022, FDA recommended that vaccines be reformulated and include two components, an original Wuhan-like strain and an Omicron BA4/BA5 strain. Reformulated bivalent boosters are expected to become available in fall 2022, although the exact timing is uncertain. We assume that reformulated bivalent boosters will provide a moderately improved protection above existing boosters; yet the exact VE will depend on circulating strains this fall. Teams should set the VE of reformulated vaccines at  80% against symptomatic disease with the variants circulating at the start of the projection period (including all Omicron variants). For scenarios C and D in which variant X emerges on Sep 1, a reduction of VE against (infection and) symptomatic disease should be implemented over the theoretical 80%, in line with the 40% immune escape parameter.
The VE of a primary vaccine course and a non-reformulated booster are left at teams’ discretion. Note that as soon as reformulated boosters become available on Sep 11 or Nov 13, previously available vaccines will no longer be used. </br>
Relevant references for VE of non reformulated vaccines include:

*   Effect of 4th dose/2nd booster on infection and severe disease in Isreal https://www.nejm.org/doi/full/10.1056/NEJMoa2201570
*   UK data on VE against symptomatic disease, hospitalization and deaths, by dose, time since vaccination and sublineage of Omicron (including BA4/%) https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1083443/Vaccine-surveillance-report-week-24.pdf  
*   US data on waning of VE against ED and hospitalization with Delta and Omicron, after 2nd and 3rd doses https://www.cdc.gov/mmwr/volumes/71/wr/mm7107e2.htm
*   [Long term vaccine strategy](https://jamanetwork.com/journals/jama/fullarticle/2792030?resultClick=1) for COVID

### **Vaccine coverage data and dose spacing:**

*Vaccine coverage among adults:* Vaccine coverage is the same in all scenarios (booster recommended for all adults 18+), and teams should use 90% of the state-specific flu coverage reported for the 2021-2022 fall-winter season among adults (x0.90 of the flu coverage in 18+).  Teams should use the same file as in round 14 scenarios C and D ([here](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/round14_resources/Adult_Coverage_RD14_Sc_C_D.csv))



[COVID-19 coverage](https://github.com/HopkinsIDD/uscovid19vacc) for data by state (1, 2 and 3rd doses) and age group (1 and 2nd doses).  The distribution of who gets a booster among those for whom it is the 1st, 2nd or 3rd booster, and age differences in coverage within the 50+, is at the teams’ discretion. </br>
For scenarios C and D, teams should use the file [here](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/round14_resources/Adult_Coverage_RD14_Sc_C_D.csv) to simulate the coverage of reformulated boosters in fall-winter 2022-2023, and shift the start of the fall campaign according to rd 15 scenarios (Sep 11, 2022 or Nov 13, 2022). The data in this file provides weekly cumulative coverage by state and adult age groups to apply. Estimates are based on the reported coverage of the flu vaccine in the 2020-2021 season by month, state and age. We applied the rise in coverage reported during Aug-Oct 2020 to Oct 2022, used a Piecewise Cubic Hermite Interpolating Polynomial to generate weekly coverage estimates, and applied a discounting factor of 0.9 to account for fatigue from repeat COVID vaccination. 
The distribution of who gets a booster among those for whom it is the 1st, 2nd or 3rd booster, and age differences in coverage within the 18+, is at the teams’ discretion.
Note that a 2nd booster recommendation for 50+ is [already in place](https://www.cdc.gov/media/releases/2022/s0328-covid-19-boosters.html) since March 29, 2022 and will proceed from projection start t to the start of the fall campaign with reformulated vaccines, irrespective of the scenarios. Teams should use their best scientific judgment to model the impact of this recent recommendation, and possible expansions to all adults. 


*Vaccine coverage among children:*

*   5-11yr and 12-17yr: continue as previous rounds, with rates and saturation at teams’ discretion.
*   6m-4yr: no vaccination.

*Dose spacing:* Accounting for dose spacing is not required. 


### **Seasonality:**

Teams should include their best estimate of COVID-19 seasonality in their model but we do not prescribe  a specific level of seasonal forcing.

### **NPI:**

Round 15 should NOT include reactive changes in NPIs imposed by health authorities  to curb transmission, e.g., reinstatement of mask mandates, or closure of schools and businesses. However, teams can incorporate inherent changes in population behavior in response to increasing or decreasing incidences (eg, changes in contacts or masking), if these changes were inferred from earlier phases of the pandemic and are already part of the model. 

Database tracking of NPIs: teams may use their own data if desired, otherwise we recommend the following sources as a common starting point:

* [Coronavirus Government Response Tracker | Blavatnik School of Government (ox.ac.uk)](https://www.bsg.ox.ac.uk/research/research-projects/coronavirus-government-response-tracker)
* [Coronavirus State Actions - National Governors Association (nga.org)](https://www.nga.org/coronavirus-state-actions-all/)

### **Initial Conditions:**

The mix of circulating strains at the start of the projection period (July 31, 2022) is at the discretion of the teams based on their interpretation/analysis of the available data and estimates at the the time of projection. Variation in initial prevalence between states is left at teams’ discretion. BA.2.75 should not be included.  

### **Targets and case ascertainment:**

Ascertainment of cases, hospitalizations and deaths will proceed at the same level as they were at the start of the projection period.
We will continue to collect the same targets (cases, hospitalizations, deaths) but note that VRBPAC and ACIP are talking about a focus on severe disease moving forward.


**All of the teams’ specific assumptions should be documented in meta-data and abstract.** 

**Projection time horizon:** We consider a **40-week projection period.**

</br>

## Submission Information    

| Scenario                             | Scenario name for submission file | Scenario ID for submission file |
| ----------------------------------------------------- |:----------------------------:|:----------------------------:|
| Scenario A. Early boosters, No new variant            | earlyBoo_noVar  | A-2022-07-19    |
| Scenario B. Early boosters, New immune escape variant | earlyBoo_Var    | B-2022-07-19    |
| Scenario C. Late boosters, No new variant             | lateBoo_noVar   | C-2022-07-19    |
| Scenario D. Late boosters, New immune escape variant  | lateBoo_Var     | D-2022-07-19    | 
*   **Due date**: Aug 2, 2022
*   **End date for fitting data**: July 30, 2022 (no later than July 30, no earlier than July 23)
*   **Start date for scenarios**: July 31, 2022 (first date of simulated transmission/outcomes)
*   **Simulation end date:** May 6, 2023 (40-week horizon)
*   We aim to release results by Aug 9, 2022


**Other submission requirements**

*   **Geographic scope:** state-level and national projections
*   **Results:** some subset of the following
    *  Weekly incident deaths
    *  Weekly cumulative deaths since start of pandemic (use JHU CSSE for baseline)
    *  Weekly incident reported cases
    *  Weekly cumulative reported cases since start of pandemic (use JHU CSSE for baseline)
    *  Weekly incident hospitalizations
    *  Weekly cumulative hospitalizations since simulation start
    *  Weeks will follow epi-weeks (Sun-Sat) dated by the last day of the week
*   **Metadata:** We will require a brief meta-data form, from all teams.
*   **Uncertainty:** aligned with the Forecasting Hub we ask for 0.01, 0.025, 0.05, every 5% to 0.95, 0.975, and 0.99,. Teams are also encouraged to submit 0 (min value) and 1 (max) quantiles if possible. At present time, *inclusion in ensemble models requires a full set of quantiles from 0.01 to 0.99.*

</br>

## Previous Rounds' Scenarios    

- Round 2 Scenarios
- [Round 3 Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/previous-rounds/Round3_Scenarios.md)
- [Round 4 Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/previous-rounds/README_Round4.md)
- [Round 5 Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/previous-rounds/README_Round5.md)
- [Round 6 Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/previous-rounds/README_Round6.md)
- [Round 7 Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/previous-rounds/README_Round7.md)
- [Round 8 Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/previous-rounds/README_Round8.md)
- [Round 9 Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/previous-rounds/README_Round9.md)
- [Round 10 Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/previous-rounds/README_Round10.md)
- [Round 11 Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/previous-rounds/README_Round11.md)
- [Round 12 Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/previous-rounds/README_Round12.md)
- [Round 13 Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/previous-rounds/README_Round13.md)
- [Round 14 Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/previous-rounds/README_Round14.md)

</br>


## Submitting model projections
Groups interested in participating can submit model projections for each scenario in a CSV file formatted according to our specifications, and a metadata file with a description of model information. See [here](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/data-processed/README.md) for technical submission requirements. Groups can submit their contributions as often as they want; the date of when a model projection was made (projection date) is recorded in the model submission file.   

### Model projection dates
Model projections will have an associated `model_projection_date` that corresponds to the day the projection was made.    

For week-ahead model projections with `model_projection_date` of Sunday or Monday of EW12, a 1 week ahead projection corresponds to EW12 and should have `target_end_date` of the Saturday of EW12. For week-ahead projections with `model_projection_date` of Tuesday through Saturday of EW12, a 1 week ahead projection corresponds to EW13 and should have `target_end_date` of the Saturday of EW13. A week-ahead projection should represent the total number of incident deaths or hospitalizations within a given epiweek (from Sunday through Saturday, inclusive) or the cumulative number of deaths reported on the Saturday of a given epiweek. Model projection dates in the COVID-19 Scenario Modeling Hub are equivelent to the forecast dates in the [COVID-19 Forecast Hub](https://covid19forecasthub.org/). 

### Gold standard data
We will use the daily reports containing COVID-19 cases and deaths data from the [JHU CSSE group](https://coronavirus.jhu.edu/map.html) as the gold standard reference data for cases and deaths in the US. We will use the distribution of the JHU data as provided by the [COVIDcast Epidata API](https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html) maintained by the [Delphi Research Group](https://delphi.cmu.edu/about/) at Carnegie Mellon University. 


For COVID-19 hospitalizations, we used the [HealthData.gov COVID-19 Reported Patient Impact and Hospital Capacity by State Timeseries](https://healthdata.gov/Hospital/COVID-19-Reported-Patient-Impact-and-Hospital-Capa/g62h-syeh). These data are released weekly although, sometimes, are updated more frequently. 
A supplemental data source with daily counts that should be updated more frequently (typically daily) but does not include the full time-series
is [HealthData.gov COVID-19 Reported Patient Impact and Hospital Capacity by State](https://healthdata.gov/dataset/COVID-19-Reported-Patient-Impact-and-Hospital-Capa/6xf2-c3ie).


Starting Round 13 (W12-2022), for COVID-19 hospitalizations, we will use the same truth data as the COVID-19 Forecast Hub, i.e., the hospitalization data from the HHS for example the [HealthData.gov COVID-19 Reported Patient Impact and Hospital Capacity by State Timeseries](https://healthdata.gov/Hospital/COVID-19-Reported-Patient-Impact-and-Hospital-Capa/g62h-syeh) and [HealthData.gov COVID-19 Reported Patient Impact and Hospital Capacity by State](https://healthdata.gov/dataset/COVID-19-Reported-Patient-Impact-and-Hospital-Capa/6xf2-c3ie). We will use the distribution of the HHS data as provided by the 
[COVIDcast Epidata API](https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/hhs.html) maintained by the [Delphi Research Group](https://delphi.cmu.edu/about/) at Carnegie Mellon University. 

### Locations
Model projections may be submitted for any state  in the US and the US at the national level.

### Probabilistic model projections
Model projections will be represented using quantiles of predictive distributions. Similar to the [COVID-19 Forecast hub](https://covid19forecasthub.org/), we encourage all groups to make available the following 25 quantiles for each distribution: `c(0, 0.01, 0.025, seq(0.05, 0.95, by = 0.05), 0.975, 0.99, 1)`. One goal of this effort is to create probabilistic ensemble scenarios, and having high-resolution component distributions will provide data to create better ensembles. 

## Ensemble model
We aim to combine model projections into an ensemble.

## Data license and reuse
We are grateful to the teams who have generated these scenarios. The groups have made their public data available under different terms and licenses. You will find the licenses (when provided) within the model-specific folders in the [data-processed](./data-processed/) directory. Please consult these licenses before using these data to ensure that you follow the terms under which these data were released.

All source code that is specific to the overall project is available under an open-source [MIT license](https://opensource.org/licenses/MIT). We note that this license does NOT cover model code from the various teams or model scenario data (available under specified licenses as described above). 

## Computational power
Those teams interested in accessing additional computational power should contact Katriona Shea at k-shea@psu.edu.

## Shared Code Resources
Teams are encouraged to share code they think will be useful to other teams via the github repo. This directory can be found in [code_resources](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/tree/master/code_resources). 
It currently contains code to:
  - Pull age-specific, state-specific, time-series data on vaccination in the US from the CDC API. [get_cdc_stateagevacc.R](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/code_resources/get_cdc_stateagevacc.R)



## Teams and models    

*   [*Johns Hopkins ID Dynamics COVID-19 Working Group — COVID Scenario Pipeline*](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/data-processed/JHU_IDD-CovidSP/metadata-JHU_IDD-CovidSP.txt)
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
*   [*Johns Hopkins University Applied Physics Lab — Bucky*](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/data-processed/JHUAPL-Bucky/metadata-JHUAPL-Bucky.txt)
    *   Matt Kinsey (JHU/APL), Kate Tallaksen (JHU/APL), R.F. Obrecht (JHU/APL), Laura Asher (JHU/APL), 
        Cash Costello (JHU/APL), Michael Kelbaugh (JHU/APL), Shelby Wilson (JHU/APL), Lauren Shin (JHU/APL), 
        Molly Gallagher (JHU/APL), Luke Mullany (JHU/APL), Kaitlin Lovett (JHU/APL)
*   [*Karlen Working Group — pypm*](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/data-processed/Karlen-pypm/metadata-Karlen-pypm.txt)
    *   Dean Karlen (University of Victoria and TRIUMF)
*   [*Northeastern University MOBS Lab — GLEAM COVID*](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/data-processed/MOBS_NEU-GLEAM_COVID/metadata-MOBS_NEU-GLEAM_COVID.txt)
    *   Matteo Chinazzi (Laboratory for the Modeling of Biological and Socio-technical Systems, Northeastern
        University, Boston, MA), Jessica T. Davis (Laboratory for the Modeling of Biological
        and Socio-technical Systems, Northeastern University, Boston, MA), Kunpeng Mu (Laboratory
        for the Modeling of Biological and Socio-technical Systems, Northeastern University, Boston,
        MA), Xinyue Xiong (Laboratory for the Modeling of Biological and Socio-technical Systems,
        Northeastern University, Boston, MA), Ana Pastore y Piontti (Laboratory for the Modeling
        of Biological and Socio-technical Systems, Northeastern University, Boston, MA), Alessandro
        Vespignani (Laboratory for the Modeling of Biological and Socio-technical Systems, Northeastern
        University, Boston, MA)
*   [*University of Southern California — SI kJalpha*](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/data-processed/USC-SIkJalpha/metadata-USC-SIkJalpha.txt)
    *   Ajitesh Srivastava (University of Southern California)
*   [*University of Virginia — adaptive*](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/data-processed/UVA-adaptive/metadata-UVA-adaptive.txt)
    *   Przemyslaw Porebski (UVA), Srini Venkatramanan (UVA), Anniruddha Adiga (UVA), Bryan
        Lewis (UVA), Brian Klahn (UVA), Joseph Outten (UVA), James Schlitt (UVA), Patrick Corbett
        (UVA), Pyrros Alexander Telionis (UVA), Lijing Wang (UVA), Akhil Sai Peddireddy (UVA),
        Benjamin Hurt (UVA), Jiangzhuo Chen (UVA), Anil Vullikanti (UVA), Madhav Marathe (UVA)
*   [*Columbia University - Age-Stratified Model*](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/data-processed/CU-AGE-ST/metadata-CU-AGE-ST.txt)
    *   Marta Galanti (CU), Teresa Yamana (CU), Sen Pei (CU), Jeffrey Shaman (CU)
*   [*University of North Carolina at Charlotte - hierbin*](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/data-processed/UNCC-hierbin/metadata-UNCC-hierbin.txt)
    * Shi Chen (UNC Charlotte Department of Public Health Sciences & School of Data Science), Rajib Paul (UNC Charlotte Department of Public Health Sciences and School of Data Science), Daniel Janies (UNC Charlotte Department of Bioinformatics and Genomics), Jean-Claude Thill (UNC Charlotte Department of Geography and Earth Sciences and School of Data Science)
*   [*Institute for Health Metrics and Evaluation – IHME COVID model deaths unscaled*](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/data-processed/IHME-IHME_COVID_model_deaths_unscaled/metadata-IHME-IHME_COVID_model_deaths_unscaled.txt)
    * Robert C Reiner, Joanne Amlag, Ryan M. Barber, James K. Collins, Peng Zheng, James Albright, Catherine M. Antony, Aleksandr Y. Aravkin, Steven D. Bachmeier, Marlena S. Bannick, Sabina Bloom, Austin Carter, Emma Castro, Kate Causey, Suman Chakrabarti, Fiona J. Charlson, Rebecca M. Cogen, Emily Combs, Xiaochen Dai, William James Dangel, Lucas Earl, Samuel B. Ewald, Maha Ezalarab, Alize J. Ferrari, Abraham Flaxman, Joseph Jon Frostad, Nancy Fullman, Emmanuela Gakidou, John Gallagher, Scott D. Glenn, Erik A. Goosmann, Jiawei He, Nathaniel J. Henry, Erin N. Hulland, Benjamin Hurst, Casey Johanns, Parkes J. Kendrick, Samantha Leigh Larson, Alice Lazzar-Atwood, Kate E. LeGrand, Haley Lescinsky, Emily Linebarger, Rafael Lozano, Rui Ma, Johan Månsson, Ana M. Mantilla Herrera, Laurie B. Marczak, Molly K. Miller-Petrie, Ali H. Mokdad, Julia Deryn Morgan, Paulami Naik, Christopher M. Odell, James K. O’Halloran, Aaron E. Osgood-Zimmerman, Samuel M. Ostroff, Maja Pasovic, Louise Penberthy, Geoffrey Phipps, David M. Pigott, Ian Pollock, Rebecca E. Ramshaw, Sofia Boston Redford, Sam Rolfe, Damian Francesco Santomauro, John R. Shackleton, David H. Shaw, Brittney S. Sheena, Aleksei Sholokhov, Reed J. D. Sorensen, Gianna Sparks, Emma Elizabeth Spurlock, Michelle L. Subart, Ruri Syailendrawati, Anna E. Torre, Christopher E. Troeger, Theo Vos, Alexandrea Watson, Stefanie Watson, Kirsten E. Wiens, Lauren Woyczynski, Liming Xu, Jize Zhang, Simon I. Hay, Stephen S. Lim & Christopher J. L. Murray
*   [*University of Virginia - EpiHiper*](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/data-processed/UVA-EpiHiper/metadata-UVA-EpiHiper.txt)
    * Jiangzhuo Chen (UVA), Stefan Hoops (UVA), Parantapa Bhattacharya (UVA), Dustin Machi (UVA), Bryan Lewis (UVA), Madhav Marathe (UVA) 
*   [*University of Notre Dame - FRED*](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/data-processed/NotreDame-FRED/metadata-NotreDame-FRED.txt)
    *   Guido Espana, Sean Cavany, Sean Moore, Alex Perkins
*   [*University of Florida - ABM*](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/data-processed/UF-ABM/metadata-UF-ABM.txt)
    *   Thomas Hladish (University of Florida), Alexander Pillai (University of Florida), Kok Ben Toh (Northwestern University),  Ira Longini Jr. (University of Florida) 
*   [*North Carolina State University - COVSIM*](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/data-processed/NCSU-COVSIM/metadata-NCSU-COVSIM.txt)
    *   Erik Rosenstrom (North Carolina State University), Jessica Mele (North Carolina State University), Julie Swann (North Carolina State University), Julie Ivy (North Carolina State University), Maria Mayorga (North Carolina State University)
*   [*University of Texas at Austin - ImmunoSEIRS*](https://github.com/midas-network/covid19-scenario-modeling-hub_archive/blob/master/data-processed/UTA-ImmunoSEIRS/metadata-UTA-ImmunoSEIRS.txt)
    *   Anass Bouchnita (Lead modeler, University of Texas at Austin), Spencer Fox (University of Texas at Austin), Michael Lachmann (University of Texas at Austin), Lauren Ancel Meyers (Senior author, University of Texas at Austin), and the UT COVID-19 Modeling Consortium
  
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

 
