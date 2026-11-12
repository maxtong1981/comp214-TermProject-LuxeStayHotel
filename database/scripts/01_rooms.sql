/*
Group: TBD (confirm the registered group name)
Members: Malachi, Nevan, Jazeel, Wei (confirm full names and student IDs)
File: 01_rooms.sql
Table: hms_rooms
Source: COMP214_Term_Project_prof.Sarajlic-goup.pdf, PDF pages 1-5; SQL version on page 11
Recorded table owner: Malachi
Status: Existing DDL extracted from the HMS-prefixed version in the group PDF; not executed in this task.
Provenance: The linked CREATE TABLE statement is extracted without changing its SQL text. Only the file header is new.
Prerequisites: None outside this table
Scope: table DDL only; no data, cleanup, triggers, or execution proof.
*/

CREATE TABLE hms_rooms ( 
    room_id               NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    room_number           VARCHAR2(20) NOT NULL UNIQUE, 
    room_type             VARCHAR2(50) NOT NULL, 
    baseline_daily_rate   NUMBER(10,2) NOT NULL CHECK (baseline_daily_rate >= 0), 
    operational_status    VARCHAR2(30) NOT NULL CHECK (operational_status IN ('Clean', 
'Occupied', 'Maintenance', 'Unavailable')), 
    room_capacity         NUMBER NOT NULL CHECK (room_capacity > 0), 
    amenities             VARCHAR2(1000), 
    room_readiness        VARCHAR2(30) NOT NULL CHECK (room_readiness IN ('Ready', 'Awaiting 
Cleaning', 'Awaiting Inspection')), 
    last_maintenance_date DATE, 
    maintenance_notes     VARCHAR2(4000) 
);
