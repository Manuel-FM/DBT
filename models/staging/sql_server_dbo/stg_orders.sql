with 

source as (

    select * from {{ source('sql_server_dbo', 'orders') }}

),

renamed as (

    select
        cast(order_id as varchar(50))as order_id,
        shipping_service,
        shipping_cost,
        address_id,
        created_at,
        promo_id,
        cast(estimated_delivery_at as timestamp(9))as _utc,
        order_cost,
        user_id,
        order_total,
        delivered_at,
        tracking_id,
        status,
        _fivetran_deleted,
        _fivetran_synced

    from source

)

select * from renamed
