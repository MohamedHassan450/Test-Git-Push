USE Snap_shot;

CREATE OR Replace Table main.priorety_roles_snapshot
(
   job_id  int primary key,
   job_title_short varchar,
   company_name varchar,
   job_posting_date timestamp,
   salary_year_average double,
   prioretly_lvl smallint,
   updated_at timestamp
);

INSERT INTO main.priorety_roles_snapshot (
   job_id ,
   job_title_short,
   company_name,
   job_posting_date,
   salary_year_average,
   prioretly_lvl,
   updated_at)
   Select
    jpf.job_id,
    jpf.job_title_short,
    cd.name AS company_name,
    jpf.job_posted_date,
    jpf.salary_year_avg,
    r.priorety_lvl,
    CURRENT_TIMESTAMP
   From data_jobs.job_postings_fact AS jpf
   LEFT JOIN data_jobs.company_dim AS cd ON cd.company_id = jpf.company_id
   INNER JOIN staging.priorety_roles AS r ON r.title = jpf.job_title_short;


ALTER Table priorety_roles_snapshot
RENAME Column salary_year_average to salary_year_avg;

SELECT
*
From main.priorety_roles_snapshot WHERE salary_year_avg IS NOT NULL LIMIt 100;
