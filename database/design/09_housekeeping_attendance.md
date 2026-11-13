# Housekeeping & Staff Attendance

**Table:** `hms_housekeeping_attendance`  
**Recorded owner:** Jazeel  
**Source:** `COMP214_Term_Project_prof.Sarajlic-goup.pdf`, PDF pages 18.  
**Status:** Draft implementation pending owner review; the PDF supplies fields but no CREATE TABLE statement for this table.

## Purpose

Housekeeping automation, room operations, attendance, shift scheduling, and workforce coordination.

## Source and implementation

Field names, purposes, and status examples come from the PDF. Data types, lengths, nullability, defaults, key implementation, and constraints are proposed choices, not source SQL or verified group decisions.

[Table SQL](../scripts/09_housekeeping_attendance.sql)

## Fields

| Field | Oracle type | Default and constraints | Description |
|---|---|---|---|
| `housekeeping_id` | `NUMBER` | GENERATED ALWAYS AS IDENTITY PRIMARY KEY | Unique identifier for each housekeeping task. |
| `room_reference` | `NUMBER` | NOT NULL REFERENCES hms_rooms(room_id) | Identifies the room associated with the task. |
| `assigned_staff_reference` | `NUMBER` | REFERENCES hms_staff(staff_id) | Identifies the employee assigned to the task. |
| `cleaning_schedule` | `TIMESTAMP` | NOT NULL | Scheduled date and time for cleaning. |
| `cleaning_status` | `VARCHAR2(30)` | NOT NULL CHECK (cleaning_status IN ('Pending', 'In Progress', 'Completed')) | Pending, In Progress, or Completed. |
| `completion_timestamp` | `TIMESTAMP` | Nullable; no explicit default or other column constraint. | Date and time when cleaning was completed. |
| `inspection_status` | `VARCHAR2(20)` | CHECK (inspection_status IN ('Pending', 'Passed', 'Failed')) | Pending, Passed, or Failed. |
| `room_readiness` | `VARCHAR2(30)` | CHECK (room_readiness IN ('Ready', 'Awaiting Cleaning', 'Awaiting Inspection')) | Ready, Awaiting Cleaning, or Awaiting Inspection. |
| `employee_attendance` | `VARCHAR2(30)` | CHECK (employee_attendance IN ('Present', 'Absent', 'Late', 'On Leave')) | Present, Absent, Late, or On Leave. |
| `shift_assignment` | `VARCHAR2(20)` | CHECK (shift_assignment IN ('Morning', 'Evening', 'Night')) | Morning, Evening, or Night. |
| `replacement_staff_reference` | `NUMBER` | REFERENCES hms_staff(staff_id) | Identifies substitute employee assigned when needed. |
| `workload_tracking` | `VARCHAR2(500)` | Nullable; no explicit default or other column constraint. | Number or status of assigned and completed tasks. |
| `attendance_date` | `DATE` | Nullable; no explicit default or other column constraint. | Date for which attendance is recorded. |
| `shift_start_time` | `DATE` | Nullable; no explicit default or other column constraint. | Scheduled employee shift start time. |
| `shift_end_time` | `DATE` | Nullable; no explicit default or other column constraint. | Scheduled employee shift end time. |
| `absence_reason` | `VARCHAR2(4000)` | Nullable; no explicit default or other column constraint. | Reason for absence, when applicable. |
| `task_priority` | `VARCHAR2(20)` | NOT NULL CHECK (task_priority IN ('Normal', 'High', 'Urgent')) | Normal, High, or Urgent housekeeping priority. |

For the seven newly drafted tables, all implementation choices in the type and constraint columns require group review.

## Relationships

- `hms_housekeeping_attendance` references `hms_rooms.room_id`.
- `hms_housekeeping_attendance` references `hms_staff.staff_id`.
- `hms_housekeeping_attendance` references `hms_staff.staff_id`.

## Review notes

- This draft preserves the combined task/attendance structure from the source.
- Oracle DATE stores both date and time; shift values need actual dates, especially for overnight shifts.
- Assigned staff is nullable to allow an unassigned task; attendance-only records and room nullability need group confirmation.
- workload_tracking is text because the source allows either a number or a status.

## Handoff checklist

- [ ] Owner confirms the maintained source version and proposed choices, where applicable.
- [ ] Column list, constraints, and diagram are consistent.
- [ ] CREATE execution, applicable sample-data counts, and constraint tests are captured.
- [ ] Actual results and executing member are linked in the evidence index.

No Oracle execution or successful test result is claimed by this file.
