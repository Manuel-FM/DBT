{% snapshot ejercicio_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='user_id',
      strategy='check',
      check_cols=['address_id', 'last_name','phone_number','first_name'],
      invalidate_hard_deletes=True,
    )
}}

select * from {{ ref('stg_users') }}

WHERE f_carga = (SELECT max(f_carga) FROM {{ ref("stg_users") }})
{% endsnapshot %}