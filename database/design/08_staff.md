# Staff

**Table:** `hms_staff`  
**Recorded owner:** Jazeel  
**Source:** `COMP214_Term_Project_prof.Sarajlic-goup.pdf`, PDF pages 17.  
**Status:** AI-drafted implementation for group review; the PDF supplies fields but no CREATE TABLE statement for this table.

## Purpose

Employee management, workforce organization, and accountability.

## Source and implementation

Field names, purposes, and status examples come from the PDF. Data types, lengths, nullability, defaults, key implementation, and constraints are proposed choices, not source SQL or verified group decisions.

[Table SQL](../scripts/08_staff.sql)

## Fields

| Field | Oracle type | Default and constraints | Description |
|---|---|---|---|
| `staff_id` | `NUMBER` | GENERATED ALWAYS AS IDENTITY PRIMARY KEY | Unique identifier for each employee. |
| `employee_name` | `VARCHAR2(150)` | NOT NULL | Employee full name. |
| `contact_information` | `VARCHAR2(500)` | Nullable; no explicit default or other column constraint. | Employee phone number and contact details. |
| `job_role` | `VARCHAR2(50)` | NOT NULL | Receptionist, Housekeeping, Manager, Maintenance, etc. |
| `department` | `VARCHAR2(100)` | NOT NULL | Department to which the employee belongs. |
| `employment_status` | `VARCHAR2(20)` | NOT NULL CHECK (employment_status IN ('Active', 'Inactive')) | Active or Inactive. |
| `hire_date` | `DATE` | NOT NULL | Date the employee joined the hotel. |
| `assigned_responsibilities` | `VARCHAR2(4000)` | Nullable; no explicit default or other column constraint. | Responsibilities associated with the role. |
| `supervisor_reference` | `NUMBER` | REFERENCES hms_staff(staff_id) | Identifies the employee reporting supervisor. |
| `workload_capacity` | `NUMBER(10)` | CHECK (workload_capacity >= 0) | Expected workload capacity of the employee. |
| `employee_access_level` | `VARCHAR2(50)` | Nullable; no explicit default or other column constraint. | Operational access level for the employee responsibilities. |

For the seven newly drafted tables, all implementation choices in the type and constraint columns require group review.

## Relationships

- `hms_staff` references `hms_staff.staff_id`.

## Review notes

- A nullable self-reference permits staff without a supervisor; the DDL does not detect longer reporting cycles.
- workload_capacity is provisionally a whole-number quantity; its unit and access-level values remain to be agreed.

## Handoff checklist

- [ ] Owner confirms the maintained source version and proposed choices, where applicable.
- [ ] Column list, constraints, and diagram are consistent.
- [ ] CREATE execution, applicable sample-data counts, and constraint tests are captured.
- [ ] Actual results and executing member are linked in the evidence index.

No Oracle execution or successful test result is claimed by this file.
