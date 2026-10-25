
SELECT employee_id
FROM {{ ref('stg_employees') }}
GROUP BY employee_id
HAVING COUNT(*) > 1
