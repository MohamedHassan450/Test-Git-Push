--Put In ARRAY
CREATE OR Replace TEMP Table job_skills_array AS
SELECT
    DISTINCT(jpf.job_id) AS ID,
    jpf.job_title_short,
    ARRAY_AGG(sd.skills) AS Skill_Array
From data_jobs.job_postings_fact AS jpf
INNER JOIN data_jobs.skills_job_dim AS sjd ON sjd.job_id = jpf.job_id
INNER JOIN data_jobs.skills_dim AS sd ON sd.skill_id = sjd.skill_id
GROUP BY jpf.job_id,jpf.job_title_short
ORDER BY jpf.job_id DESC;

--Unnest Array
SELECT
    jsa.ID,
    jsa.job_title_short,
    UNNEST(jsa.Skill_Array)
From job_skills_array As jsa;


--Struct
WITH T1 AS (
    SELECT
        jpf.job_id AS ID,
        ARRAY_AGG(sd.skills) AS Skills_Array
    FROM data_jobs.job_postings_fact AS jpf
    INNER JOIN data_jobs.skills_job_dim AS sjd ON sjd.job_id = jpf.job_id
    INNER JOIN data_jobs.skills_dim AS sd ON sd.skill_id = sjd.skill_id
    GROUP BY jpf.job_id
)
SELECT
    STRUCT_PACK(I := t.ID, S := t.Skills_Array)
FROM T1 AS t
ORDER BY t.ID DESC;

--MAP
WITH T1 AS (
    SELECT
        jpf.job_id AS ID,
        ARRAY_AGG(sd.skills) AS Skills_Array
    FROM data_jobs.job_postings_fact AS jpf
    INNER JOIN data_jobs.skills_job_dim AS sjd ON sjd.job_id = jpf.job_id
    INNER JOIN data_jobs.skills_dim AS sd ON sd.skill_id = sjd.skill_id
    GROUP BY jpf.job_id
)
SELECT
    MAP_PACK(t.ID, t.Skills_Array) AS Job_Skills_Map
FROM T1 AS t
ORDER BY t.ID DESC;


--JSON
SELECT
    TO_JSON('{"skills : "Python","type" : "programming"}') AS skills_json;

--JSON To Struct
WITH raw_json AS (
    SELECT
    '[
        {"skills" : "Python","type" : "programming"},
        {"skills" : "SQL","type" : "programming"},
        {"skills" : "C++","type" : "programming"},
        {"skills" : "R","type" : "programming"}
    ]'::JSON AS skills_json
)
SELECT
    STRUCT_PACK (
        skills := json_extract_string(e.value,'$.skills'),
        skilltype := json_extract_string(e.value,'$.type')
    ) AS skills
From raw_json, json_each(skills_json) as e;