
{{ config(materialized='view') }}

SELECT
    employee_id,
    first_name,
    last_name,
    gender,
    email,
    date_of_birth,
    salary,
    department,
    country
FROM {{ ref('stg_employees') }}
