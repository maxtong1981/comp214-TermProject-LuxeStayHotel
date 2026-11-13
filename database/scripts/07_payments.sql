/*
Group: TBD (confirm the registered group name)
Members: Malachi, Nevan, Jazeel, Wei (confirm full names and student IDs)
File: 07_payments.sql
Table: hms_payments
Source: COMP214_Term_Project_prof.Sarajlic-goup.pdf, PDF pages 16-17
Recorded table owner: Nevan
Status: Draft implementation pending owner review; the PDF supplies fields but no CREATE TABLE statement for this table.
Provenance: Field names, purposes, and status examples come from the PDF. Data types, lengths, nullability, defaults, key implementation, and constraints are proposed choices, not source SQL or verified group decisions.
Prerequisites: hms_reservations
Scope: table DDL only; no data, cleanup, triggers, or execution proof.
*/

CREATE TABLE hms_payments (
    payment_id                         NUMBER           GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    reservation_reference              NUMBER           NOT NULL REFERENCES hms_reservations(reservation_id),
    payment_amount                     NUMBER(10,2)     NOT NULL CHECK (payment_amount >= 0),
    payment_method                     VARCHAR2(30)     NOT NULL,
    transaction_timestamp              TIMESTAMP        DEFAULT SYSTIMESTAMP NOT NULL,
    payment_status                     VARCHAR2(30)     NOT NULL CHECK (payment_status IN ('Pending', 'Completed', 'Failed', 'Refunded')),
    refund_amount                      NUMBER(10,2)     CHECK (refund_amount >= 0),
    transaction_reference              VARCHAR2(100),
    payment_type                       VARCHAR2(30)     NOT NULL CHECK (payment_type IN ('Deposit', 'Partial Payment', 'Final Payment', 'Refund')),
    outstanding_balance                NUMBER(10,2)     CHECK (outstanding_balance >= 0),
    payment_verification_status        VARCHAR2(50)     NOT NULL,
    refund_reason                      VARCHAR2(4000)
);
