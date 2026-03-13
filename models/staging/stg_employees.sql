with source as (
    select * from {{ source('raw_data', 'employees') }}
),

cleaned as (
    select
        cast(employee_id as INT64)      as employee_id,
        cast(store_id as INT64)         as store_id,
        name                            as full_name,
        coalesce(position, 'Unknown')   as position
    from source
)

select * from cleaned