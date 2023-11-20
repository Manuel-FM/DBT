with source as (

    select * from {{ source('sql_server_dbo', 'promos') }}

),

renamed as (

    select
        cast(
            {{dbt_utils.surrogate_key("promo_id")}}as varchar(50)
        )as promo_id,
        cast(promo_id as varchar(50))as des_promo
    from source
)

select * from renamed
union all
select
    '9999' as promo_id,
    'sin promo' as des_promo