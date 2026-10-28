{{ config(materialized='view') }}

SELECT
    d.department,
    c.country,
    COUNT(*) AS employee_count,
    AVG(CAST(f.salary AS DECIMAL(18, 2))) AS average_salary,
    MIN(CAST(f.salary AS DECIMAL(18, 2))) AS minimum_salary,
    MAX(CAST(f.salary AS DECIMAL(18, 2))) AS maximum_salary
FROM {{ ref('fact_employee') }} f
LEFT JOIN {{ ref('dim_department') }} d
    ON f.department_key = d.department_key
LEFT JOIN {{ ref('dim_country') }} c
    ON f.country_key = c.country_key
WHERE d.department IS NOT NULL
  AND c.country IS NOT NULL
GROUP BY
    d.department,
    c.country