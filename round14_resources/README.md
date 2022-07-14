#### Round 14 Resources

* `Adult_Coverage_RD14_Sc_C_D.csv` to simulate vaccine coverage in fall-winter 2022-2023. The data in this file provides weekly cumulative coverage by state and adult age groups to apply to scenario C and D. Estimates are based on the reported coverage of the flu vaccine in the 2020-2021 season by month, state and age. We applied the rise in coverage reported during Aug-Oct 2020 to Oct 2022, used a Piecewise Cubic Hermite Interpolating Polynomial to generate weekly coverage estimates, and applied a discounting factor of 0.9 to account for fatigue from repeat COVID vaccination.

* `cdc_vaccination_trend` is an aggregation of all the states data coming from Centers for Disease Control and Prevention. COVID Data Tracker. Atlanta, GA: US Department of Health and Human Services, CDC; download on 2022, June 03 from [Trends in Number of COVID-19 Vaccinations in the US](https://covid.cdc.gov/covid-data-tracker/#vaccination-trends) . In particular, this file has daily state-specific data for booster 2 coverage in 50+.

