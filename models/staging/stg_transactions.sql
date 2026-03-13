with source as (
    select * from {{ source('raw_data', 'transactions') }}
),

cleaned as (
    select
        invoice_id,
        cast(line as INT64)             as line,
        cast(customer_id as INT64)      as customer_id,
        cast(product_id as INT64)       as product_id,
        cast(store_id as INT64)         as store_id,
        cast(employee_id as INT64)      as employee_id,
        size,
        color,
        cast(unit_price as FLOAT64)     as unit_price,
        cast(quantity as INT64)         as quantity,
        parse_timestamp('%Y-%m-%d %H:%M:%S', date) as transaction_date,
        cast(discount as FLOAT64)       as discount,
        cast(line_total as FLOAT64)     as line_total,
        cast(invoice_total as FLOAT64)  as invoice_total,
        currency,
        payment_method,
        transaction_type
    from source
)

select * from cleaned
