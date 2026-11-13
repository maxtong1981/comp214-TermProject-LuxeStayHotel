/*
Group: TBD (confirm the registered group name)
Members: Malachi, Nevan, Jazeel, Wei (confirm full names and student IDs)
File: 10_audit_logs.sql
Table: hms_audit_logs
Source: COMP214_Term_Project_prof.Sarajlic-goup.pdf, PDF pages 18-19
Recorded table owner: Jazeel
Status: Draft implementation pending owner review; the PDF supplies fields but no CREATE TABLE statement for this table.
Provenance: Field names, purposes, and status examples come from the PDF. Data types, lengths, nullability, defaults, key implementation, and constraints are proposed choices, not source SQL or verified group decisions.
Prerequisites: hms_staff
Scope: table DDL only; no data, cleanup, triggers, or execution proof.
*/

CREATE TABLE hms_audit_logs (
    audit_id                           NUMBER           GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    staff_reference                    NUMBER           REFERENCES hms_staff(staff_id),
    staff_name                         VARCHAR2(150),
    staff_role                         VARCHAR2(50),
    affected_entity                    VARCHAR2(128)    NOT NULL,
    operation_type                     VARCHAR2(10)     NOT NULL CHECK (operation_type IN ('INSERT', 'UPDATE', 'DELETE')),
    affected_record_identifier         VARCHAR2(200)    NOT NULL,
    previous_value                     VARCHAR2(4000),
    new_value                          VARCHAR2(4000),
    operation_timestamp                TIMESTAMP        DEFAULT SYSTIMESTAMP NOT NULL,
    database_user                      VARCHAR2(128)    DEFAULT USER NOT NULL,
    transaction_description            VARCHAR2(4000),
    transaction_reference              VARCHAR2(200),
    change_reason                      VARCHAR2(4000),
    audit_severity                     VARCHAR2(20)     NOT NULL CHECK (audit_severity IN ('Normal', 'Important', 'Critical')),
    source_module                      VARCHAR2(100)
);
