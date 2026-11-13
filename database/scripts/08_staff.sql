/*
Group: TBD (confirm the registered group name)
Members: Malachi, Nevan, Jazeel, Wei (confirm full names and student IDs)
File: 08_staff.sql
Table: hms_staff
Source: COMP214_Term_Project_prof.Sarajlic-goup.pdf, PDF pages 17
Recorded table owner: Jazeel
Status: Draft implementation pending owner review; the PDF supplies fields but no CREATE TABLE statement for this table.
Provenance: Field names, purposes, and status examples come from the PDF. Data types, lengths, nullability, defaults, key implementation, and constraints are proposed choices, not source SQL or verified group decisions.
Prerequisites: None outside this table
Scope: table DDL only; no data, cleanup, triggers, or execution proof.
*/

CREATE TABLE hms_staff (
    staff_id                           NUMBER           GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_name                      VARCHAR2(150)    NOT NULL,
    contact_information                VARCHAR2(500),
    job_role                           VARCHAR2(50)     NOT NULL,
    department                         VARCHAR2(100)    NOT NULL,
    employment_status                  VARCHAR2(20)     NOT NULL CHECK (employment_status IN ('Active', 'Inactive')),
    hire_date                          DATE             NOT NULL,
    assigned_responsibilities          VARCHAR2(4000),
    supervisor_reference               NUMBER           REFERENCES hms_staff(staff_id),
    workload_capacity                  NUMBER(10)       CHECK (workload_capacity >= 0),
    employee_access_level              VARCHAR2(50)
);
