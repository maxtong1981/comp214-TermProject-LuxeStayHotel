/*
Group: TBD (confirm the registered group name)
Members: Malachi, Nevan, Jazeel, Wei (confirm full names and student IDs)
File: 09_housekeeping_attendance.sql
Table: hms_housekeeping_attendance
Source: COMP214_Term_Project_prof.Sarajlic-goup.pdf, PDF pages 18
Recorded table owner: Jazeel
Status: Draft implementation pending owner review; the PDF supplies fields but no CREATE TABLE statement for this table.
Provenance: Field names, purposes, and status examples come from the PDF. Data types, lengths, nullability, defaults, key implementation, and constraints are proposed choices, not source SQL or verified group decisions.
Prerequisites: hms_rooms, hms_staff
Scope: table DDL only; no data, cleanup, triggers, or execution proof.
*/

CREATE TABLE hms_housekeeping_attendance (
    housekeeping_id                    NUMBER           GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    room_reference                     NUMBER           NOT NULL REFERENCES hms_rooms(room_id),
    assigned_staff_reference           NUMBER           REFERENCES hms_staff(staff_id),
    cleaning_schedule                  TIMESTAMP        NOT NULL,
    cleaning_status                    VARCHAR2(30)     NOT NULL CHECK (cleaning_status IN ('Pending', 'In Progress', 'Completed')),
    completion_timestamp               TIMESTAMP,
    inspection_status                  VARCHAR2(20)     CHECK (inspection_status IN ('Pending', 'Passed', 'Failed')),
    room_readiness                     VARCHAR2(30)     CHECK (room_readiness IN ('Ready', 'Awaiting Cleaning', 'Awaiting Inspection')),
    employee_attendance                VARCHAR2(30)     CHECK (employee_attendance IN ('Present', 'Absent', 'Late', 'On Leave')),
    shift_assignment                   VARCHAR2(20)     CHECK (shift_assignment IN ('Morning', 'Evening', 'Night')),
    replacement_staff_reference        NUMBER           REFERENCES hms_staff(staff_id),
    workload_tracking                  VARCHAR2(500),
    attendance_date                    DATE,
    shift_start_time                   DATE,
    shift_end_time                     DATE,
    absence_reason                     VARCHAR2(4000),
    task_priority                      VARCHAR2(20)     NOT NULL CHECK (task_priority IN ('Normal', 'High', 'Urgent'))
);
