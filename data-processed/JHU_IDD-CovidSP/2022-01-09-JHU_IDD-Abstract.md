# Summary of results
As part of the twelfth round of scenario projections from the COVID-19 Scenario Modeling Hub in the United States, the Johns Hopkins Infectious Disease Dynamics (JHU-IDD) team produced three-month projections according to a set of four scenarios definitions. Under these four scenarios, designed to capture the uncertainty in both the transmissibility/immune escape tradeoff and severity of the newly emerged Omicron variant, the JHU-IDD team estimates that we are at or near the peak of the Omicron wave for the US overall, and near or past the peak in nearly every state in the US. We see substantial variation in timing between states, with coastal states rising and peaking earlier. These waves of cases translate to hospitalizations that exceed previous levels in many states, though less pronounced increases of deaths.

# Explanation of observed dynamics given model assumptions
A key drivers of changes from R11 results to R12 results were updated Omicron prevalence data, which shifted most states back in time slightly, though moved some earlier. Additionally, in Round 12, the reporting rate of cases and transmissibility of Omicron were fit to reported data. This lead to a reduction in the number and speed of infections occurring, as compared to R11, and thus lower numbers of cases, hospitalizations, and deaths as a result.

# Model assumptions
## Initial distribution of susceptibility
The JHU-IDD model refits the entire pandemic in every state across the US for each round of scenarios, fitting to overall deaths and variant-specific case data, estimated by multiplying the state-specific proportion of circulating wild-type, Alpha, and Delta variant by the reported number of cases by state. Through this we produce a history of infections over time. Vaccination is incorporated into the model using state-specific, reported vaccination rate by age group. Vaccination is assumed to saturation at either a level estimated by surveys from the US Census Bureau, adjusted for sampling bias, or at asymptotic fits to current data curves, whichever is lower. Booster uptake was assumed to saturate at 70% of the saturation coverage limits of dose 2 for each age group. 

## Transmissibility
Intrinsic transmissibility is defined though a global R0, specific to each major variant, including wild type (R0=2.3), Alpha (R0=3.45), and Delta (5.52). For Omicron, transmissibility is fit to case and death data, with initial values assumed to be R0=4.97 and 8.00 for the high and low immune escape scenarios. Transmissibility gets adjusted up or down by state depending on the fitted local variance parameter. Seasonal terms for each month in each state are also fit and shared across years. Non-pharmaceutical interventions and behavior (NPIs) impact is also estimated within the model as changes in transmissibility during periods of time defined by changes in official or otherwise specific changes in control and behavior (including school year start and holiday periods). NPIs were assumed to be at the same level of effectiveness following New Years as they were estimated to be prior to the Thanksgiving holiday. 

## Generation time
Generation time was assumed the same as previous variants (~5 days).

## Waning immunity assumptions
Immunity from both vaccination and infection is assumed to wane by six months on average, waning to VEs of 0.55, 0.60, 0.87, and 0.90 against infection, symptoms, hospitalization, and death for non-Omicron variants. Reductions in immunity assumed by scenarios regarding immune escape for Omicron are applied on top of VE and waning. No immunity waning to Omicron-acquired immunity was assumed.

## Other updates in model assumptions from previous rounds (e.g., changes in reporting outcomes due to Omicron)
We implemented reporting rate shifts during the Omicron wave, which is estimated by the model as a relative change compared to the prior period, by state.
