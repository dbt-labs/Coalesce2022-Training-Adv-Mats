{% snapshot name_of_snapshot %}
{{
  config(
    target_database='advanced_materializations',
    target_schema='snapshots_eml',
    unique_key='id',
    strategy='timestamp',
    updated_at='updated_at',
    invalidate_hard_deletes=True,
  )
}}
select * from {{ source('jaffle_shop', 'products') }}
{% endsnapshot %}