with source as (
    select * from {{ source('raw_data', 'products') }}
),

cleaned as (
    select
        cast(product_id as INT64)       as product_id,
        category,
        sub_category,
        description_en,
        description_fr,
        color,
        sizes,
        cast(production_cost as FLOAT64) as production_cost
    from source
)

select * from cleaned