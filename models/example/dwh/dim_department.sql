
{{ config(materialized='view') }}

SELECT DISTINCT
    department
FROM {{ ref('stg_employees') }}
WHERE department IS NOT NULL
