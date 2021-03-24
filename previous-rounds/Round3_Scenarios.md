# Round 3 Scenarios
**COVID-19 Scenario Modeling Hub**


### Common Assumptions
*   **Submission date**: March 9, 2021 
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
    *   Weekly incident reported cases
    *   Weekly cumulative reported cases since start of pandemic (use JHU CSSE for baseline)
    *   Weekly incident hospitalizations
    *   Weekly cumulative hospitalizations since simulation start
    *   **Weeks will follow epi-weeks (Sun-Sat) dated by the last day of the week**
*   **“Ground Truth”**: The same data sources as the forecast hub will be used to represent “true” cases, deaths and hospitalizations. Specifically, JHU CSSE data for cases and deaths and HHS data for hospitalization. 
*   **Metadata:** We will require a brief meta-data form, TBD, from all teams. 
*   **Uncertainty**: aligned with the Forecasting Hub we ask for 0.01, 0.025, 0.05, every 5% to 0.95, 0.975, and 0.99 quantiles
*   **Ensemble Inclusion**: at present time, in order to be included in the ensemble models need to provide a full set of quantiles

## Scenarios

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
    *   Reduction should be implemented based on each team’s best judgment, but should be done in such a way that a 100% reduction (0% of Feb 2021 effectiveness) would approximate an epidemic without NPIs (e.g. no masks, no social distancing) in place but would still including immunity, vaccination, etc. We recognize that there is uncertainty about what transmission would be without NPIs; this uncertainty should be incorporated into the scenario projections.
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
    *   Reduction should be implemented based on each team’s best judgment, but should be done in such a way that a 100% reduction (0% of Feb 2021 effectiveness) would approximate an epidemic without NPIs (e.g. no masks, no social distancing) in place but would still including immunity, vaccination, etc. We recognize that there is uncertainty about what transmission would be without NPIs; this uncertainty should be incorporated into the scenario projections.
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
    *   Reduction should be implemented based on each team’s best judgment, but should be done in such a way that a 100% reduction (0% of Feb 2021 effectiveness) would approximate an epidemic without NPIs (e.g. no masks, no social distancing) in place but would still including immunity, vaccination, etc. We recognize that there is uncertainty about what transmission would be without NPIs; this uncertainty should be incorporated into the scenario projections. 
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


