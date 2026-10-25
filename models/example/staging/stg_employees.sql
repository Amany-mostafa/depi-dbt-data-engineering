
SELECT
    ID AS employee_id,
    {{ clean_string('first_name') }} AS first_name,
    {{ clean_string('last_name') }} AS last_name,
    {{ clean_string('gender') }} AS gender,
    {{ clean_string('email') }} AS email,
    DOB AS date_of_birth,
    salary,
    {{ clean_string('department') }} AS department,
    {{ clean_string('country') }} AS country
FROM {{ source('sources_ods', 'DEPI_data') }}
