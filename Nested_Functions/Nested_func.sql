--Put In ARRAY
SELECT
    DISTINCT(jpf.job_id) AS ID,
    ARRAY_AGG(sd.skills) AS Skill_Array
From job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd ON sjd.job_id = jpf.job_id
INNER JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id
GROUP BY jpf.job_id
ORDER BY jpf.job_id DESC;

--Struct
WITH T1 AS (
    SELECT
        jpf.job_id AS ID,
        ARRAY_AGG(sd.skills) AS Skills_Array
    FROM job_postings_fact AS jpf
    INNER JOIN skills_job_dim AS sjd ON sjd.job_id = jpf.job_id
    INNER JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id
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
    FROM job_postings_fact AS jpf
    INNER JOIN skills_job_dim AS sjd ON sjd.job_id = jpf.job_id
    INNER JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id
    GROUP BY jpf.job_id
)
SELECT
    MAP_PACK(t.ID, t.Skills_Array) AS Job_Skills_Map
FROM T1 AS t
ORDER BY t.ID DESC;


--JSON
