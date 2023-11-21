{% snapshot snapshot_prueba %}

{{
    config(
      target_schema='snapshots',
      unique_key='_row',
      strategy='timestamp',
      updated_at='_fivetran_synced',
    )
}}

select * from {{ source('src_google_sheets', 'budget') }}

{% endsnapshot %}