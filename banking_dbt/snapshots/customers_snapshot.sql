{% snapshot customers_snapshot %}
{{
    config(
      target_schema='ANALYTICS',
      unique_key='customer_id',
      strategy='check',
      check_cols=['first_name', 'last_name', 'email']
    )
}}
SELECT * FROM {{ ref('stg_customers') }}
{% endsnapshot %}