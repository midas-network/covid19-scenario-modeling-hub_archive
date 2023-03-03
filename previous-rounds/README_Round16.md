# COVID-19 Scenario Modeling Hub

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6584489.svg)](https://doi.org/10.5281/zenodo.6584489)

Last updated: 10-20-2022 for **Round 16 Scenarios**.

## Previous Round Scenarios and Results:

<https://covid19scenariomodelinghub.org/viz.html>

Round 15: [Scenario
Descriptions](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/README_Round15.md)
and [Model
Details](https://github.com/midas-network/covid19-scenario-modeling-hub#teams-and-models)

</br>

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

</br>

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

</br>

## Round 16 Scenarios

Round 16 focuses on the impact of bivalent booster uptake (first
dimension) with the epidemiology of the variant "swarms" projected to
dominate in the coming months (2nd dimension) over a 26-week period. We
follow the usual 2X2 table structure.

<img src="https://raw.githubusercontent.com/midas-network/covid19-scenario-modeling-hub/master/previous-rounds/Round16_scenarios_table.PNG"/>

</br>

The VE of reformulated (i.e., bivalent) boosters currently administered
to those five and older should be considered to have an effectiveness of
**80% against symptomatic disease** to BA.5.2 and all other Omicron
variants not modeled in the immune escape swarms scenarios. For variants
included in levels 5, 6 and 7, VE should be reduced based on the
estimated immune escape factor compared to BA.5.2. If updated data on VE
becomes available prior to submission, teams are free to use this data,
but it should be noted in the abstract. Variant swarms in levels 5 to 7
partially escape immunity against infection, where immunity is conferred
by all available vaccines and prior infection with Omicron BA1 through
BA5 and pre-Omicron lineages.

Variants by level of escape (from presentation by Cornelius Roemer,
based on RBD mutations from BA.2):

-   Level 0: Stock BA.2
-   Level 1: BA.2.12.1, and others with S:L452R/Q/M
-   Level 2: BA.2.74, BH.1
-   Level 3: Stock BA.⅘, BA.2.75, BA.2.77
-   Level 4: BA.4.6, BF.7, BA.5.9, BA.2.75.5, BL.1, BL.2
-   Level 5: BQ.1, BU.1, BS.1, BW.1, BA.2.75.2, BM.1.1, BA.2.3.20, BJ.1
-   Level 6: BQ.1.1, BN.1, BM.1.1.1
-   Level 7: XBB (BJ.1 x BM.1.1.1), CJ.1 (BM.1.1.1 with S:486P)
-   Level 8: None designated yet </br>

### **Waning Immunity:**

1.  Waning of immunity against infection </br>

    Models should include waning against infection. The median waning
    time of protection against infection should range between **3-8**
    months. Teams can sample this range, or use any value within this
    range as a point estimate. Teams can consider differences in waning
    of natural and vaccine-induced immunity, or in waning after Omicron
    infection vs waning from other types of SARS-CoV-2 exposures;
    however the median waning time should remain within the **3-8**
    month range. </br>

    We recommend that in the waned classes, teams consider a reduction
    from baseline levels of protection ranging between 40 and 60%,
    corresponding to x0.60 and x0.40 of the baseline levels reported
    immediately after exposure (vaccination or infection). This follows
    the same scheme as in round 13-15. Teams can sample the recommended
    range of protection reductions, which is 40-60%, or use any value
    within this range as a point estimate. </br>

    These guidelines should not preclude teams from considering longer
    waning times, especially if they would like to integrate detailed
    waning data. A recent study suggests that vaccine-induced immunity
    [wanes](https://www.thelancet.com/journals/lancet/article/PIIS0140-6736(22)00089-7/fulltext)
    on long time scales and has not stabilized at 9 months. Accordingly,
    teams can choose to model longer time scales of waning, with a lower
    set point than prescribed above. If they do so, teams should ensure
    that in their formulation, 50% of their population have a 40-60%
    reduced protection 3-8 months after (re-)exposure, aligned with the
    above guidelines. </br>

2.  Waning of immunity against severe disease </br>

    The extent and speed of the waning of protection against severity,
    conditional on infection, are at the discretion of the teams. Our
    assumptions are that protection against severity, conditional on
    infection, wanes on a slower time scale than waning against
    infection, but may wane eventually. Assumptions regarding waning of
    protection against severity, conditional on infection, should be
    provided in the abstract. For reference, several publications have
    estimates:
    [NEJM](https://www.nejm.org/doi/full/10.1056/NEJMoa2115481),
    [MMWR](https://www.cdc.gov/mmwr/volumes/71/wr/mm7107e2.htm?s_cid=mm7107e2_w).
    </br>

### **Variants:**

We model the emergence of new variants with different immune escape
characteristics by level of escape (based on RBD mutations compared to
BA.2). With little data on new emerging variants, a specific variant is
not explicitly considered in the scenarios. Instead, new variants are
grouped into levels based on their immune escape characteristics.
Therefore, each group of variants with a particular level of immune
escape can be modeled as a single variant with the specified immune
escape characteristics. Levels 5, 6 and 7 variants are taken into
account in Round 16, and the detailed characteristics of variants by
level are defined in the scenarios as follows:

*Current variants classified into levels 5 , 6, and 7:*

-   Level 5: BQ.1, BU.1, BS.1, BW.1, BA.2.75.2, BM.1.1, BA.2.3.20, BJ.1
-   Level 6: BQ.1.1, BN.1, BM.1.1.1
-   Level 7: XBB (BJ.1 x BM.1.1.1), CJ.1 (BM.1.1.1 with S:486P)

*Immune escape characteristics:*

-   Scenarios A & C: **25%** immune escape from BA.5.2 **applies to
    variants in level 5**
-   Scenarios B & D: **50%** immune escape from BA.5.2 **applies to
    variants in levels 6 and 7** </br>

For example, in scenarios A and C, individuals who are previously
immunized via either infection with BA.5.2 or vaccination with the
reformulated vaccines will have a 25% reduction in the assumed level of
protection conferred by that infection/vaccination against infection
with Level 5 variants. For individuals who were most recently immunized
by a less recent variant (i.e., BA.1) or vaccine (booster 1), protection
against infection with Level 5 variants will be reduced by 25% on top of
additional immune escape from that variant or vaccine by BA.5.2. </br>

The relationship between immune escape against infection and against
symptomatic disease is at the discretion of the teams. </br>

Emerging variants not specified in the scenarios should be treated as
not having an epidemiologically significant impact. For example, in
scenarios A and C (the level 5 variant scenarios) level 6 and 7 variants
should be treated the same as level 0-4 variants. In addition, level 0-4
variants should be considered as low or no immune escape compared to
BA.5. </br>

*Severe disease with new variants, given infection:* The risks of severe
disease for both Level 5 & 6/7 variants, conditional on infection and an
individual's immune class, are identical with Omicron (including
BA.5.x). This is also true for other currently circulating variants.
Accordingly, the risk **for hospitalization and death, conditional on
infection, is equivalent to Omicron.** </br>

*Transmissibility:* The **intrinsic transmissibility of the new variant
should be the same as that of the strains circulating at the start of
the projection period** (i.e. the same R0 as Omicron variants and
sub-variants = same effective transmissibility in a fully naive
population, with the R0 value of Omicron left at teams' discretion).
</br>

*Initial variant prevalence:* The initial prevalence of the Level 5 &
6/7 variants should be based on observed combined prevalence of all
variants included in the given level at the start of the projection
period in the US. Teams are free to use available
[data](https://cov-spectrum.org/explore/United%20States/AllSamples/Past6M)
to inform the prevalence of new variants. Teams are free to model
importations as they see fit based on their analysis of the local and
global epidemiological situation. Geographic dispersion of these
infections is left at teams' discretion. The ramp up of the new variant
due to local transmission is also left at the teams' discretion. </br>

### **VE of existing and reformulated vaccines:**

In June 2022, FDA recommended that vaccines be reformulated and include
two components, an original Wuhan-like strain and an Omicron BA.4/BA.5
strain. Reformulated bivalent BA4/5 boosters are currently being
administered, and are available to people five years and older. We
assume that reformulated bivalent boosters will provide a moderately
improved protection above existing boosters; yet the exact VE will
depend on circulating strains this fall. Teams should set the VE of
reformulated vaccines at 80% against symptomatic disease from BA.5 and
all variants not captured in the immune escape scenarios. For immune
escape variants, a reduction of VE against (infection and) symptomatic
disease should be implemented based on the denoted extent of immune
escape. </br> Relevant references for VE of non reformulated vaccines
include:

-   Effect of 4th dose/2nd booster on infection and severe disease in
    Isreal <https://www.nejm.org/doi/full/10.1056/NEJMoa2201570>
-   UK data on VE against symptomatic disease, hospitalization and
    deaths, by dose, time since vaccination and sublineage of Omicron
    (including BA.4/BA.5)
    <https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1109618/vaccine-surveillance-report-week-40.pdf>
-   US data on waning of VE against ED and hospitalization with Delta
    and Omicron, after 2nd and 3rd doses
    <https://www.cdc.gov/mmwr/volumes/71/wr/mm7107e2.htm>
-   South Africa data on waning of VE against hospitalization with
    Omicron (BA.1-BA.2/BA.4-BA.5), after 2nd and 3rd doses
    <https://www.nejm.org/doi/full/10.1056/NEJMc2210093>
-   Portugal data on VE against hospitalization and death with BA.5,
    after 2nd and 3rd doses
    <https://www.eurosurveillance.org/content/10.2807/1560-7917.ES.2022.27.37.2200697>
-   Neutralizing antibody response of a reformulated vaccine
    (original/BA.1 strain) against Omicron
    <https://www.nejm.org/doi/full/10.1056/NEJMoa2208343>
-   [Long term vaccine
    strategy](https://jamanetwork.com/journals/jama/fullarticle/2792030?resultClick=1)
    for COVID </br>

### **Vaccine coverage data and dose spacing:**

The bivalent booster is
[authorized](https://www.fda.gov/news-events/press-announcements/coronavirus-covid-19-update-fda-authorizes-moderna-and-pfizer-biontech-bivalent-covid-19-vaccines)
for use in individuals ages 5+. The rate of booster uptake and final
coverage levels are defined in the scenarios as follows.

*Accelerating uptake (scenarios A & B):* Booster uptake rates accelerate
in the coming months and saturate by February 1st, 2023 at 90% of the
state-specific flu coverage reported for the 2020-2021 fall-winter
season among ages 5+ (provided
[here](https://github.com/midas-network/flu-scenario-modeling-hub_resources/blob/main/Rd1_datasets/Age_Specific_Coverage_Flu_RD1_2022_23_Sc_A_B_C_D.csv)).
Teams are free to use available data and information from previous
rollouts as they see fit to define rates.

*Current uptake (scenarios C & D):* Booster uptake rates stay at rates
implied by current data and saturate by the end of the projection period
at the level of the uptake of the booster 1 coverage. The plateau date
should be based on current rates and is flexible as long as it occurs
before the end of the projection period. Teams can adjust rates up if
needed to achieve adequate coverage (based on booster 1) by target date.
Teams are free to use available data and information from current and
previous rollouts as they see fit to define rates.

The distribution of who gets a booster among those for whom it is the
1st, 2nd or 3rd booster, age differences in coverage, and heterogeneity
in coverage between states, is at the teams' discretion.

*Dose spacing:* Accounting for dose spacing is not required. </br>

### **Seasonality:**

Teams should include their best estimate of COVID-19 seasonality in
their model but we do not prescribe a specific level of seasonal
forcing.

### **NPI:**

Round 16 should NOT include reactive changes in NPIs imposed by health
authorities to curb transmission, e.g., reinstatement of mask mandates,
or closure of schools and businesses. However, teams can incorporate
inherent changes in population behavior in response to increasing or
decreasing incidences (eg, changes in contacts or masking), if these
changes were inferred from earlier phases of the pandemic and are
already part of the model.

Database tracking of NPIs: teams may use their own data if desired,
otherwise we recommend the following sources as a common starting point:

-   [Coronavirus Government Response Tracker \| Blavatnik School of
    Government
    (ox.ac.uk)](https://www.bsg.ox.ac.uk/research/research-projects/coronavirus-government-response-tracker)
-   [Coronavirus State Actions - National Governors Association
    (nga.org)](https://www.nga.org/coronavirus-state-actions-all/) </br>

### **Initial Conditions:**

The mix of circulating strains at the start of the projection period
(October 30, 2022) is at the discretion of the teams based on their
interpretation/analysis of the available data and estimates of the level
5 and 6/7 variants at the the time of projection. Variation in initial
prevalence between states is left at teams' discretion. </br>

### **Targets and case ascertainment:**

Ascertainment of cases, hospitalizations and deaths will proceed at the
same level as they were at the start of the projection period. We will
continue to collect the same targets (cases, hospitalizations, deaths)
but note that VRBPAC and ACIP are talking about a focus on severe
disease moving forward.

**All of the teams' specific assumptions should be documented in
meta-data and abstract.**

**Projection time horizon:** We consider a **26-week projection
period.**

</br>

## Submission Information

| Scenario                                                  | Scenario name for submission file ('scenario_name') | Scenario ID for submission file ('scenario_id') |
|---------------------------------|:-----------------:|:-----------------:|
| Scenario A. High boosters, Moderate immune escape variant |                   highBoo_modVar                    |                  A-2022-10-29                   |
| Scenario B. High boosters, High immune escape variant     |                   highBoo_highVar                   |                  B-2022-10-29                   |
| Scenario C. Low boosters, Moderate immune escape variant  |                    lowBoo_modVar                    |                  C-2022-10-29                   |
| Scenario D. Low boosters, High immune escape variant      |                   lowBoo_highVar                    |                  D-2022-10-29                   |

-   **Due date**: Nov 2, 2022
-   **End date for fitting data**: October 29, 2022 (no later than
    October 29, no earlier than October 22)
-   **Start date for scenarios**: October 30, 2022 (first date of
    simulated transmission/outcomes)
-   **Simulation end date:** April 29, 2023 (26-week horizon)
-   Desire to release results by first or second week of November

**Other submission requirements**

-   **Geographic scope:** state-level and national projections
-   **Results:** some subset of the following
    -   Weekly incident deaths
    -   Weekly cumulative deaths since start of pandemic (use JHU CSSE
        for baseline)
    -   Weekly incident reported cases
    -   Weekly cumulative reported cases since start of pandemic (use
        JHU CSSE for baseline)
    -   Weekly incident hospitalizations
    -   Weekly cumulative hospitalizations since simulation start
    -   Individual simulations nationally and by state (weekly incident
        cases, hospitalizations, and deaths; no cumulative estimates
        needed; 100 randomly selected simulations per location)
    -   Weeks will follow epi-weeks (Sun-Sat) dated by the last day of
        the week
-   **Abstract:** We will require a brief abstract describing model
    assumptions and results, from all teams.
-   **Metadata:** We will require a brief meta-data form, from all
    teams.
-   **Uncertainty:** aligned with the Forecasting Hub we ask for 0.01,
    0.025, 0.05, every 5% to 0.95, 0.975, and 0.99. At present time,
    *inclusion in ensemble models requires a full set of quantiles from
    0.01 to 0.99.*

</br>

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

</br>

## Submitting model projections

Groups interested in participating can submit model projections for each
scenario in a CSV file formatted according to our specifications, and a
metadata file with a description of model information. See
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
        Dynamics), Alison Hill (Johns Hopkins Infectious Disease Dynamics), 
        Sung-mok Jung (UNC), Erica Carcelen (Johns Hopkins Infectious 
        Disease Dynamics), Koji Sato (Johns Hopkins Infectious Disease 
        Dynamics), Elizabeth C. Lee (Johns Hopkins Infectious Disease 
        Dynamics), Justin Lessler (UNC), Shaun Truelove (Johns Hopkins 
        Infectious Disease Dynamics)
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
    -   Przemyslaw Porebski (UVA), Joseph Outten (UVA), Srini
        Venkatramanan (UVA), Bryan Lewis (UVA), Aniruddha Adiga (UVA),
        Brian Klahn (UVA), Lijing Wang (UVA), Benjamin Hurt (UVA),
        Jiangzhuo Chen (UVA), Anil Vullikanti (UVA), Madhav Marathe
        (UVA)
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
    -   Erik Rosenstrom (North Carolina State University), Julie Swann
        (North Carolina State University), Julie Ivy (North Carolina
        State University), Maria Mayorga (North Carolina State
        University)
-   [*University of Texas at Austin -
    ImmunoSEIRS*](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/UTA-ImmunoSEIRS/metadata-UTA-ImmunoSEIRS.txt)
    -   Kaiming Bi (Lead modeler, University of Texas at Austin), Anass
        Bouchnita (University of Texas at El Paso), Spencer Fox
        (University of Georgia), Michael Lachmann (Santa Fe Institute),
        Lauren Ancel Meyers (Senior author, University of Texas at
        Austin), and the UT COVID-19 Modeling Consortium

</br>

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

### Past member

-   Wilbert Van Panhuis, University of Pittsburgh
-   Jessica Kerr, University of Pittsburgh
-   Luke Mullany, Johns Hopkins University
-   Kaitlin Lovett, John Hopkins University
-   Michelle Qin, Harvard University
-   Tiffany Bogich, Penn State University
-   Rebecca Borchering, Penn State University
