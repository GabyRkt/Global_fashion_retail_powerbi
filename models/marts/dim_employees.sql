with stg_employees as (
    select * from {{ ref('stg_employees') }}
)

select
    employee_id,
    store_id,
    full_name,
    position

from stg_employees
