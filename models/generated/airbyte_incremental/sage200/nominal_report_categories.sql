{{ config(
    indexes = [{'columns':['_airbyte_unique_key'],'unique':True}],
    unique_key = "_airbyte_unique_key",
    schema = "sage200_etl_fhl",
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('nominal_report_categories_scd') }}
select
    _airbyte_unique_key,
    code,
    account_report_category_type,
    account_report_type,
    description,
    date_time_updated,
    {{ adapter.quote('id') }},
    date_time_created,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_nominal_report_categories_hashid
from {{ ref('nominal_report_categories_scd') }}
-- nominal_report_categories from {{ source('sage200_etl_fhl', '_airbyte_raw_nominal_report_categories') }}
where 1 = 1
and _airbyte_active_row = 1
{{ incremental_clause('_airbyte_emitted_at', this) }}

