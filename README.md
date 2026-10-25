# DEPI Data Engineering Project

## Overview
This project implements staging and data warehouse (DWH) models using dbt Core and Microsoft SQL Server.

The project transforms employee source data into cleaned staging data and organized dimension models.

## Data Pipeline

**Source:** `Depi.dbo.DEPI_data`

**Staging Layer**
- `stg_employees`: Renames columns and cleans string values using a custom dbt macro.

**DWH Layer**
- `dim_employee`: Employee attributes.
- `dim_department`: Distinct departments.
- `dim_country`: Distinct countries.

## Data Quality and Testing
- Generic tests: `not_null` and `unique`.
- Singular test: checks for duplicate employee IDs.
- Model descriptions and column documentation are defined in separate schema YAML files for the staging and DWH layers.

## Custom Macros
- `clean_string`: Trims leading and trailing whitespace and converts empty strings to `NULL`.

## Tech Stack
- dbt Core
- SQL Server
- SQL
- Jinja

## Run the Project

Install the required dbt adapter and configure a SQL Server connection in your local dbt profile.

```bash
uv run dbt debug
uv run dbt build
uv run dbt docs generate
uv run dbt docs serve
```

## Notes
Database connection settings are stored in the local dbt profile and should not be committed to this repository.
