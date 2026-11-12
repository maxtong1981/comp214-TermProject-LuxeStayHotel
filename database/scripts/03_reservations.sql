/*
Group: TBD (confirm the registered group name)
Members: Malachi, Nevan, Jazeel, Wei (confirm full names and student IDs)
File: 03_reservations.sql
Table: hms_reservations
Source: COMP214_Term_Project_prof.Sarajlic-goup.pdf, PDF pages 10-14; SQL version on page 12
Recorded table owner: Malachi
Status: Existing DDL extracted from the HMS-prefixed version in the group PDF; not executed in this task.
Provenance: The linked CREATE TABLE statement is extracted without changing its SQL text. Only the file header is new.
Prerequisites: hms_guests
Scope: table DDL only; no data, cleanup, triggers, or execution proof.
*/

CREATE TABLE hms_reservations ( 
    reservation_id            NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    guest_reference           NUMBER NOT NULL REFERENCES hms_guests(guest_id), 
    check_in_date             DATE NOT NULL, 
    check_out_date            DATE NOT NULL, 
    reservation_status        VARCHAR2(30) NOT NULL CHECK (reservation_status IN ('Booked', 
'Confirmed', 'Active', 'Checked-Out', 'Cancelled')), 
    total_deposit_paid        NUMBER(10,2) NOT NULL CHECK (total_deposit_paid >= 0), 
    booking_source            VARCHAR2(50) NOT NULL, 
    cancellation_details      VARCHAR2(4000), 
    applicable_discounts      VARCHAR2(500), 
    modification_information   VARCHAR2(4000), 
    total_reservation_amount  NUMBER(10,2) NOT NULL CHECK (total_reservation_amount >= 0), 
    special_booking_requests  VARCHAR2(2000), 
    booking_validation_status VARCHAR2(50) NOT NULL, 
    CONSTRAINT chk_hms_res_dates CHECK (check_out_date > check_in_date) 
);
