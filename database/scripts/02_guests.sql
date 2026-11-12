/*
Group: TBD (confirm the registered group name)
Members: Malachi, Nevan, Jazeel, Wei (confirm full names and student IDs)
File: 02_guests.sql
Table: hms_guests
Source: COMP214_Term_Project_prof.Sarajlic-goup.pdf, PDF pages 5-10; SQL version on pages 11-12
Recorded table owner: Malachi
Status: Existing DDL extracted from the HMS-prefixed version in the group PDF; not executed in this task.
Provenance: The linked CREATE TABLE statement is extracted without changing its SQL text. Only the file header is new.
Prerequisites: None outside this table
Scope: table DDL only; no data, cleanup, triggers, or execution proof.
*/

CREATE TABLE hms_guests ( 
    guest_id             NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    profile_names        VARCHAR2(150) NOT NULL, 
    passport_id          VARCHAR2(50) NOT NULL, 
    contact_information  VARCHAR2(500) NOT NULL, 
    vip_loyalty_status   VARCHAR2(30) NOT NULL, 
    loyalty_points       NUMBER DEFAULT 0 NOT NULL CHECK (loyalty_points >= 0), 
    membership_level     VARCHAR2(30) NOT NULL CHECK (membership_level IN ('Silver', 'Gold', 
'Platinum')), 
    guest_preferences    VARCHAR2(1000), 
    special_requirements VARCHAR2(1000), 
    total_stays          NUMBER DEFAULT 0 NOT NULL CHECK (total_stays >= 0), 
    guest_feedback_notes VARCHAR2(4000) 
);
