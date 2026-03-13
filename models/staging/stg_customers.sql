with source as (
    select * from {{ source('raw_data', 'customers') }}
),

cleaned as (
    select
        cast(customer_id as INT64) as customer_id,
        name as full_name,
        email,
        country,
        city,
        gender,
        cast(date_of_birth as DATE) as date_of_birth,
        date_diff(current_date(), cast(date_of_birth as DATE), YEAR) as age,
        coalesce(job_title, 'Unknown') as job_title
    from source
)

select * from cleaned