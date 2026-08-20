{% macro random_macro() %}

{% set query %}
select distinct 
token_address
from {{ref('stg_token_transfers')}}
{% endset %}

{% if execute %}

{% set result = run_query(query) %}

{% set result_list=result.columns[0].values() %}

{% else %}

{% set result_list=[] %}

{% endif %}

{% set sql = [] %}

{% for i in result_list %}

{% do sql.append("'"~i~"'") %}

{% endfor %}

{{ log(sql | join(', ')  , info=true )}}

{{ return(sql | join(', ') ) }}

{% endmacro %}