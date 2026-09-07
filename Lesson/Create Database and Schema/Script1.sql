-- .read SQL_Data_Engineering_Project\Lesson\Create Database and Schema\Script1.sql

--Create Datbase 
CREATE DATABASE IF NOT EXISTS bismallah;

--Create Schema
USE bismallah;

CREATE SCHEMA IF NOT EXISTS bismallah.staging;

--Check Schema
SELECT 
*
From information_schema.schemata;

--Create Table
CREATE TABLE IF NOT EXISTS staging.job_title_name 
(
    ID INT Primary Key,
    Tilte VARCHAR
);

--Check Table
SELECT 
*
From information_schema.tables
WHERE table_catalog = 'bismallah';

INSERT INTO bismallah.staging.job_title_name(ID,Tilte)
Values 
        (1,'Data Analyst'),
        (2,'Data Engineer'),
        (3,'Senior Data Engineer');

ALTER Table bismallah.staging.job_title_name
ADD Column Role_Salary INT;

UPDATE bismallah.staging.job_title_name
SET Role_Salary = 150000
WHERE ID = 2;

ALTER Table bismallah.staging.job_title_name
Rename To Data_Roles;

SELECT * From bismallah.staging.Data_Roles;
