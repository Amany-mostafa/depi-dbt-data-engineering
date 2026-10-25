
{{ config(materialized='view') }}

SELECT DISTINCT
    country
FROM {{ ref('stg_employees') }}
WHERE country IS NOT NULL
