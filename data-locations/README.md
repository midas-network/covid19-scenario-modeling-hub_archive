## Location and Census Data

The folder [data-locations/](./.) contains two `csv` files:

- [locations.csv](./locations.csv) containing
  the state and national full name, 2 letter abbreviation and fips code as used 
  in the hub. The file also contains the population size. 
- [locations_2022.csv](./locations_2022.csv) 
  contains the population size per age group, state (and national level), from
  2022. Starting 2024, this data are used for the SMH visualizations.
  The data are coming from the US Census Bureau:
  - Annual Estimates of the Civilian Population by Single Year of Age and Sex 
  for the United States and States: April 1, 2020 to July 1, 
  2022: available 
  [here](https://www.census.gov/data/datasets/time-series/demo/popest/2020s-state-detail.html).
  
  
A python and R script are available to generate the data. 
