{{ config(materialized='view') }}

SELECT DISTINCT
    CONVERT(
        VARCHAR(64),
        HASHBYTES('SHA2_256', gender),
        2
    ) AS gender_key,
    gender
FROM {{ ref('stg_employees') }}
WHERE gender IS NOT NULL