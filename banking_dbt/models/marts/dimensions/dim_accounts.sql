{{ config(materialized='table') }}

WITH source_data AS (
    SELECT
        account_id,
        customer_id,
        account_type,
        balance,
        currency,
        created_at,
        dbt_valid_from   AS effective_from,
        dbt_valid_to     AS effective_to,
        CASE WHEN dbt_valid_to IS NULL THEN TRUE ELSE FALSE END AS is_current
    FROM {{ ref('accounts_snapshot') }}
)

SELECT * FROM source_data