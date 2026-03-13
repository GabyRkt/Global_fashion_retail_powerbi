with source as (
    select * from {{ source('raw_data', 'discounts') }}
),

cleaned as (
    select
        cast(`start` as DATE)           as start_date,
        cast(`end` as DATE)             as end_date,
        cast(discont as FLOAT64)        as discount_rate,
        description,
        category,
        sub_category
    from source
)

select * from cleaned