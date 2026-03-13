with stg_customers as (
    select * from {{ ref('stg_customers') }}
)

select
    customer_id,
    full_name,
    email,
    country,
    city,
    gender,
    date_of_birth,
    age,
    case
        when age < 25 then 'Gen Z'
        when age between 25 and 39 then 'Millennial'
        when age between 40 and 54 then 'Gen X'
        else 'Boomer+'
    end as generation,
    job_title

from stg_customers