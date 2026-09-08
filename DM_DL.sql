--CTAS TABLE 'CREATE TABLE AS SELECT'
CREATE OR Replace TABLE main.Data_Roles_CTAS AS
SELECT 
    jpf.job_id,
    jpf.job_title_short,
    cd.name,
    jpf.salary_year_avg 
From data_jobs.job_postings_fact as jpf
LEFT JOIN data_jobs.company_dim AS  cd ON cd.company_id = jpf.company_id
WHERE jpf.salary_year_avg is NOT NULL
Limit 100_000;


--View Table it is like a qurry every time you need table it use qurry and update it self 
Create OR Replace View staging.Data_Roles_view AS
SELECT
    dr.Title,
    drc.salary_year_avg
From main.Data_Roles_CTAS AS drc
LEFT JOIN staging.Data_Roles AS dr ON dr.Title = drc.job_title_short;

--Temp Table 
CREATE TEMPORARY Table Data_Engineer_Role AS
SELECT
*
From main.Data_Roles_CTAS
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