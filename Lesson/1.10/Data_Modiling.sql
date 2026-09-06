--Information schema
SELECT
    *
From information_schema.tables
WHERE table_catalog = 'data_jobs';

SELECT
    *
From information_schema.columns
WHERE table_catalog = 'data_jobs';

SELECT
    *
From information_schema.table_constraints
WHERE table_catalog = 'data_jobs';

PRAGMA show_tables;

Describe job_postings_fact;

--get
