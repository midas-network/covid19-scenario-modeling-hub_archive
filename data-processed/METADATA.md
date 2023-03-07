# Metadata file structure

Each model is required to have metadata in 
[yaml format](https://docs.ansible.com/ansible/latest/reference_appendices/YAMLSyntax.html), 
e.g. [see this example metadata file](https://github.com/midas-network/covid19-scenario-modeling-hub/blob/master/data-processed/MyTeam-MyModel/metadata-MyTeam-MyModel.txt).

Given the many possible approaches to modeling COVID-19 scenarios, we are collecting rich metadata to be able to understand heterogeneity among model projections. The information will only be used internally, unless otherwise indicated. 

Please order the variables in this order.

## Required variables

### `team_name`

The name of your team that is less than 50 characters, no spaces. Will be displayed online. 

### `model_name`

The name of your model that is less than 50 characters, no spaces. Will be displayed online.

### `model_abbr`

An abbreviated name for your model that is less than 30 alphanumeric characters. The model abbreviation must be in the format of `[team_abbr]-[model_abbr]`. where each of the `[team_abbr]` and `[model_abbr]` are text strings that are each less than 15 alphanumeric characters that do not include a hyphen or whitespace  Note that this is a uniquely identifying field in our system, so please choose this name carefully, as it may not be changed once defined. An example of a valid `model_abbr` is `UMass-MechBayes` or `UCLA-SuEIR`. The model abbreviation will be displayed online. 

### `model_version`

A version number or date in YYYY-MM-DD format, to designate the version of the model used for submitted model projections. Will be displayed online. 

### `model_contributors`

A list of all individuals involved in the forecasting effort,
affiliations, and email address.
At least one contributor needs to have a valid email address. 
All email addresses provided will be added to 
an email distribution list for model contributors.

The syntax of this field should be 

    name1 (affiliation1) <user@address>, name2 (affiliation2) <user2@address2>

### `website_url`

(previously named `model_output`)

A url to a website that has additional data about your model. 
We encourage teams to submit the most user-friendly version of your 
model, e.g. a dashboard, or similar, that displays your model scenarios. 
If you have additionally a data repository
where you store scenarios and other model code, 
please include that in your methods section below. 
If you only have a more technical site, e.g. github repo, 
please include that link here. 
Will be displayed online. 

### `license`

We encourage teams to submit as a "cc-by-4.0" to allow the broadest possible uses
including private vaccine production 
(which would be excluded by the "cc-by-nc-4.0" license). 

Alternatively, add the name and URL of the license used, as in `cc-by-4.0, https://creativecommons.org/licenses/by/4.0/`
Or, add the value `LICENSE.txt`, if a LICENSE.txt file was added within the folder.

Will be displayed online. 

### `methods`

A brief description of your forecasting methodology that is less than 200 
characters. Will be displayed online. 

### `modeling_NPI`

A brief description of how Non-Pharmaceutical Interventions (NPI) were represented by the model, or "Not applicable".

### `compliance_NPI`

A brief description of any additional assumptions made regarding compliance with NPI, beyond what was specified in the given scenarios; or "Not applicable".

### `contact_tracing`

A brief description of how contact tracing was represented by the model, or "Not applicable".

### `testing`

A brief description of what testing strategies were represented by the model, or "Not applicable".

### `vaccine_efficacy_transmission`

A brief description of assumptions regarding vaccine efficacy against transmission, or "Not applicable".

### `vaccine_efficacy_delay`

If a delay was assumed in the build-up of vaccine efficacy, please describe the assumptions here; or "Not applicable".

### `vaccine_hesitancy`

A brief description of assumptions or representation of vaccine hesitancy, by priority target group such as healthcare workers, essential worksers, elderly, etc.; or "Not applicable". 

### `vaccine_immunity_duration`

Assumed length of vaccine-derived immunity, or "Not applicable".

### `natural_immunity_duration`

Assumed length of the duration of natural immunity assumed, or "Not applicable".

### `case_fatality_rate`

Assumed fatality rate of detected COVID-19 cases, as a proportion between 0 and 1, or "Not applicable".

### `infection_fatality_rate`

Assumed fatality rate of SARS-CoV-2 infections (detected or undetected), as a proportion between 0 and 1, or "Not applicable".

### `asymptomatics`

Assumed proportion of SARS-CoV-2 infections that remain asymptomatic, as a proportion between 0 and 1, or "Not applicable". 

### `age_groups`

Age groups represented in the model, in years, given as a set of intervals between square brackets: as in `[0-5, 6-10, 10-50, 50+]`, or "Not applicable".

### `importations`

Brief description of assumptions made or representation in the model of importations, or "Not applicable".

### `confidence_interval_method`

Brief description of the method used to compute confidence (or other uncertainty) interval, or "Not applicable".

### `calibration`

Brief description of model calibration methods, or "Not applicable".

### `spatial_structure`

Brief description of how spatial structure is represented by the model, or "Not applicable".

## Optional

### `team_funding`

Acknowledgement of funding source, by name of funding agency, grant title, and grant number. 

### `data_inputs`

A brief description of the data sources used to inform the model, using as much as possible standard terminology that includes a source name and the type of data, such as `JHU CSSE case and death data`, `NYTimes death data`, `Google mobility data`, etc. 

### `citation`

A bibliographic citation to a paper, website, or other object that people can go to to find out more about the model, in the style used by PubMed, as `Flaxman S, Mishra S, Gandy A, Unwin HJT, Mellan TA, Coupland H, Whittaker C, Zhu H, Berah T, Eaton JW, Monod M; Imperial College COVID-19 Response Team, Ghani AC, Donnelly CA, Riley S, Vollmer MAC, Ferguson NM, Okell LC, Bhatt S. Nature. 2020 Aug;584(7820):257-261. doi: 10.1038/s41586-020-2405-7. Epub 2020 Jun 8. PMID: 32512579`. Will be displayed

### `methods_long`

An extended description of the methods used in the model. 
If the model is modified, this field can be used to provide a description of the change. Use model_version to indicate the version or date of last update. 
