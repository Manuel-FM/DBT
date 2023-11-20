WITH stg_events AS (
    SELECT *
    FROM {{ ref('stg_events') }}
),

renamed_casted AS (
    SELECT
        user_id,
        sum(CASE WHEN event_type = 'checkout' THEN 1 END) AS checkout_amount,
        sum(CASE WHEN event_type = 'package_shipped' THEN 1 END)
            AS package_shipped_amount,
        sum(CASE WHEN event_type = 'add_to_cart' THEN 1 END)
            AS add_to_cart_amount,
        sum(CASE WHEN event_type = 'page_view' THEN 1 END) AS page_view_amount
    FROM stg_events
    GROUP BY 1
)

SELECT * FROM renamed_casted
