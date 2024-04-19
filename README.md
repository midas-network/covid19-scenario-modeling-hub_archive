# COVID-19 Scenario Modeling Hub

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6584489.svg)](https://doi.org/10.5281/zenodo.6584489)

Last updated: 22-03-2024 for **Round 18 Scenarios**.

## Previous Round Scenarios and Results:

<https://covid19scenariomodelinghub.org/viz.html>

Round 17: [Scenario
Descriptions](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round17.md)
and [Model
Details](https://github.com/midas-network/covid19-scenario-modeling-hub#teams-and-models)

## Rationale

Even the best models of emerging infections struggle to give accurate
forecasts at time scales greater than 3-4 weeks due to unpredictable
drivers such as a changing policy environment, behavior change, the
development of new control measures, and stochastic events. However,
policy decisions around the course of emerging infections often require
projections in the time frame of months. The goal of long-term
projections is to compare outbreak trajectories under different
scenarios, as opposed to offering a specific, unconditional estimate of
what "will" happen. As such, long-term projections can guide longer-term
decision-making while short-term forecasts are more useful for
situational awareness and guiding immediate response. The need for
long-term epidemic projections is particularly acute in a severe
pandemic, such as COVID-19, that has a large impact on the economy; for
instance, economic and budget projections require estimates of outbreak
trajectories in the 3-6 month time scale.

From weather to infectious diseases, it has been shown that synergizing
results from multiple models gives more reliable projections than any
one model alone. In the COVID-19 pandemic this approach has been
exemplified by the [COVID-19 Forecast
Hub](https://covid19forecasthub.org/), which combines the results of
over 30 models (see a
[report](https://www.medrxiv.org/content/10.1101/2020.08.19.20177493v1)
on the first wave of the pandemic). Further, a
[comparison](https://www.medrxiv.org/content/10.1101/2020.11.03.20225409v1)
of the impact of interventions across 17 models has illustrated how any
individual model can grossly underestimate uncertainty, while ensemble
projections can offer robust projections of COVID-19 the course of the
epidemic under different scenarios at a 6-month time scale.

The [COVID-19 Forecasting Hub](https://covid19forecasthub.org/) provides
useful and accurate short-term forecasts, but there remains a lack of
publicly available model projections at 3-6 month time scale. Some
single models are available online (e.g.,
[IHME](https://covid19.healthdata.org/united-states-of-america), or
[Imperial
College](https://www.imperial.ac.uk/mrc-global-infectious-disease-analysis/covid-19/report-33-vaccine/)),
but a decade of infectious disease forecasts has demonstrated that
projections from a single model are particularly risky. Single model
projections are particularly problematic for emerging infections where
there is much uncertainty about basic epidemiological parameters (such
as the waning of immunity), the transmission process, future policies,
the impact of interventions, and how the population may react to the
outbreak and associated interventions. There is a need for generating
long-term COVID-19 projections combining insights from different models
and making them available to decision-makers, public health experts, and
the general public. We plan to fill this gap by building a public
COVID-19 Scenario Hub to harmonize scenario projections in the United
States.

We have specified a set of scenarios and target outcomes to allow
alignment of model projections for collective insights. Scenarios have
been designed in consultation with academic modeling teams and
government agencies (e.g., CDC).

## How to participate

The COVID-19 Scenario Modeling Hub is be open to any team willing to
provide projections at the right temporal and spatial scales, with
minimal gatekeeping. We only require that participating teams share
point estimates and uncertainty bounds, along with a short model
description and answers to a list of key questions about design. A major
output of the projection hub would be ensemble estimates of epidemic
outcomes (e.g., cases, hospitalization and/or deaths), for different
time points, intervention scenarios, and US jurisdictions.

Those interested to participate, please read the README file and email
us at
[scenariohub\@midasnetwork.us](mailto:scenariohub@midasnetwork.us).

Model projections should be submitted via pull request to the
data-processed folder of this GitHub repository. Technical instructions
for submission and required file formats can be found
[here](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/README.md).

## Round 18 Scenarios

Round 18 focuses on the impact of different COVID-19 vaccination
strategies with reformulated boosters combined with differing levels
of antigenic drift. This round will follow closely the layout of
Round 17, but with more consideration of population groups at
high-risk for severe disease (of any age). The timeframe of projection 
will be Sun April 28, 2024 to Sat April 26, 2025 (52 weeks).



![](https://raw.githubusercontent.com/midas-network/covid19-scenario-modeling-hub/master/previous-rounds/Round18_scenarios_table.PNG)


### **Vaccine Efficacy & Availability**

In all scenarios, boosters are reformulated to match the predominant 
variants circulating on June 15, 2024.  Teams should use VE against 
COVID19 hospitalization = 75% at time of release on Sep 1, 2024, in 
line with a recent study from 
[Denmark](https://www.thelancet.com/journals/laninf/article/PIIS1473-3099(23)00746-6/fulltext).
This VE is equivalent to a vaccine trial that would be performed on 
September 1 in populations with varying levels of prior immunity at 
trial enrollment. Hence, vaccinated individuals would have a 75% 
reduced risk of hospitalization compared to unvaccinated individuals 
on average in this trial, if VE was estimated a few days after Sepetember 
1st. Importantly, this stated hospitalization reduction includes the 
combined effects of protection against infection and protection against 
hospitalization given (breakthrough) infection. We note that this is a 
departure from earlier COVID-19 rounds where we stipulated VE against 
symptomatic disease. Based on available evidence, we suggest that teams 
choose VE against infection in the range 35-57% at time of release on 
Sept 1, 2024 (see 
[Google Docs](https://docs.google.com/document/d/1H-6Q9dIDjLCubU-oRAoVHyw7Lr-rlb_D_zp31hNyMGw/edit) 
for detailed studies).


As in Round 17, immune escape may decrease the effective VE against 
hospitalization, starting on September 1. While immune escape against 
infection should be modeled as stipulated in the scenarios (20/50% a year), 
immune escape against severe disease is at teams’ discretion.  
Further, waning of (vaccine-induced and natural) immunity against infection is 
required, with parameters at teams discretion (3-10mo waning time, 40-60% 
reduction against baseline protection levels in waned state). Waning of 
vaccine-induced immunity against severe disease remains at teams discretion 
(but if present should wane at slower timescale than against infection).



### **Vaccination Coverage**

*No recommendation (scenarios A & B):* There is no future
 recommendation to get additional booster doses or receive additional
 vaccination. Teams should not model any future vaccination except
 among those not previously vaccinated, specifically children aging
 into eligibility (i.e, at 6 months of age). Without recommendation,
 vaccines will not be covered by insurance or other sources.


*Annual vaccination with reformulated booster recommended for high
 risk groups (65+ and those with underlying risk factors)
 (scenarios C & D):* Uptake of annual reformulated booster in
 high-risk groups (65+ and other individuals with underlying risk
 factors for severe COVID-19 outcomes) follows uptake observed for
 the booster dose during the 2023-24 season. Vaccination among others
 outside of high risk groups should be negligible, except among
 infants aging into eligibility (at 6 months). For non-recommended
 groups, it should be assumed without recommendation these will not
 be covered by insurance or other health care funding and thus will
 not be received. Uptake data from the 2023-24 season in 65+ and
 high-risk groups will be provided.


*Annual vaccination with reformulated booster recommended for
 currently eligible groups (ages 6 months and older)(scenarios E &
 F):* Uptake of annual reformulated booster in all groups follows
 uptake observed for the booster dose during the 2023-24 season.
 Uptake data from the 2023-24 season will be provided.

In this round, we assume that high-risk populations, of any age, are
included in booster recommendations in scenarios C, D, E, & F. We 
define high-risk groups as those with underlying conditions putting 
them at increased risk of severe outcomes from COVID-19. Data on the 
population size and vaccine coverage of high and low risk groups is 
provided by state and age in GitHub. Teams can choose to adjust VE 
for high-risk and low-risk groups based on available evidence, 
although the population-level average VE against hospitalization 
should equal 75% on September 1. Data on increased risk of COVID-19 
hospitalization from high risk groups can be found 
[here](https://academic.oup.com/cid/article/72/11/e695/5908300).


Projected vaccine coverage curves for 2024-25 season, by age, 
state, and high-risk group, with population sizes of relevant age 
groups, are available in the 
[round_resources/round18](./round_resources/round18/) folder.


### **Immune Escape**

The SARS-CoV-2 virus is presumed to evolve away from existing immunity
at a roughly constant rate of 20% or 50% per year, depending on the
scenario. For example, in the 20% immune escape scenario, a vaccine
formulated for a variant circulating on June 15th would have a VE of
0.9 times the VE at reformulation when administered six months later
on December 15th. 


Similarly, immune escape will affect protection conferred by natural
infection. Let’s assume an individual is infected on June 15, 2024
and this infection confers X% protection against symptoms, compared
to an individual who has not been recently infected. If this
individual was instantaneously transported a year later, on June 15,
2025, with their antibodies from the 2024 infection intact, this
individual's protection against variants circulating on June 15, 2025
would be X * 0.8 in the 20% immune escape scenario. In this thought
experiment, the decay of protection would solely be due to the
effects of immune escape. In reality, moving away from the thought
experiment, if this individual actually lived throughout an entire
year without a new infection between June 2024 and June 2025, then
their effective immunity on June 15, 2025 will be the combined
effects of antibody waning (at a rate and plateau left at teams’
discretion)  and immune escape (prescribed by each scenario). 


Teams should note that the impact of immune escape is separate from
the impact of waning immunity (especially because the impact of
immune escape affects infection and vaccination differently),
although these processes may be implemented similarly in models. 


It is left to the teams’ discretion how to implement immune escape in
their models. Teams may choose to introduce new discrete variants
with levels of immune escape consistent with the scenario definition,
so long as these occur frequently, or may implement gradual escape of
existing variants.


### Waning of Immunity

Teams must incorporate waning of immunity against infection. The
median waning time of protection against infection should range
between 3-10 months (this should not be read to mean that waning is
to complete loss of protection, see below). Teams can sample this
range, or use any value within this range as a point estimate. Teams
can consider differences in waning of natural and vaccine-induced
immunity, or in waning after Omicron infection vs waning from other
types of SARS-CoV-2 exposures; however the median waning time should
remain within the 3-10 month range.


The rate and levels of waning are left to the best scientific
discretion of the teams. We recommend that in the waned classes,
teams consider a reduction from baseline levels of protection ranging
between 40% and 60%, corresponding to x0.60 and x0.40 of the baseline
levels reported immediately after exposure (vaccination or
infection).


Teams may incorporate waning of immunity against severe disease,
however the timescale of waning against severe disease must be slower
than the timescale of waning against infection.


### Handling immune escape and waning immunity in the calibration process

It is important that all scenario simulations share the same values
(or ranges of values) for the proportion of population in different
immune classes at the start of projections. Similarly, waning
immunity assumptions should be shared across scenarios
(including timescale of immunity decline and plateau reached after
immunity has waned, if any). To do so, teams should ensure that the
calibration step uses similar immune escape and waning immunity
parameters. Only by using assumptions that lead to starting
conditions for population immunity that effectively come from a
shared distribution across scenarios and by having the same waning
immunity assumptions (or shared distribution of waning immunities)
apply to all scenarios, can we evaluate the impact of different
immune escape and vaccine assumptions in the projection period. If
past immune escape and/or waning immunity parameters are unobservable
from the recent data, estimates can be drawn from the literature to
help with calibration. It is also acceptable to use the midpoint of
the immune escape scenario assumptions (35%, midpoint between 20% and
50%) for calibration of immune escape in the recent past.


### Variants

Teams should assume no new variants are introduced, other than those
implied by the levels of immune escape specified in the scenarios.
Treatment of variants existing at the start of the projection period
is left to the discretion of the teams. **Intrinsic transmissibility
and severity of disease in a naive individual** is assumed to be
constant across all currently-circulating and future variants. 

### **Seasonality**

Teams should include their best estimate of COVID-19 seasonality in
their model, but we do not prescribe a specific level of seasonal
forcing. Teams should consider the observed resurgence of COVID-19 in
the fall of 2023, particularly in Southern states, and in winter
2023-24 throughout the country. If feasible, we ask that teams check
that their models are able to reproduce the observed timing of
COVID-19 activity in the past year in their calibration step. 

### **NPIs**

Teams should NOT include reactive changes in NPIs imposed by health
authorities to curb transmission, e.g., reinstatement of mask
mandates, or closure of schools and businesses. However, teams can
incorporate inherent changes in population behavior in response to
increasing or decreasing incidences (eg, changes in contacts or
masking), if these changes were inferred from earlier phases of the
pandemic and are already part of the model. 


Database tracking of NPIs: teams may use their own data if desired,
otherwise we recommend the following sources as a common starting point:

-   [Coronavirus Government Response Tracker \| Blavatnik School of
    Government
    (ox.ac.uk)](https://www.bsg.ox.ac.uk/research/research-projects/coronavirus-government-response-tracker)
-   [Coronavirus State Actions - National Governors Association
    (nga.org)](https://www.nga.org/coronavirus-state-actions-all/)

### **Initial Conditions**

The mix of circulating strains at the start of the projection period
is at the discretion of the teams based on their
interpretation/analysis of the available data. Variation in initial
prevalence between states is left at teams’ discretion. 

### **Targets and case ascertainment:**

**Targets will be similar to Round 17 and consist of weekly state- and
  national-level COVID-19 hospitalizations and deaths.** We no longer
  request case projections. Ascertainment of hospitalizations and
  deaths will proceed at the same level as they were at the start of
  the projection period. HHS protect will be used as the source of
  hospitalization data (note that HHSprotect will temporarily go
  offline at the end of April 2024). NCHS will be used as the source
  of gold-standard death data. Note that 
  [NCHS](https://data.cdc.gov/NCHS/Provisional-COVID-19-Death-Counts-by-Week-Ending-D/r8kw-7aab)
  data source **counts deaths on the dates they occurred, not on the
  date they were reported.** In accordance with the data, the death
  target should give deaths on the date they occur.


### Population

Whether or not to include demographic dynamics (aging, birth) is at the
discretion of the teams.

***All of the teams' specific assumptions should be documented in
meta-data and abstract.***

**Projection Time Horizon:** We consider a one-year projection period.

## Submission Information

| Scenario  | Scenario name  | Scenario ID for submission file ('scenario_id') |
|---------------------------------|:-----------------:|:-----------------:|
| Scenario A. No booster, low immune escape  | noBoo_lowIE   | A-2024-03-01  |
| Scenario B. No booster, high immune escape | noBoo_highIE  | B-2024-03-01  |
| Scenario C. 65+ booster, low immune escape | 65Boo_lowIE   | C-2024-03-01  |
| Scenario D. 65+ booster, high immune escape| 65Boo_highIE  | D-2024-03-01  |
| Scenario E. All booster, low immune escape | allBoo_lowIE  | E-2024-03-01  |
| Scenario F. All booster, high immune escape| allBoo_highIE | F-2024-03-01  |


-   **Due date**: April 30, 2024

-   **End date for fitting data**: April 27, 2024 (no later than April
    27, no earlier than April 14)

-   **Start date for scenarios**: April 28, 2024 (first date of
    simulated transmission/outcomes)

-   **Simulation end date:** April 26, 2025 (52-week horizon)

**Submission Target**

- Weekly Incident Deaths
- Weekly Incident Hospitalization


**Other submission requirements**

-   **Geographic scope:** state-level and national projections

-   **Results:**

    -   We require teams to submit 100 - 300 representative trajectories
    -   Projection quantiles for incident outcomes are optional but encouraged. 
    Similarly projections of cumulative outcomes (either as quantiles or cumulative
    trajectories) are optional.
        -   Weekly incident deaths
        -   Weekly incident hospitalizations
        -   Weekly cumulative deaths since simulation start (No longer
            cumulative since the start of the pandemic due to the lag
            in [FluView](https://gis.cdc.gov/grasp/fluview/mortality.html)
            baseline data)
        -   Weekly cumulative hospitalizations since simulation start
    -   For teams who wish to submit quantiles, the format is in accordance with 
    prior rounds. We ask for the following quantiles: 0.01, 0.025, 0.05, every 5% 
    to 0.95, 0.975, and 0.99. Mean is optional.
    -   Weeks will follow epi-weeks (Sun-Sat) dated by the last day of
    the week
    - Submission file type: **gz.parquet** (from Apache Arrow) is now required. The
    submission file can be partitioned by "origin_date" and "target". For more information,
    please consult the associated [README](./data-processed/README.md) 

-   **Abstract:** We require a brief abstract describing model
assumptions and results, from all teams.

-   **Metadata:** We require a brief metadata form, from all teams.

## Previous Rounds' Scenarios

-   Round 2 Scenarios
-   [Round 3
    Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/Round3_Scenarios.md)
-   [Round 4
    Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round4.md)
-   [Round 5
    Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round5.md)
-   [Round 6
    Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round6.md)
-   [Round 7
    Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round7.md)
-   [Round 8
    Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round8.md)
-   [Round 9
    Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round9.md)
-   [Round 10
    Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round10.md)
-   [Round 11
    Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round11.md)
-   [Round 12
    Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round12.md)
-   [Round 13
    Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round13.md)
-   [Round 14
    Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round14.md)
-   [Round 15
    Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round15.md)
-   [Round 16
    Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round16.md)
-   [Round 17
    Scenarios](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round17.md)

## Submitting model projections

Groups interested in participating can submit model projections for each
scenario in a PARQUET file formatted according to our specifications,
and a metadata file with a description of model information. See
[here](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/README.md)
for technical submission requirements.

## Gold standard data

We will use the daily reports containing COVID-19 cases and deaths data
from the [JHU CSSE group](https://coronavirus.jhu.edu/map.html) as the
gold standard reference data for cases and deaths in the US. We will use
the distribution of the JHU data as provided by the [COVIDcast Epidata
API](https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html)
maintained by the [Delphi Research Group](https://delphi.cmu.edu/about/)
at Carnegie Mellon University.

For COVID-19 hospitalizations, we used the [HealthData.gov COVID-19
Reported Patient Impact and Hospital Capacity by State
Timeseries](https://healthdata.gov/Hospital/COVID-19-Reported-Patient-Impact-and-Hospital-Capa/g62h-syeh).
These data are released weekly although, sometimes, are updated more
frequently. A supplemental data source with daily counts that should be
updated more frequently (typically daily) but does not include the full
time-series is [HealthData.gov COVID-19 Reported Patient Impact and
Hospital Capacity by
State](https://healthdata.gov/dataset/COVID-19-Reported-Patient-Impact-and-Hospital-Capa/6xf2-c3ie).

Starting Round 13 (W12-2022), for COVID-19 hospitalizations, we will use
the same truth data as the COVID-19 Forecast Hub, i.e., the
hospitalization data from the HHS for example the [HealthData.gov
COVID-19 Reported Patient Impact and Hospital Capacity by State
Timeseries](https://healthdata.gov/Hospital/COVID-19-Reported-Patient-Impact-and-Hospital-Capa/g62h-syeh)
and [HealthData.gov COVID-19 Reported Patient Impact and Hospital
Capacity by
State](https://healthdata.gov/dataset/COVID-19-Reported-Patient-Impact-and-Hospital-Capa/6xf2-c3ie).
We will use the distribution of the HHS data as provided by the
[COVIDcast Epidata
API](https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/hhs.html)
maintained by the [Delphi Research Group](https://delphi.cmu.edu/about/)
at Carnegie Mellon University.

## Ensemble model

We aim to combine model projections into an ensemble.

## Data license and reuse

We are grateful to the teams who have generated these scenarios. The
groups have made their public data available under different terms and
licenses. You will find the licenses (when provided) within the
model-specific folders in the [data-processed](./data-processed/)
directory. Please consult these licenses before using these data to
ensure that you follow the terms under which these data were released.

All source code that is specific to the overall project is available
under an open-source [MIT license](https://opensource.org/licenses/MIT).
We note that this license does NOT cover model code from the various
teams or model scenario data (available under specified licenses as
described above).

## Computational power

Those teams interested in accessing additional computational power
should contact Katriona Shea at
[k-shea\@psu.edu](mailto:k-shea@psu.edu){.email}.

## Shared Code Resources

Teams are encouraged to share code they think will be useful to other
teams via the github repo. This directory can be found in
[code_resources](https://github.com/midas-network/covid19-scenario-modeling-hub/tree/master/code_resources).
It currently contains code to: - Pull age-specific, state-specific,
time-series data on vaccination in the US from the CDC API.
[get_cdc_stateagevacc.R](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/code_resources/get_cdc_stateagevacc.R)

## Teams and models

-   [*Johns Hopkins ID Dynamics COVID-19 Working Group --- COVID
    Scenario
    Pipeline*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/JHU_IDD-CovidSP/metadata-JHU_IDD-CovidSP.txt)
    -   Joseph C. Lemaitre (UNC), Joshua Kaminsky (Johns Hopkins
        Infectious Disease Dynamics), Claire P. Smith (Johns Hopkins
        Infectious Disease Dynamics), Sara Loo (Johns Hopkins Infectious
        Disease Dynamics), Clif McKee (Johns Hopkins Infectious Disease
        Dynamics), Alison Hill (Johns Hopkins Infectious Disease
        Dynamics), Sung-mok Jung (UNC), Erica Carcelen (Johns Hopkins
        Infectious Disease Dynamics), Koji Sato (Johns Hopkins
        Infectious Disease Dynamics), Elizabeth C. Lee (Johns Hopkins
        Infectious Disease Dynamics), Justin Lessler (UNC), Shaun
        Truelove (Johns Hopkins Infectious Disease Dynamics)
-   [*Johns Hopkins University Applied Physics Lab ---
    Bucky*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/JHUAPL-Bucky/metadata-JHUAPL-Bucky.txt)
    -   Matt Kinsey (JHU/APL), Kate Tallaksen (JHU/APL), R.F. Obrecht
        (JHU/APL), Laura Asher (JHU/APL), Cash Costello (JHU/APL),
        Michael Kelbaugh (JHU/APL), Shelby Wilson (JHU/APL), Lauren Shin
        (JHU/APL), Molly Gallagher (JHU/APL), Luke Mullany (JHU/APL),
        Kaitlin Lovett (JHU/APL)
-   [*Karlen Working Group ---
    pypm*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/Karlen-pypm/metadata-Karlen-pypm.txt)
    -   Dean Karlen (University of Victoria and TRIUMF)
-   [*Northeastern University MOBS Lab --- GLEAM
    COVID*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/MOBS_NEU-GLEAM_COVID/metadata-MOBS_NEU-GLEAM_COVID.txt)
    -   Matteo Chinazzi (Laboratory for the Modeling of Biological and
        Socio-technical Systems, Northeastern University, Boston, MA),
        Jessica T. Davis (Laboratory for the Modeling of Biological and
        Socio-technical Systems, Northeastern University, Boston, MA),
        Kunpeng Mu (Laboratory for the Modeling of Biological and
        Socio-technical Systems, Northeastern University, Boston, MA),
        Xinyue Xiong (Laboratory for the Modeling of Biological and
        Socio-technical Systems, Northeastern University, Boston, MA),
        Ana Pastore y Piontti (Laboratory for the Modeling of Biological
        and Socio-technical Systems, Northeastern University, Boston,
        MA), Alessandro Vespignani (Laboratory for the Modeling of
        Biological and Socio-technical Systems, Northeastern University,
        Boston, MA)
-   [*University of Southern California --- SI
    kJalpha*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/USC-SIkJalpha/metadata-USC-SIkJalpha.txt)
    -   Ajitesh Srivastava, Majd Al Aawar
-   [*University of Virginia ---
    adaptive*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/UVA-adaptive/metadata-UVA-adaptive.txt)
    -   Przemyslaw Porebski (UVA), Srini Venkatramanan (UVA), Bryan 
        Lewis (UVA), Aniruddha Adiga (UVA), Brian Klahn (UVA), 
        Benjamin Hurt (UVA), Jiangzhuo Chen (UVA), Anil Vullikanti (UVA), 
        Madhav Marathe (UVA)
-   [*Oliver Wyman's Pandemic
    Navigator*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/OliverWyman-Navigator/metadata-OliverWyman-Navigator.txt)
    -   Ugur Koyluoglu, Dan Siegel
-   [*Columbia University - Age-Stratified
    Model*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/CU-AGE-ST/metadata-CU-AGE-ST.txt)
    -   Marta Galanti (CU), Teresa Yamana (CU), Sen Pei (CU), Jeffrey
        Shaman (CU)
-   [*University of North Carolina at Charlotte -
    hierbin*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/UNCC-hierbin/metadata-UNCC-hierbin.txt)
    -   Shi Chen (UNC Charlotte Department of Public Health Sciences &
        School of Data Science), Rajib Paul (UNC Charlotte Department of
        Public Health Sciences and School of Data Science), Daniel
        Janies (UNC Charlotte Department of Bioinformatics and
        Genomics), Jean-Claude Thill (UNC Charlotte Department of
        Geography and Earth Sciences and School of Data Science)
-   [*Institute for Health Metrics and Evaluation -- IHME COVID model
    deaths
    unscaled*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/IHME-IHME_COVID_model_deaths_unscaled/metadata-IHME-IHME_COVID_model_deaths_unscaled.txt)
    -   Robert C Reiner, Joanne Amlag, Ryan M. Barber, James K. Collins,
        Peng Zheng, James Albright, Catherine M. Antony, Aleksandr Y.
        Aravkin, Steven D. Bachmeier, Marlena S. Bannick, Sabina Bloom,
        Austin Carter, Emma Castro, Kate Causey, Suman Chakrabarti,
        Fiona J. Charlson, Rebecca M. Cogen, Emily Combs, Xiaochen Dai,
        William James Dangel, Lucas Earl, Samuel B. Ewald, Maha
        Ezalarab, Alize J. Ferrari, Abraham Flaxman, Joseph Jon Frostad,
        Nancy Fullman, Emmanuela Gakidou, John Gallagher, Scott D.
        Glenn, Erik A. Goosmann, Jiawei He, Nathaniel J. Henry, Erin N.
        Hulland, Benjamin Hurst, Casey Johanns, Parkes J. Kendrick,
        Samantha Leigh Larson, Alice Lazzar-Atwood, Kate E. LeGrand,
        Haley Lescinsky, Emily Linebarger, Rafael Lozano, Rui Ma, Johan
        Månsson, Ana M. Mantilla Herrera, Laurie B. Marczak, Molly K.
        Miller-Petrie, Ali H. Mokdad, Julia Deryn Morgan, Paulami Naik,
        Christopher M. Odell, James K. O'Halloran, Aaron E.
        Osgood-Zimmerman, Samuel M. Ostroff, Maja Pasovic, Louise
        Penberthy, Geoffrey Phipps, David M. Pigott, Ian Pollock,
        Rebecca E. Ramshaw, Sofia Boston Redford, Sam Rolfe, Damian
        Francesco Santomauro, John R. Shackleton, David H. Shaw,
        Brittney S. Sheena, Aleksei Sholokhov, Reed J. D. Sorensen,
        Gianna Sparks, Emma Elizabeth Spurlock, Michelle L. Subart, Ruri
        Syailendrawati, Anna E. Torre, Christopher E. Troeger, Theo Vos,
        Alexandrea Watson, Stefanie Watson, Kirsten E. Wiens, Lauren
        Woyczynski, Liming Xu, Jize Zhang, Simon I. Hay, Stephen S. Lim
        & Christopher J. L. Murray
-   [*University of Virginia -
    EpiHiper*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/UVA-EpiHiper/metadata-UVA-EpiHiper.txt)
    -   Jiangzhuo Chen (UVA), Stefan Hoops (UVA), Parantapa Bhattacharya
        (UVA), Dustin Machi (UVA), Bryan Lewis (UVA), Madhav Marathe
        (UVA)
-   [*University of Notre Dame -
    FRED*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/NotreDame-FRED/metadata-NotreDame-FRED.txt)
    -   Guido Espana, Sean Cavany, Sean Moore, Alex Perkins
-   [*University of Florida -
    ABM*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/UF-ABM/metadata-UF-ABM.txt)
    -   Thomas Hladish (University of Florida), Alexander Pillai
        (University of Florida), Kok Ben Toh (Northwestern University),
        Ira Longini Jr. (University of Florida)
-   [*North Carolina State University -
    COVSIM*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/NCSU-COVSIM/metadata-NCSU-COVSIM.txt)
    -   Erik Rosenstrom (North Carolina State University), Sebastian 
        Rodriguez Cartes (North Carolina State University), Julie Swann
        (North Carolina State University), Julie Ivy (North Carolina
        State University), Maria Mayorga (North Carolina State
        University)
-   [*University of Texas at Austin -
    ImmunoSEIRS*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/UTA-ImmunoSEIRS/metadata-UTA-ImmunoSEIRS.txt)
    -   Kaiming Bi (Lead modeler, University of Texas at Austin), Anass
        Bouchnita (University of Texas at El Paso), Shraddha R Bandekar 
        (University of Texas at Austin), Spencer Fox (University of Georgia),
        Lauren Ancel Meyers (Senior author, University of Texas at
        Austin), and the UT COVID-19 Modeling Consortium

## The COVID-19 Scenario Modeling Hub Coordination Team

-   Justin Lessler, University of North Carolina
-   Katriona Shea, Penn State University
-   Cécile Viboud, NIH Fogarty
-   Shaun Truelove, Johns Hopkins University
-   Claire Smith, Johns Hopkins University
-   Emily Howerton, Penn State University
-   Nick Reich, University of Massachussetts at Amherst
-   Harry Hochheiser, University of Pittsburgh
-   Michael Runge, USGS
-   Lucie Contamin, University of Pittsburgh
-   John Levander, University of Pittsburgh
-   Jessi Espino, University of Pittsburgh
-   Sara Loo, Johns Hopkins University
-   Erica Carcelen, John Hopkins University
-   Sung-mok Jung, University of North Carolina
-   Samantha Bents, NIH Fogarty
-   Katie Yan, Penn State University

### Past members

-   Wilbert Van Panhuis, University of Pittsburgh
-   Jessica Kerr, University of Pittsburgh
-   Luke Mullany, Johns Hopkins University
-   Kaitlin Lovett, John Hopkins University
-   Michelle Qin, Harvard University
-   Tiffany Bogich, Penn State University
-   Rebecca Borchering, Penn State University
