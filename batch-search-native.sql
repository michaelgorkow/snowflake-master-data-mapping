USE SCHEMA APPLICATIONS_MAPPING.PUBLIC;

-- https://docs.snowflake.com/en/LIMITEDACCESS/cortex-search/batch-cortex-search
SELECT
    q.SOFTWARE_NAME,
    r.*
FROM SOFTWARE_APPLICATIONS_USER_PROVIDED AS q,
LATERAL CORTEX_SEARCH_BATCH(
    service_name => 'APPLICATIONS_MAPPING.PUBLIC.SOFTWARE_APPS_SEARCH',
    query => q.SOFTWARE_NAME,   -- optional STRING
    limit => 10                -- optional INT
) AS r;