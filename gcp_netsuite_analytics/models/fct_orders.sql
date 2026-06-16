{{
  config(
    materialized='table',
    partition_by={
      "field": "order_date",
      "data_type": "date",
      "granularity": "day"
    },
    cluster_by=["region", "channel", "status"]
  )
}}

select * from {{ ref('stg_gcs_orders') }}
