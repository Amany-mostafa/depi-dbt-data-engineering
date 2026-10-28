{{ config(materialized='view') }}

SELECT
    e.employee_id,
    d.department_key,
    c.country_key,
    g.gender_key,
    dt.date_key,
    e.salary
FROM {{ ref('dim_employee') }} e
LEFT JOIN {{ ref('dim_department') }} d
    ON e.department = d.department
LEFT JOIN {{ ref('dim_country') }} c
    ON e.country = c.country
LEFT JOIN {{ ref('dim_gender') }} g
    ON e.gender = g.gender
LEFT JOIN {{ ref('dim_date') }} dt
    ON CAST(e.date_of_birth AS DATE) = dt.full_date