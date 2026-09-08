.read SQL_Data_Engineering_Project\Script1.sql

-- Create Database
CREATE DATABASE IF NOT EXISTS bismallah;

-- Create Schema
USE bismallah;
CREATE SCHEMA IF NOT EXISTS bismallah.staging;

-- Create Table
CREATE TABLE IF NOT EXISTS staging.job_title_name (
    ID INT PRIMARY KEY,
    Title VARCHAR(100)
);

-- Insert Initial Roles
INSERT INTO bismallah.staging.job_title_name (ID, Title)
VALUES
    (1, 'Data Analyst'),
    (2, 'Data Engineer'),
    (3, 'Senior Data Engineer');

-- Rename Table
ALTER TABLE bismallah.staging.job_title_name
RENAME TO Data_Roles;

-- Insert More Roles
INSERT INTO bismallah.staging.Data_Roles (ID, Title)
VALUES
    (4, 'AI Engineer'),
    (5, 'Deep Learning Engineer'),
    (6, 'NLP Engineer'),
    (7, 'Database Administrator'),
    (8, 'ETL Developer'),
    (9, 'Big Data Engineer'),
    (10, 'Cloud Data Engineer'),
    (11, 'AI Researcher'),
    (12, 'Statistician'),
    (13, 'Quantitative Analyst'),
    (14, 'Financial Data Analyst'),
    (15, 'Operations Analyst'),
    (16, 'Marketing Data Analyst'),
    (17, 'Healthcare Data Analyst'),
    (18, 'Risk Analyst'),
    (19, 'Fraud Analyst'),
    (20, 'Customer Insights Analyst'),
    (21, 'Product Analyst'),
    (22, 'Business Analyst'),
    (23, 'Systems Analyst'),
    (24, 'Data Architect'),
    (25, 'Solutions Architect'),
    (26, 'Data Governance Specialist'),
    (27, 'Data Quality Analyst'),
    (28, 'Data Visualization Specialist'),
    (29, 'Reporting Analyst'),
    (30, 'Research Analyst'),
    (31, 'Operations Research Scientist'),
    (32, 'Supply Chain Analyst'),
    (33, 'HR Data Analyst'),
    (34, 'Sales Analyst'),
    (35, 'Pricing Analyst'),
    (36, 'Energy Analyst'),
    (37, 'Policy Analyst'),
    (38, 'Social Media Analyst'),
    (39, 'SEO Analyst'),
    (40, 'Web Analytics Specialist'),
    (41, 'GIS Analyst'),
    (42, 'Economist'),
    (43, 'Actuary'),
    (44, 'Data Strategy Consultant'),
    (45, 'Analytics Manager'),
    (46, 'Data Engineering Manager'),
    (47, 'Head of Data Science'),
    (48, 'Chief Data Officer'),
    (49, 'Data Steward'),
    (50, 'Data Compliance Officer');

-- Check Results
SELECT * FROM bismallah.staging.Data_Roles;

.read SQL_Data_Engineering_Project\DM_DL.sql
