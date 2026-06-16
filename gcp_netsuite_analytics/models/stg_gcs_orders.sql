with source_data as (
    select * from {{ source('gcs', 'transformations') }}
),
final as (
    select
        transaction_id,
        customer_id,
        cast(order_date as date) as order_date,
        region,
        channel,
        status,
        cast(order_total as float64) as order_total,
        cast(item_count as int64) as item_count,
        company_name,
        email,
        tier
    from source_data
)
select * from final
