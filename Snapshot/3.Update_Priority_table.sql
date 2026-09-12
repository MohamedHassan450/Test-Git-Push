--Create Temp Table 
CREATE OR Replace Temp Table src_priority_roles AS
Select
    jpf.job_id,
    jpf.job_title_short,
    cd.name AS company_name,
    jpf.job_posted_date,
    jpf.salary_year_avg,
    r.priorety_lvl,
    CURRENT_TIMESTAMP AS updated_at
   From data_jobs.job_postings_fact AS jpf
   LEFT JOIN data_jobs.company_dim AS cd ON cd.company_id = jpf.company_id
   INNER JOIN staging.priorety_roles AS r ON r.title = jpf.job_title_short;

--Update Statement
UPDATE main.priorety_roles_snapshot AS tgt
SET
    tgt.prioretly_lvl = src.prioretly_lvl,
    tgt.updated_at = src.updated_at
From src_priority_roles as src
Where tgt.job_id = src.job_id AND tgt.prioretly_lvl is distinct from src.prioretly_lvl ;

--Insert Statement
INSERT INTO main.priorety_roles_snapshot (
   job_id ,
   job_title_short,
   company_name,
   job_posting_date,
   salary_year_avg,
   prioretly_lvl,
   updated_at
   )
Select
    src.job_id,
    src.job_title_short,
    src.company_name,
    src.job_posted_date,
    src.salary_year_avg,
    src.priorety_lvl,
    src.updated_at
From src_priority_roles AS src
WHERE NOT EXISTS (SELECT 1 From main.priorety_roles_snapshot AS tgt where tgt.job_id = src.job_id);

--Delete Statement
Delete From main.priorety_roles_snapshot AS tgt
Where
(
    Select
    1
    From src_priority_roles as src
    WHERE src.job_id = tgt.job_id
);
