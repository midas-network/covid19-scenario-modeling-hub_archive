# Data submission instructions

This page is intended to provide teams with all the information they need to
submit scenarios.  

All scenarios should be submitted directly to the [data-processed/](./) folder.
Data in this directory should be added to the repository through a pull request. 

Automatic validation is running starting round 13.

Due to file size limitation, the file can be submitted in a `.zip` or `.gz` format with the same name as the `.csv` file provided. 

## Example

See [this file](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/MyTeam-MyModel/2020-12-21-MyTeam-MyModel.csv) for an illustration of part of a (hypothetical) submission file. 

## Subdirectory

Each subdirectory within the [data-processed/](data-processed/) directory has 
the format

    team-model
    
where 

- `team` is the teamname and 
- `model` is the name of your model. 

Both team and model should be less than 15 characters, and not include hyphens nor spaces.

Within each subdirectory, there should be a metadata file, a license file
(optional), and a set of scenarios. 

## Metadata 

The metadata file name should have the following format

    metadata-team-model.txt
    
where 

- `team` is the teamname and 
- `model` is the name of your model. 
    
Here are details about [the structure of the metadata file](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/METADATA.md). An example hypothetical metadata file has been posted in the data-processed directory. 

## License (optional)

License information for data sharing and reuse is requested in the metadata, including a link to the license text. If you cannot link to the text of a standard license and have specific license text, include a license file named

    LICENSE.txt

## Model Results

Each model results file within the subdirectory should have the following name

    YYYY-MM-DD-team-model.csv
    
where

- `YYYY` is the 4 digit year, 
- `MM` is the 2 digit month,
- `DD` is the 2 digit day,
- `team` is the teamname, and
- `model` is the name of your model. 

The date YYYY-MM-DD is the [`model_projection_date`](#model_projection_date).

The `team` and `model` in this file must match the `team` and `model` in the
directory this file is in. 
Both `team` and `model` should be less than 15 characters, 
alpha-numeric and underscores only, with no spaces or hyphens.


## Model results file format

The file must be a comma-separated value (csv) file with the following 
columns (in any order):

- `model_projection_date`
- `scenario_name` 
- `scenario_id`
- `target`
- `target_end_date`
- `location`
- `type`
- `quantile`
- `value`


No additional columns are allowed.

Each row in the file is either a point or quantile scenario for a location on a 
particular date for a particular target. 

If the size of the file is larger than 100MB, it can be submitted in a `.zip` or `.gz` format. 

### `model_projection_date`

Values in the `model_projection_date` column must be a date in the format

    YYYY-MM-DD
    
Model projections will have an associated `model_projection_date` that corresponds to the day the projection was made.    

For week-ahead model projections with `model_projection_date` of Sunday or Monday of EW12, a 1 week ahead projection corresponds to EW12 and should have `target_end_date` of the Saturday of EW12. For week-ahead projections with `model_projection_date` of Tuesday through Saturday of EW12, a 1 week ahead projection corresponds to EW13 and should have `target_end_date` of the Saturday of EW13. A week-ahead projection should represent the total number of incident deaths or hospitalizations within a given epiweek (from Sunday through Saturday, inclusive) or the cumulative number of deaths reported on the Saturday of a given epiweek. Model projection dates in the COVID-19 Scenario Modeling Hub are equivelent to the forecast dates in the [COVID-19 Forecast Hub](https://covid19forecasthub.org/). 

### `scenario_name`

The standard scenario names should be used as given in the scenario description in the [main Readme](https://github.com/midas-network/covid19-scenario-modeling-hub). Scenario names only include characters and no spaces, e.g., `optimistic`.


### `scenario_id`

The standard scenario id should be used as given in in the scenario description in the [main Readme](https://github.com/midas-network/covid19-scenario-modeling-hub). Scenario id's include a captitalized letter and date as YYYY-MM-DD on which the scenario was last modified by the project coordinators, e.g., `A-2020-12-22`.


### `target`

We are requesting model projections for a minimum of 13 and maximum of 26 weeks into the future.

The requested targets are:
- weekly incident deaths
- cumulative deaths
- weekly incident cases
- cumulative incident cases
- weekly incident hospitalizations
- cumulative incident hospitalizations

Optional target:
- weekly incident infections

Values in the `target` column must be a character (string) and be one of the 
following specific targets:

- "N wk ahead inc death"  where N is a number between 1 and  26 (or 12 or 52, depending on the round)
- "N wk ahead cum death"  where N is a number between 1 and  26 (or 12 or 52, depending on the round)
- "N wk ahead inc case"  where N is a number between 1 and  26 (or 12 or 52, depending on the round)
- "N wk ahead cum case"  where N is a number between 1 and  26 (or 12 or 52, depending on the round)
- "N wk ahead inc hosp"  where N is a number between 1 and 26 (or 12 or 52, depending on the round)
- "N wk ahead cum hosp"  where N is a number between 1 and 26 (or 12 or 52, depending on the round)
- "N wk ahead inc inf"  where N is a number between 1 and 26 (or 12 or 52, depending on the round)

For week-ahead scenarios, we will use the specification of epidemiological weeks (EWs) [defined by the US CDC](https://wwwn.cdc.gov/nndss/document/MMWR_Week_overview.pdf) which run Sunday through Saturday.

There are standard software packages to convert from dates to epidemic weeks and vice versa. E.g. [MMWRweek](https://cran.r-project.org/web/packages/MMWRweek/) for R and [pymmwr](https://pypi.org/project/pymmwr/) and [epiweeks](https://pypi.org/project/epiweeks/) for python.

For week-ahead scenarios with `model_projection_date` of Sunday or Monday of EW12, 
a 1 week ahead scenario corresponds to EW12 and should have `target_end_date` of 
the Saturday of EW12. For week-ahead scenarios with `model_projection_date` of Tuesday 
through Saturday of EW12, a 1 week ahead scenario corresponds to EW13 and should 
have `target_end_date` of the Saturday of EW13. 

#### N wk ahead inc death

This target is the incident (weekly) number of deaths predicted by the model 
during the week that is N weeks after `model_projection_date`. 

A week-ahead scenario should represent the total number of new deaths 
reported during a given epiweek (from Sunday through Saturday, inclusive).

Predictions for this target will be evaluated compared to the number of new 
reported cases, as recorded by the JHU CSSE group as distributed by the [COVIDcast Epidata API](https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html). 

#### N wk ahead cum death

This target is the cumulative number of deaths predicted by the model up to 
and including N weeks after `model_projection_date`. 

A week-ahead scenario should represent the cumulative number of deaths reported 
on the Saturday of a given epiweek.

Predictions for this target will be evaluated compared to the cumulative of the
number of new reported deaths, as recorded by the JHU CSSE group as distributed by the [COVIDcast Epidata API](https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html). 


#### N wk ahead inc case

This target is the incident (weekly) number of cases predicted by the model 
during the week that is N weeks after `model_projection_date`. 

A week-ahead scenario should represent the total number of new cases 
reported during a given epiweek (from Sunday through Saturday, inclusive).

Predictions for this target will be evaluated compared to the number of new 
reported cases, as recorded by the JHU CSSE group as distributed by the [COVIDcast Epidata API](https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html). 

#### N wk ahead cum case

This target is the cumulative number of incident cases predicted by the model 
up to and including N weeks after `model_projection_date`. 

A week-ahead scenario should represent the cumulative number of cases 
reported on the Saturday of a given epiweek.

Predictions for this target will be evaluated compared to the cumulative of the number of new 
reported cases, as recorded by the JHU CSSE group as distributed by the [COVIDcast Epidata API](https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/jhu-csse.html). 

#### N wk ahead inc hosp

This target is the incident (weekly) number of hospitalized cases predicted by the model 
during the week that is N weeks after `model_projection_date`. 

A week-ahead scenario should represent the total number of new hospitalized cases 
reported during a given epiweek (from Sunday through Saturday, inclusive).

Predictions for this target will be evaluated compared to the number of new 
hospitalized cases, as reported by the HHS and distributed by the [COVIDcast Epidata API](https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/hhs.html). 


#### N wk ahead cum hosp

This target is the cumulative number of incident (weekly) number of hospitalized cases predicted by the model 
during the week that is N weeks after `model_projection_date`. 

A week-ahead scenario should represent the cumulative number of hospitalized cases 
reported on the Saturday of a given epiweek.

Predictions for this target will be evaluated compared to the cumulative of the number of new 
hospitalized cases, as reported by the HHS and distributed by the [COVIDcast Epidata API](https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/hhs.html). 


### `target_end_date`

Values in the `target_end_date` column must be a date in the format

    YYYY-MM-DD
    
This is the date for the scenario `target`. 
For "# day" targets, `target_end_date` will be # days after `forecast_date`.
For "# wk" targets, `target_end_date` will be the Saturday at the end of the 
week time period.


### `location`

Values in the `location` column must be one of the "locations" in this
[FIPS numeric code file](../data-locations/locations.csv) which includes 
numeric FIPS codes for U.S. states, counties, territories, and districts as
well as "US" for national scenarios. 

Please note that when writing FIPS codes, they should be written in as a
character string to preserve any leading zeroes.


### `type`

Values in the `type` column are either

- "point" or
- "quantile". 

This value indicates whether that row corresponds to a point scenario or a 
quantile scenario. 
Point scenarios are used in visualization while quantile scenarios are used in
visualization and in ensemble construction.

**Scenarios must include exactly 1 "point" scenario for every location-target
pair.**


### `quantile`

Values in the `quantile` column are either "NA" (if `type` is "point") or 
a quantile in the format

    0.###
    
For quantile scenarios, this value indicates the quantile for the `value`
in this row. 

Teams should provide the following 23 quantiles:


```r
c(0.01, 0.025, seq(0.05, 0.95, by = 0.05), 0.975, 0.99)
```

```
##  [1] 0.010 0.025 0.050 0.100 0.150 0.200 0.250 0.300 0.350 0.400 0.450 0.500 0.550 0.600 0.650 0.700 0.750
## [18] 0.800 0.850 0.900 0.950 0.975 0.990
```

### `value`

Values in the `value` column are non-negative numbers indicating the "point" or 
"quantile" prediction for this row. 
For a "point" prediction, `value` is simply the value of that point prediction
for the `target` and `location` associated with that row. 
For a "quantile" prediction, `value` is the inverse of the cumulative 
distribution function (CDF)
for the `target`, `location`, and `quantile` associated with that row.


## Scenario validation (development in progress)

To ensure proper data formatting, 
pull requests for new data in data-processed/ will be automatically run.

For the first round of submissions, the autmoated pull requests may not work yet. 

### Pull request scenario validation (development in progress)

When a pull request is submitted, 
the data are validated by running
the tests in [validation.R](./code/validation/validation.R).
The intent for these tests are to validate the requirements above and 
specifically enumerated [on the wiki](https://github.com/midas-network/covid19-scenario-modeling-hub/wiki/Scenario-File-Checks).
Please [let us know](https://github.com/midas-network/covid19-scenario-modeling-hub/issues) 
if the wiki is inaccurate.

#### Run checks locally

To run these checks locally rather than waiting for the results from a pull request, follow
[these instructions](https://github.com/midas-network/covid19-scenario-modeling-hub/wiki/Scenario-File-Checks) (section File Checks Run).





