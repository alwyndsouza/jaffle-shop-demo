{% macro drop_schema(schema_name) %}
    {% set schema_to_drop = schema_name %}
    {% if schema_to_drop %}
        {% do log("Dropping schema: " ~ schema_to_drop, info=True) %}
        {% set drop_schema_sql %}
            DROP SCHEMA IF EXISTS {{ schema_to_drop }} CASCADE
        {% endset %}
        {% do run_query(drop_schema_sql) %}
        {% do log("Schema " ~ schema_to_drop ~ " dropped.", info=True) %}
    {% else %}
        {% do log("No schema to drop.", info=True) %}
    {% endif %}
{% endmacro %}
