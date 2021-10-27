## Round 9 Scenarios    

To assist with upcoming ACIP recommendations on childhood vaccination (ages 5-11), Round 9 of SMH will concentrate on evaluating the impact of childhood vaccination on COVID-19 dynamics. Results are expected to be needed by mid-September 2021.

</br>

### Scenario Differences

![](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/previous-rounds/Round9_table.png)

</br>

**Interpretation:** These scenarios are intended to demonstrate the impact of vaccination among children ages 5 to 11. We additionally include a stress test axis which illustrates the potential impact of the emergence of a new more transmissible variant. 
 
**Model parameters defined in scenarios:** With regards to the childhood vaccination axis, the data childhood vaccination begins and the state-level uptake trajectory is defined in the scenario. State-level uptake should reflect the percentage coverage increases observed in the 12 to 17-year-old age group observed since distribution to this group began on May 13, 2021. Baseline state-level age-specific vaccination data can be found [here](https://data.cdc.gov/Vaccinations/COVID-19-Vaccinations-in-the-United-States-Jurisdi/unsk-b7fc). Teams should specify in their metadata file if they use an alternative source for vaccination uptake. All assumptions about saturation over the course of the projection period should be specified in the metadata. Vaccine uptake among individuals age 12 and over should be the same in all four scenarios. Uptake in these age groups can be extrapolated from past vaccine coverage curves and vaccine hesitancy surveys (Pulse, CovidCast) with the methodology specified in the metadata. With regards to the new variant axis, the date of emergence, starting prevalence, and transmissibility increase compared to the Delta variant is specified by the scenarios.

**Unconstrained model parameters:** The following parameters are left to the disrection of the teams and should be noted in the metadata
*   VE (infection, symptoms, severe outcomes) in all age groups
    *	Suggested values: Data from the [REACT](https://www.medrxiv.org/content/10.1101/2021.07.08.21260185v1.full.pdf) study suggests 60% overall VE against infection with Delta. In a [study](https://www.cdc.gov/mmwr/volumes/70/wr/mm7034e4.htm?s_cid=mm7034e4_w) of US healthcare workers during the period of Delta variant circulation, VE was 66% against infection. [Data from the UK](https://www.nejm.org/doi/full/10.1056/NEJMoa2108891) suggests an overall VE against symptoms of 88% for Delta. VE against hospitalization ranges between 90-96% in [US](https://www.cdc.gov/mmwr/volumes/70/wr/mm7034e1.htm?s_cid=mm7034e1_w) and [UK](https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1012420/Vaccine_surveillance_report_-_week_33.pdf) studies against the Delta variant.
    *	Teams can choose different VE values for different age groups. However, chosen values should be reported in the metadata.
*   Transmissibility for vaccinated and unvaccinated children, and vaccinated adults.
*   Waning immunity (teams can choose to ignore waning immunity)
*   Susceptibility by age
*   NPIs; note that multiple jurisdictions have reinstated indoor masking and a number of schools will require masking in the fall

**Outputs:** In addition to the usual outputs, it would be helpful (but not required) for teams to plan to extract incident and cumulative cases, hospitalizations, and deaths for under 12 years AND 12+ years (ideal). Alternative age-specific projections will also be helpful (e.g., 0-17, 5-17). Please plan to submit quantiles for the complement of the younger age group submitted as it is not possible to extract quantiles for the older age-group by subtracting from quantiles submitted for the total population. This will allow us to provide some information on indirect effects of vaccinating children 5 to 11 years of age. Additionally, please provide population data relevant to the age groups used so appropriate rates can be calculated.

</br>


### Common Specifications

**Vaccination**
*   <ins>Doses available</ins>: 
    *	50M Moderna/Pfizer 1st doses available monthly, June 2021-January 2022
    *   J&J no longer available (after May 2021)
    *	Supply has likely eclipsed demand at this stage. Number of doses are for reference and as a reminder to account for different VE by manufacturer, but no longer indicate number of doses administered. Distribution of doses by manufacturer and associated vaccine efficacy should fit within these dose bounds.
*	<ins>Coverage</ins>:
   * Vaccine hesitancy is expected to cause vaccination coverage to slow and eventually saturate at some level below 100%. The coverage saturation, the speed of that saturation, and heterogeneity between states (or other geospatial scales) and/or age groups are at the discretion of the modeling teams. We suggest that the teams use estimates from the [Delphi group](https://delphi.cmu.edu/covidcast/indicator/?date=20210313&sensor=fb-survey-smoothed_wcovid_vaccinated_appointment_or_accept), adjusted for potential bias in respondents and the [Pulse Survey](https://data.cdc.gov/stories/s/Vaccine-Hesitancy-for-COVID-19/cnd2-a6zw) overall estimates, adjusted for survey participant vaccination coverage.
*	<ins>VE</ins>: 
    *	We recommend that teams use a **VE of 35% for 1st dose and 85% for second dose** against symptoms for Moderna and Pfizer versus the Delta variant. These estimates reflect VE before any waning takes place. 
    *	VE is defined here as vaccine effectiveness against symptomatic disease. Teams should make their own informed assumptions about effectiveness and impacts on other outcomes (e.g., infection, hospitalization, death).


**Variant progression and transmissibility:** Teams should use their own judgment to project the continued progress and transmissibility of the Delta variant across US states. Initial prevalence should be estimated or defined by the teams based on sequencing and other relevant data, preferably at the state level. Teams can set an increased severity of the Delta variant, but this should be documented in metadata.

</br>

**NPI:** In contrast to past scenarios, we don’t specify different levels of non-pharmaceutical interventions (NPI) use; **however, teams should consider that most schools intend to return to in-person education in the fall**. Teams should also note the change in [CDC mask recommendations](https://www.cdc.gov/coronavirus/2019-ncov/vaccines/fully-vaccinated.html) for vaccinated people in high-transmission areas on 07/27/2021.The future level of NPIs are left at the discretion of the modeling teams and should be specified in the teams’ metadata.

</br>


### Submission Information

| Scenario                                                               | Scenario name for submission file | Scenario ID for submission file |
| ---------------------------------------------------------------------- |:---------------------------------:|:-------------------------------:|
| Scenario A. Childhood Vaccination, No Variant                          | ChildVax_noVar                    | A-2021-09-14                    |
| Scenario B. No Childhood Vaccination, No Variant                       | noChildVax_noVar                  | B-2021-09-14                    |
| Scenario C. Childhood Vaccination, New Variant                         | ChildVax_Var                      | C-2021-09-14                    |
| Scenario D. No Childhood Vaccination, New Variant                      | noChildVax_Var                    | D-2021-09-14                    | 


*   **Due date**: September 14, 2021 
*   **End date for fitting data**: September 4 - September 11, 2021 (cut-off date at the discretion of individual teams; we’d prefer data through September 4 at least be used; no fitting should be done to data after September 11)
*   **Start date for scenarios**: September 12, 2021  (first date of simulated transmission/outcomes)
*   **Simulation end date**: March 12, 2022  (26-week horizon)

</br>



### Scenario and Simulation Details

*	**Social Distancing Measures:**
    *	Includes combined effectiveness/impact of all non-pharmaceutical interventions and behavior change.
    *   Current and future levels of social distancing are to be defined by the teams based on their understanding of current and planned control and behavior and expectations. Teams should consider that most jurisdictions are opening fairly quickly, and most schools intend to return to in-person education in the fall. No reactive interventions should be planned.
*	**Testing-Trace-Isolate:** constant at baseline levels
*	**Masking:** Included as part of “Social Distancing Measures” above.
*   **Immune waning and Immune escape:** As defined by the scenarios.
*	**Vaccination:**
    *	**Pfizer / Moderna**
        *	**Vaccine efficacy (2-dose vaccines):**
            *   B.1.1.7
                *	<ins>First dose: **50% against symptoms**</ins>, 14 days after 1st dose
                *	<ins>Second dose: **90% against symptoms**</ins>, 14 days after 2nd dose
            *   B.1.617.2
                *	<ins>First dose: **35% against symptoms**</ins>, 14 days after 1st dose
                *	<ins>Second dose: **85% against symptoms**</ins>, 14 days after 2nd dose
            *	Effectiveness and impact on infection and other outcomes (hospitalizations, deaths) is at team’s discretion and should be clearly documented in team’s metadata.
            *	Doses 3.5 weeks apart
        *	**Vaccine availability:**
            *	December-August 13: based on data on administered doses
            *	August 14-February 2022: 50 million available first doses/month, with the intention of protocols being followed (100M doses/mo)
    *	**Johnson & Johnson**
        *	**Vaccine efficacy (1-dose):**
            *   70% VE against previous strains; 60% VE against B.1.1.7/B.1.617.2
        *	**Vaccine availability:**
            *	March-May: based on data on administered doses, with continuing at rate current on date of projection for remainder of month (~10M total administered).
            *	June-January: No longer available; only 10M of 20M doses administered, supply, safety, and demand issues.
            *   Manner for accounting for protection provided in the 10M vaccinated during March-May at team's discretion.
*	**Vaccine Hesitancy:** At teams' discretion. 
*	**Delta (B.1.617.2) variant strain:** At teams’ discretion.
Transmission assumptions: models fit to US state-specific dynamic up until "End date for fitting data" specified above – no prescribed R0, interventions, etc.
*   **Transmission assumptions**: models fit to US state-specific dynamic up until "End date for fitting data" specified above – no proscribed R<sub>0</sub>, interventions, etc.
*   **Pathogenicity assumptions**: no exogenous fluctuations in pathogenicity/transmissibility beyond seasonality effects unless specified by the scenarios
*   **Vaccine effectiveness**: see recommendations (same VE in all scenarios); assumptions regarding time required to develop immunity, age-related variation in effectiveness, duration of immunity, and additional effects of the vaccine on transmission are left to the discretion of each team
*   **Vaccine allocation**: between-state allocation is based on population per the CDC/NAS [guidelines](https://www.nap.edu/catalog/25917/framework-for-equitable-allocation-of-covid-19-vaccine#resources) (proportional allocation); within-state allocation and the impact of vaccine hesitancy are left to the discretion of each team
*   **Vaccine immunity delay:** There is approximately a 14 day delay according to the Pfizer data; because we suspect the post first dose and post second dose delays may be of similar length, we do not believe there is any need to explicitly model a delay, instead groups can delay vaccine receipt by 14 days to account for it
*   **Vaccine uptake:** See specific details.
*   **Vaccine roll-out**: roll-out to follow [ACIP recommendations](https://www.cdc.gov/vaccines/acip/meetings/downloads/slides-2020-12/slides-12-20/02-COVID-Dooling.pdf) unless known to be contradicted by state recommendations
    *   Phase 1a: health care workers, long-term care facilities
    *   Phase 1b: frontline essential workers, adults 75+
    *   Phase 1c: other essential workers, adults with high-risk conditions, adults 65-74
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
*   **Uncertainty**: aligned with the Forecasting Hub we ask for 0.01, 0.025, 0.05, every 5% to 0.95, 0.975, and 0.99 quantiles
*   **Ensemble Inclusion**: at present time, in order to be included in the ensemble models need to provide a full set of quantiles

</br>

