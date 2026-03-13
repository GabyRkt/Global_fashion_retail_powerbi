with stg_products as (
    select * from {{ ref('stg_products') }}
)

select
    product_id,
    category,
    sub_category,
    description_en,
    description_fr,
    color,
    sizes,
    production_cost,
    case
        when category = 'Feminine' then 'Femme'
        when category = 'Masculine' then 'Homme'
        when category = 'Children' then 'Enfant'
        else 'Autre'
    end as category_fr

from stg_products