--CTAS TABLE 'CREATE TABLE AS SELECT'
CREATE OR Replace TABLE staging.job_postings_flat AS
SELECT 
    jpf.job_id,
    jpf.job_title_short,
    cd.name,
    jpf.salary_year_avg 
From data_jobs.job_postings_fact as jpf
LEFT JOIN data_jobs.company_dim AS  cd ON cd.company_id = jpf.company_id
WHERE jpf.salary_year_avg is NOT NULL
Limit 100_000;

--View Table
Create OR Replace View job_postings_flat_view AS
SELECT
*
From staging.job_postings_flat as jpf
INNER JOIN staging.Data_Roles as dr on dr.Tilte = jpf.job_title_short ;

--Temp Table 
CREATE TEMPORARY Table Data_Engineer_Role AS
SELECT
*
From main.job_postings_flat_view
WHERE job_title_short = 'Data Engineer';

SELECT
*
From information_schema.tables
WHERE table_catalog = 'bismallah';


SELECT
*
From information_schema.tables
WHERE table_catalog = 'data_jobs';

SELECT
*
From information_schema.tables
WHERE table_catalog = 'sample_data';