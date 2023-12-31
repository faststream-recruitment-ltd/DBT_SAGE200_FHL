{{ config(
    indexes = [{'columns':['_airbyte_unique_key'],'unique':True}],
    unique_key = "_airbyte_unique_key",
    schema = "sage200_etl_fhl",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('nominal_codes_financ_years_period_balances_scd') }}
select
    _airbyte_unique_key,
    nominal_code_id,
    period_balance,
    adjustment_after_year_end_close,
    consolidated_amount,
    original_budget_value,
    financial_years_id,
    budget_value,
    is_future_period,
    date_time_updated,
    accounting_period_id,
    period_balance_id,
    date_time_created,
    period_number,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_period_balances_hashid
from {{ ref('nominal_codes_financ_years_period_balances_scd') }}
-- period_balances from {{ source('sage200_etl_fhl', '_airbyte_raw_nominal_codes') }}
where 1 = 1
and _airbyte_active_row = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}


