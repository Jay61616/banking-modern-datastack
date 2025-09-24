{{ config(materialized='view') }}

with ranked as (
    select
        v:id::string            as customer_id,
        v:first_name::string    as first_name,
        v:last_name::string     as last_name,
        v:email::string         as email,
        v:created_at::timestamp as created_at,
        current_timestamp       as load_timestamp,
        row_number() over (
            partition by v:id::string
            order by v:created_at desc
        ) as rn
    from {{ source('raw', 'customers') }}
)

select
    customer_id,
    first_name,
    last_name,
    email,
    created_at,
    load_timestamp
from ranked
where rn = 1