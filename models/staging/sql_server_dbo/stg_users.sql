{{ config(
    materialized='incremental',
    unique_key = '_row',
    on_schema_change='fail'
    ) 
    }}
    
with 

source as (

    select * from {{ source('sql_server_dbo', 'users') }}

),

renamed as (

    select
        user_id,
        address_id,
        last_name,
        cast(REGEXP_REPLACE(phone_number,'(-)')as number )as phone_number,
        first_name,
        _fivetran_synced as f_carga

    from source

)

select * from renamed
