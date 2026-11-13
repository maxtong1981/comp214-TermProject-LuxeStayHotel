/*
Group: TBD (confirm the registered group name)
Members: Malachi, Nevan, Jazeel, Wei (confirm full names and student IDs)
File: 04_room_allocations.sql
Table: hms_room_allocations
Source: COMP214_Term_Project_prof.Sarajlic-goup.pdf, PDF pages 14-15
Recorded table owner: Max
Status: Draft implementation; the table owner is to confirm the proposed field choices before submission.
Provenance: Field names, purposes, and status examples come from the PDF. Data types, lengths, nullability, defaults, key implementation, and constraints are proposed choices awaiting owner confirmation.
Prerequisites: hms_reservations, hms_rooms
Scope: table DDL only; no data, cleanup, triggers, or execution proof.
*/

CREATE TABLE hms_room_allocations (
    allocation_id                      NUMBER           GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    reservation_reference              NUMBER           NOT NULL REFERENCES hms_reservations(reservation_id),
    room_reference                     NUMBER           NOT NULL REFERENCES hms_rooms(room_id),
    allocation_start_date              DATE             NOT NULL,
    allocation_end_date                DATE             NOT NULL,
    allocation_status                  VARCHAR2(30)     NOT NULL CHECK (allocation_status IN ('Active', 'Completed', 'Cancelled')),
    room_reassignment_information      VARCHAR2(4000),
    reassignment_reason                VARCHAR2(4000),
    previous_room_reference            NUMBER           REFERENCES hms_rooms(room_id),
    allocation_validation_status       VARCHAR2(50)     NOT NULL,
    CONSTRAINT chk_hms_alloc_dates CHECK (allocation_end_date > allocation_start_date)
);
