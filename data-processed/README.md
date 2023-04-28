# Data submission instructions

This page is intended to provide teams with all the information they need to
submit scenarios.  

All scenarios should be submitted directly to the [data-processed/](./) 
folder. Data in this directory should be added to the repository through
a pull request. 

Due to file size limitation, the file can be submitted in a `.parquet` or `.gz.parquet`.

The submission file format has been updated starting round 17 (April 2023).  For 
information on previous file format please refer to past version of this 
[README file](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/fb8040bca943dae9ca4e76eefe4410e4f6866c82/data-processed/README.md). 

----

## Example

See [this file](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/MyTeam-MyModel/2023-04-16-MyTeam-MyModel.gz.parquet)
for an illustration of part of a (hypothetical) submission file. 

---

## Subdirectory

Each subdirectory within the [data-processed/]((https://github.com/midas-network/covid19-scenario-modeling-hub/tree/master/data-processed)) directory has
the format

    team-model
    
where 

- `team` is the teamname and 
- `model` is the name of your model. 

Both team and model should be less than 15 characters, and not include hyphens
nor spaces.

Within each subdirectory, there should be a metadata file, a license file
(optional), and a set of scenarios. 

----

## Metadata 

The metadata file name should have the following format

    metadata-team-model.txt
    
where 

- `team` is the teamname, usually the name of the submitting institution. 
- `model` is the name of your model, used to distinguish between multiple models from a single institution.
    
The metadata file must follow the [documented description](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/METADATA.md).
An example [hypothetical metadata file](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/MyTeam-MyModel/metadata-MyTeam-MyModel.txt)
has been posted in the data-processed directory. 

---

## License (optional)

License information for data sharing and reuse is requested in the metadata,
including a link to the license text. If you cannot link to the text of a
standard license and have specific license text, include a license file
named

    LICENSE.txt
    
----

## Date/Epiweek information

For week-ahead scenarios, we will use the specification of epidemiological
weeks (EWs) [defined by the US CDC](https://ndc.services.cdc.gov/wp-content/uploads/MMWR_Week_overview.pdf)
which run Sunday through Saturday.

There are standard software packages to convert from dates to epidemic weeks
and vice versa. E.g. [MMWRweek](https://cran.r-project.org/web/packages/MMWRweek/) 
for R and [pymmwr](https://pypi.org/project/pymmwr/) and 
[epiweeks](https://pypi.org/project/epiweeks/) for python.

---

## Model Results

Each model results file within the subdirectory should have the following
name

    YYYY-MM-DD-team-model.parquet
    
where

- `YYYY` is the 4 digit year,
- `MM` is the 2 digit month,
- `DD` is the 2 digit day,
- `team` is the teamname, and
- `model` is the name of your model.

"parquet" files format from Apache is "is an open source, column-oriented data
file format designed for efficient data storage and retrieval". Please find more
information on the [parquet.apache.com](https://parquet.apache.org/) website.

The "arrow" library can be used to read/write the files in 
[Python](https://arrow.apache.org/docs/python/parquet.html) and 
[R](https://arrow.apache.org/docs/r/index.html).
Other tools are also accessible, for example [parquet-tools](https://github.com/hangxie/parquet-tools)

For example, in R:
```
# To write "parquet" file format:
filename <- ”path/YYYY-MM-DD-team_model.parquet”
arrow::write_parquet(df, filename)
# with "gz compression"
filename <- ”path/YYYY-MM-DD-team_model.gz.parquet”
arrow::write_parquet(df, filename, compression = "gzip", compression_level = 9)

# To read "parquet" file format:
arrow::read_parquet(filename)
```

The date YYYY-MM-DD should correspond to the start date for scenarios
projection ("first date of simulated transmission/outcomes" as noted in the
scenario description on the main 
[README, Submission Information](https://github.com/midas-network/covid19-scenario-modeling-hub#submission-information)).

The `team` and `model` in this file must match the `team` and `model` in the
directory this file is in. Both `team` and `model` should be less than 15
characters, alpha-numeric and underscores only, with no spaces or hyphens.

If the size of the file is larger than 100MB, it should be submitted in a 
`.gz.parquet` format. 

---

## Model results file format

The file must be a parquet file with the following
columns (in any order):

The output file should contains eight columns:
- `origin_date`
- `scenario_id`
- `target`
- `horizon`
- `location`
- `type` 
- `type_id` 
- `value`


No additional columns are allowed.

Each row in the file is a specific type for a scenario for a location on
a particular date for a particular target. 

### `origin_date`

Values in the `origin_date` column must be a date in the format

    YYYY-MM-DD
    
The `origin_date` is the start date for scenarios (first date of 
simulated transmission/outcomes).
The "origin_date" and date in the filename should correspond.


### `scenario_id`

The standard scenario id should be used as given in in the scenario
description in the [main Readme](https://github.com/midas-network/covid19-scenario-modeling-hub). 
Scenario IDs include a captitalized letter and date as YYYY-MM-DD, e.g.,
`A-2020-12-22`.


### `target`

The submission can contain multiple output type information: 
- 100 representative trajectories from the model simulations. We will 
  call this format "sample" type output. For more information, please
  consult the 
  [sample](https://github.com/midas-network/covid19-scenario-modeling-hub/tree/master/data-processed#sample) 
  section.
- A set of quantiles with an optional "mean" value for all the tarquets.
  We will call this format "quantile" type output. For more information, 
  please consult the 
  [quantile](https://github.com/midas-network/covid19-scenario-modeling-hub/tree/master/data-processed#quantile-and-mean) 
  section. 

The requested targets are (for "sample" type output):
- weekly incident deaths
- weekly incident hospitalizations

Optional target (for "quantile" type output):
- cumulative deaths
- cumulative incident hospitalizations
- weekly incident deaths
- weekly incident hospitalizations

Values in the `target` column must be one of the following character strings:
- "inc death"  
- "inc hosp"
- "cum death"  
- "cum hosp"

For round 17, if the size of the output file is larger than 100MB
in the `.gz.parquet` format, it is accepted to split the file into multiple 
files by target and optional values, following the filename standard:

- `YYYY-MM-DD-team_model-incdeath.gz.parquet` (containing "sample" values 
  for the target "inc death")
- `YYYY-MM-DD-team_model-inchosp.gz.parquet` (containing "sample" values 
  for the target "inc hops")
- `YYYY-MM-DD-team_model-quantile.gz.parquet` (containing "quantile" 
  and mean values, this file is optional)


#### inc death

This target is the incident (weekly) number of deaths predicted by the model
during the week that is N weeks after `origin_date`. 

A week-ahead scenario should represent the total number of new deaths on 
the dates they occurred, not on the date they were reported (from Sunday through 
Saturday, inclusive).

Predictions for this target will be evaluated compared to the number of new
deaths, as recorded by the National Center for Health Statistics (NCHS) as 
distributed by the
[COVIDcast Epidata API](https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/nchs-mortality.html).


#### inc hosp

This target is the incident (weekly) number of hospitalized cases predicted by
the model during the week that is N weeks after `origin_date`. 

A week-ahead scenario should represent the total number of new hospitalized
cases reported during a given epiweek (from Sunday through Saturday,
inclusive).

Predictions for this target will be evaluated compared to the number of new
hospitalized cases, as reported by the HHS and distributed by the
[COVIDcast Epidata API](https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/hhs.html).


#### cum death

This target is the cumulative number of deaths predicted by the model during 
the week that is N weeks after `origin_date` (since start of the simulation). 

A week-ahead scenario should represent the cumulative number of deaths
reported on the Saturday of a given epiweek.

Predictions for this target will be evaluated compared to the cumulative of
the number of new deaths, as recorded by the National Center for Health 
Statistics (NCHS) as distributed by the
[COVIDcast Epidata API](https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/nchs-mortality.html).


#### cum hosp

This target is the cumulative number of incident (weekly) number of
hospitalized cases predicted by the model during the week that is N weeks
after `origin_date` (since start of the simulation). 

A week-ahead scenario should represent the cumulative number of hospitalized
cases reported on the Saturday of a given epiweek.

Predictions for this target will be evaluated compared to the cumulative of
the number of new hospitalized cases, as reported by the HHS and distributed
by the [COVIDcast Epidata API](https://cmu-delphi.github.io/delphi-epidata/api/covidcast-signals/hhs.html).


### `horizon`


Values in the `horizon` column must be a integer (N) between 1 and last week 
horion value representing the associated target value during the N weeks
after `origin_date`. 

For example, between 1 and 104 for Round 17 ("**Simulation end date:** 
April 19, 2025 (104-week horizon)") and in the following example table,
the first row represent the number of incident death in the US, for the 1st 
epiweek (epiweek ending on 2023-04-22)after 2023-04-16 for the scenario 
A-2023-04-16. 

|origin_date|scenario_id|location|target|horizon|...|
|:---:|:---:|:---:|:---:|:---:|:---:|
|2023-04-16|A-2023-04-16|US|inc death|1|...|
||||||


### `location`

Values in the `location` column must be one of the "locations" in this
[FIPS numeric code file](../data-locations/locations.csv) which includes
numeric FIPS codes for U.S. states, counties, territories, and districts as
well as "US" for national scenarios. 

Please note that when writing FIPS codes, they should be written in as a
character string to preserve any leading zeroes.


### `type`

Values in the `type` column are either

- "sample" or 
- "quantile" (optional) or
- "mean" (optional)

This value indicates whether that row corresponds to a "sample" scenario or a
quantile scenario. 

**Scenarios must include "sample" scenario for every
  scenario-location-target-horizon group.**

### `type_id`

#### `sample`

For the optional simulation samples format only. Values in the `type_id` column
are numeric between `1` and `100` indicating an id sample number. Each ID number
represents one in 100 representative trajectories from the simulations. 

**All scenario-location-target-horizon group should have a unique associated
sample.**

For example:

|origin_date|scenario_id|location|target|horizon|type|type_id|value|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|2023-04-16|A-2023-04-16|US|inc death|1|sample|1||
|2023-04-16|A-2023-04-16|US|inc death|2|sample|1||
|2023-04-16|A-2023-04-16|US|inc death|3|sample|1||
|||||||||
|2023-04-16|A-2023-04-16|US|inc death|1|sample|2||
|2023-04-16|A-2023-04-16|US|inc death|2|sample|2||
|||||||||

#### `quantile` and `mean`

Values in the `quantile` column are quantiles in the format

    0.###
    
For quantile scenarios, this value indicates the quantile for the `value` in
this row. 

Teams should provide the following 23 quantiles:

``` 
0.010 0.025 0.050 0.100 0.150 0.200 0.250 0.300 0.350 0.400 0.450 0.500
0.550 0.600 0.650 0.700 0.750, 0.800 0.850 0.900 0.950 0.975 0.990 
```

An optional `mean` value can also be provided with `mean` as "type" value
and `NA` as "type_id" value.

For example:

|origin_date|scenario_id|location|target|horizon|type|type_id|value|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|2023-04-16|A-2023-04-16|US|inc death|1|quantile|0.010||
|2023-04-16|A-2023-04-16|US|inc death|1|quantile|0.025||
|||||||||
|2023-04-16|A-2023-04-16|US|inc death|1|mean|NA||
|||||||||


### `value`

Values in the `value` column are non-negative numbers indicating the "sample"
or "quantile" prediction for this row. 

For a "quantile" prediction, `value` is the inverse of the cumulative distribution
function (CDF) for the `target`,`horizon`, `location`, and `quantile` associated with 
that row.

---

## Scenario validation

To ensure proper data formatting, pull requests for new data or updates in
data-processed/ will be automatically validated.

### Pull request scenario validation

When a pull request is submitted, the data are validated by running the
scripts in [validation.R](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/code/validation/validation.R). The intent for
these tests are to validate the requirements above and all checks are 
specifically enumerated [on the wiki](https://github.com/midas-network/covid19-scenario-modeling-hub/wiki/Scenario-File-Checks).
Please [let us know](https://github.com/midas-network/covid19-scenario-modeling-hub/issues) if
the wiki is inaccurate.

#### Workflow

When a pull request is submitted, the validation will be 
automatically triggered.

- If the pull request (PR) contains update on metadata 
and/or abstract file(s):
    - These files are manually validated, the automatic validation
    will only returns a message indicating it did not run any
    validation. 

- If the PR contains model output submission file(s). The validation 
automatically runs and output a message:

    - The validation has 3 possible output:
        - "Error": the validation has failed and returned a message 
        indicating the error(s). The error(s) should be fixed to have the PR 
        accepted
        - "Warning": the PR can be accepted. However, it might be necessary 
        for the submitting team to validate if the warning(s) is expected or 
        not before merging the PR.
        - "Success": the validation did not found any issue and returns a message 
        indicating that the validation is a success and the PR can be merged.


#### Run checks locally

To run these checks locally rather than waiting for the results from a pull
request, follow [these instructions](https://github.com/midas-network/covid19-scenario-modeling-hub/wiki/Scenario-File-Checks#file-checks-running-locally)
(section File Checks Run Locally).

