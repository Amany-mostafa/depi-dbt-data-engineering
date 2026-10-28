{{ config(materialized='view') }}

WITH date_values AS (
    SELECT DISTINCT
        CAST(date_of_birth AS DATE) AS full_date
    FROM {{ ref('stg_employees') }}
    WHERE date_of_birth IS NOT NULL
)

SELECT
    CONVERT(INT, CONVERT(CHAR(8), full_date, 112)) AS date_key,
    full_date,
    YEAR(full_date) AS year,
    MONTH(full_date) AS month,
    DAY(full_date) AS day,
    DATENAME(MONTH, full_date) AS month_name,
    DATEPART(QUARTER, full_date) AS quarter
FROM date_values