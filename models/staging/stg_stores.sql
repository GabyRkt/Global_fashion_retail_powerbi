with source as (
    select * from {{ source('raw_data', 'stores') }}
),

cleaned as (
    select
        cast(store_id as INT64)         as store_id,
        store_name,
        city,
        country,
        cast(number_of_employees as INT64) as number_of_employees,
        zip_code,
        cast(latitude as FLOAT64)       as latitude,
        cast(longitude as FLOAT64)      as longitude
    from source
)

select * from cleaned