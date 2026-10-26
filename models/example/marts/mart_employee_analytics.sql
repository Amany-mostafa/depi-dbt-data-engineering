
{{ config(materialized='view') }}

SELECT
    department,
    country,
    COUNT(*) AS employee_count,
    AVG(CAST(salary AS DECIMAL(18, 2))) AS average_salary,
    MIN(CAST(salary AS DECIMAL(18, 2))) AS minimum_salary,
    MAX(CAST(salary AS DECIMAL(18, 2))) AS maximum_salary
FROM {{ ref('stg_employees') }}
WHERE department IS NOT NULL
  AND country IS NOT NULL
GROUP BY
    department,
    country
