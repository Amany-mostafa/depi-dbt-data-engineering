{{ config(materialized='view') }}

SELECT DISTINCT
    CONVERT(
        VARCHAR(64),
        HASHBYTES('SHA2_256', country),
        2
    ) AS country_key,
    country
FROM {{ ref('stg_employees') }}
WHERE country IS NOT NULL