
{% snapshot products_snapshot %}
{{
  config(
    target_database='advanced_materializations',
    target_schema='snapshots_jgonzaga',
    unique_key='id',
    strategy='timestamp',
    updated_at='updated_at',
  )
}}
select * from {{ source('jaffle_shop', 'products') }}
{% endsnapshot %}