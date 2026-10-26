# DEPI Data Engineering Project

A data engineering project built with **dbt Core and Microsoft SQL Server** as part of the Digital Egypt Pioneers Initiative (DEPI).

## Project Overview

This project transforms employee source data into cleaned staging models, dimensional data warehouse models, and an analytical mart using dbt.

## Data Pipeline

**Source:** `Depi.dbo.DEPI_data`

### 1. Staging Layer
- `stg_employees`: Renames columns and cleans string values using a custom dbt macro.
- `clean_string`: Trims leading and trailing whitespace and converts empty strings to `NULL`.

### 2. Data Warehouse Layer
- `dim_employee`: Employee attributes.
- `dim_department`: Distinct departments.
- `dim_country`: Distinct countries.

### 3. Analytics Layer
- `mart_employee_analytics`: Aggregates employee data by department and country, providing employee counts and average, minimum, and maximum salary metrics.

## Data Quality and Testing

- Generic tests: `not_null` and `unique`.
- Singular test: Checks for duplicate employee IDs.
- Model and column descriptions are maintained in schema YAML files.
- The dbt build completed successfully during project validation.

## Documentation

Explore the published dbt documentation and model lineage:

[**View dbt Documentation**](https://amany-mostafa.github.io/depi-dbt-data-engineering/)

## Tech Stack

- dbt Core
- Microsoft SQL Server
- SQL
- Jinja
- Python tooling with `uv`

## Run the Project

1. Install the project dependencies.
2. Configure a local dbt profile for your SQL Server connection.
3. Run the following commands from the project directory:

```bash
uv run dbt debug
uv run dbt build
uv run dbt docs generate
uv run dbt docs serve
```

## Repository Structure

- `models/` — Staging, dimensional, and analytical models.
- `macros/` — Reusable SQL/Jinja transformations.
- `tests/` — Data quality tests.
- `analyses/` — Analytical SQL files.
- `seeds/` — Seed data files.
- `snapshots/` — dbt snapshots.
- `docs/` — Published dbt documentation artifacts.

## Security Note

Database credentials and connection settings belong in the local dbt profile and must not be committed to the repository.
