CREATE DATABASE IF NOT EXISTS Snap_shot;

USE Snap_shot;

CREATE SCHEMA IF NOT EXISTS Snap_shot.staging;

CREATE TABLE IF NOT EXISTS staging.priorety_roles (
    id INt Primary Key,
    title VARCHAR,
    priorety_lvl SMALLINT
);

INSERT INTO staging.priorety_roles (id, title, priorety_lvl)
VALUES
    (1, 'Data Analyst', 1),
    (2, 'Data Engineer', 2),
    (3, 'Data Analytics & Engineer', 3),
    (4, 'Software Engineer', 4)
ON CONFLICT (id) DO NOTHING;


SELECT * From staging.priorety_roles;

SELECT * From information_schema.tables;