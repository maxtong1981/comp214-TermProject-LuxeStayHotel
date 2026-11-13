/*
Group: TBD (confirm the registered group name)
Members: Malachi, Nevan, Jazeel, Wei (confirm full names and student IDs)
File: 05_hotel_charges.sql
Table: hms_hotel_charges
Source: COMP214_Term_Project_prof.Sarajlic-goup.pdf, PDF pages 15-16
Recorded table owner: Max
Status: Draft implementation; the table owner is to confirm the proposed field choices before submission.
Provenance: Field names, purposes, and status examples come from the PDF. Data types, lengths, nullability, defaults, key implementation, and constraints are proposed choices awaiting owner confirmation.
Prerequisites: hms_reservations
Scope: table DDL only; no data, cleanup, triggers, or execution proof.
*/

CREATE TABLE hms_hotel_charges (
    charge_id                          NUMBER           GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    reservation_reference              NUMBER           NOT NULL REFERENCES hms_reservations(reservation_id),
    charge_type                        VARCHAR2(50)     NOT NULL,
    transaction_timestamp              TIMESTAMP        DEFAULT SYSTIMESTAMP NOT NULL,
    quantity                           NUMBER(10)       NOT NULL CHECK (quantity > 0),
    applicable_discount                VARCHAR2(500),
    billing_status                     VARCHAR2(30)     NOT NULL CHECK (billing_status IN ('Pending', 'Billed', 'Paid')),
    amount_due                         NUMBER(10,2)     NOT NULL CHECK (amount_due >= 0),
    unit_price                         NUMBER(10,2)     NOT NULL CHECK (unit_price >= 0),
    service_location                   VARCHAR2(100),
    pos_transaction_reference          VARCHAR2(100),
    charge_description                 VARCHAR2(4000),
    CONSTRAINT uq_hms_charge_pos_txn UNIQUE (pos_transaction_reference)
);
