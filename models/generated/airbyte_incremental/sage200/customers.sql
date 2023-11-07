{{ config(
    indexes = [{'columns':['_airbyte_unique_key'],'unique':True}],
    unique_key = "_airbyte_unique_key",
    schema = "sage200_etl_fhl",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('customers_scd') }}
select
    _airbyte_unique_key,
    office_type,
    account_type,
    balance,
    default_nominal_code_cost_centre,
    {{ adapter.quote('id') }},
    payment_terms_days,
    trading_terms,
    customer_discount_group_id,
    months_to_keep_transactions,
    spare_text_3,
    spare_number_7,
    spare_text_2,
    spare_number_6,
    spare_text_5,
    spare_number_9,
    analysis_code_2,
    spare_text_4,
    spare_number_8,
    analysis_code_1,
    spare_text_7,
    analysis_code_4,
    spare_text_6,
    analysis_code_3,
    spare_text_9,
    analysis_code_6,
    spare_text_8,
    analysis_code_5,
    analysis_code_8,
    analysis_code_7,
    spare_number_1,
    analysis_code_9,
    spare_number_3,
    spare_number_2,
    spare_text_1,
    spare_number_5,
    spare_number_4,
    credit_bureau_id,
    short_name,
    spare_number_10,
    fax_area_code,
    analysis_code_20,
    telephone_area_code,
    duns_code,
    default_nominal_code_reference,
    invoice_discount_percent,
    invoice_line_discount_percent,
    status_reason,
    average_time_to_pay,
    website,
    telephone_country_code,
    date_time_updated,
    analysis_code_10,
    analysis_code_11,
    analysis_code_12,
    analysis_code_13,
    spare_bool_5,
    analysis_code_14,
    analysis_code_15,
    analysis_code_16,
    default_tax_code_id,
    analysis_code_17,
    analysis_code_18,
    analysis_code_19,
    price_band_id,
    use_consolidated_billing,
    spare_bool_3,
    spare_bool_4,
    produce_statements_for_customer,
    spare_bool_1,
    account_opened,
    spare_bool_2,
    terms_agreed,
    vat_number,
    telephone_subscriber_number,
    reference,
    value_of_current_orders_in_sop,
    order_value_discount_id,
    default_nominal_code_department,
    country_code_id,
    payment_terms_basis,
    order_priority,
    {{ adapter.quote('name') }},
    associated_head_office_id,
    early_settlement_discount_percent,
    finance_charge_id,
    fax_subscriber_number,
    use_tax_code_as_default,
    fax_country_code,
    credit_position_id,
    early_settlement_discount_days,
    credit_limit,
    credit_reference,
    on_hold,
    exchange_rate_type,
    spare_text_10,
    date_time_created,
    currency_id,
    account_status_type,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_customers_hashid
from {{ ref('customers_scd') }}
-- customers from {{ source('sage200_etl_fhl', '_airbyte_raw_customers') }}
where 1 = 1
and _airbyte_active_row = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

