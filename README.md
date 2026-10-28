# DEPI Data Engineering Project

A data engineering project built with **dbt Core and Microsoft SQL Server** as part of the Digital Egypt Pioneers Initiative (DEPI).

## Project Overview

This project transforms employee source data into a structured data warehouse using dbt. It includes data cleaning, dimensional modeling, a fact table, and an analytical mart for employee salary and department analysis.

## Data Pipeline

**Source:** `Depi.dbo.DEPI_data`

### 1. Staging Layer

- **`stg_employees`** — Renames source columns and standardizes employee data.
- **`clean_string`** — A reusable Jinja macro that trims leading and trailing whitespace and converts empty strings to `NULL`.

### 2. Data Warehouse Layer

The warehouse contains five dimension models:

- **`dim_employee`** — Employee attributes, including name, gender, date of birth, salary, department, and country.
- **`dim_department`** — Distinct departments with a deterministic department key.
- **`dim_country`** — Distinct countries with a deterministic country key.
- **`dim_gender`** — Distinct gender values with a deterministic gender key.
- **`dim_date`** — Date attributes derived from employee dates of birth, including year, month, day, month name, and quarter.

### 3. Fact Table

- **`fact_employee`** — Combines employee records with the department, country, gender, and date dimensions. It includes the employee ID, dimension keys, and salary measure.

The fact model uses dimension keys to connect employee records to their corresponding dimension attributes.

### 4. Analytics Layer

- **`mart_employee_analytics`** — Reads from `fact_employee` and joins the department and country dimensions to calculate:
  - Employee count by department and country.
  - Average salary.
  - Minimum salary.
  - Maximum salary.

This structure separates descriptive attributes into dimensions, employee-level records into a fact model, and aggregated metrics into the analytical mart.

## Data Quality and Testing

- Generic tests: `not_null` and `unique`.
- Singular test: checks for duplicate employee IDs.
- Model and column descriptions are maintained in dbt YAML schema files.
- The project was validated with `dbt build`, including model execution and data quality tests.

## Documentation

Explore the published dbt documentation and model lineage:

[**View dbt Documentation**](https://amany-mostafa.github.io/depi-dbt-data-engineering/)

Generate the latest local documentation with:

```bash
uv run dbt docs generate
```

## Tech Stack

- dbt Core
- Microsoft SQL Server
- SQL
- Jinja
- Python tooling with `uv`
- Git and GitHub

## Run the Project

### Prerequisites

- Python and `uv`
- Microsoft SQL Server
- Git
- A configured dbt profile for SQL Server

### Setup and Execution

Run these commands separately from the dbt project directory:

```bash
uv sync
uv run dbt debug
uv run dbt build
uv run dbt docs generate
uv run dbt docs serve
```

Configure the SQL Server connection in your local dbt profile before running the project. The exact dependencies and profile settings should match the repository configuration.

## Repository Structure

```text
models/
  example/
    dwh/
      dim_employee.sql
      dim_department.sql
      dim_country.sql
      dim_gender.sql
      dim_date.sql
      fact_employee.sql
    marts/
      mart_employee_analytics.sql
macros/
tests/
seeds/
analyses/
snapshots/
```

The repository may contain additional configuration, documentation, and generated files.

## Security

Keep database credentials and private connection details in your local dbt profile. Do not commit passwords, secrets, or other sensitive connection information to GitHub.
