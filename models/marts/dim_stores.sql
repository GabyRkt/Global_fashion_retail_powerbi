with stg_stores as (
    select * from {{ ref('stg_stores') }}
)

select
    store_id,
    store_name,
    city,
    country,
    number_of_employees,
    zip_code,
    latitude,
    longitude,
    case
        when country in ('France', 'Germany', 'Spain', 'Portugal') then 'Europe Continentale'
        when country = 'United Kingdom' then 'Europe UK'
        when country = 'United States' then 'Amérique du Nord'
        when country = 'China' then 'Asie'
        else 'Autre'
    end as region

from stg_stores