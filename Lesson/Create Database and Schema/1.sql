duckdb md:datajobs;

DROP DATABASE job_mart;

CREATE DATABASE IF NOT EXISTS bismallah;

USE bismallah

CREATE SCHEMA IF NOT EXISTS bismallah.staging;

CREATE TABLE staging.job_title_name 
(
    ID INT,
    Tilte VARCHAR
)