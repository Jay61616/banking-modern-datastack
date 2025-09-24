{{ config(materialized='view') }}

with ranked as (
    select
        v:id::string            as account_id,
        v:customer_id::string   as customer_id,
        v:account_type::string  as account_type,
        v:balance::float        as balance,
        v:currency::string      as currency,
        v:created_at::timestamp as created_at,
        current_timestamp       as load_timestamp,
        row_number() over (
            partition by v:id::string
            order by v:created_at desc
        ) as rn
    from {{ source('raw', 'accounts') }}
)

select
    account_id,
    customer_id,
    account_type,
    balance,
    currency,
    created_at,
    load_timestamp
from ranked
where rn = 1