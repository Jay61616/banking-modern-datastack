{% snapshot accounts_snapshot %}
{{
    config(
      target_schema='ANALYTICS',
      unique_key='account_id',
      strategy='check',
      check_cols=['customer_id', 'account_type', 'balance']
    )
}}

SELECT * FROM {{ ref('stg_accounts') }}

{% endsnapshot %}