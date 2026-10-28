{{ config(materialized='view') }}

SELECT DISTINCT
    CONVERT(
        VARCHAR(64),
        HASHBYTES('SHA2_256', department),
        2
    ) AS department_key,
    department
FROM {{ ref('stg_employees') }}
WHERE department IS NOT NULL