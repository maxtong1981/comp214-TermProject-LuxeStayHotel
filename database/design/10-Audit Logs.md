# Audit Logs

**Table:** `hms_audit_logs`  
**Recorded owner:** Jazeel  
**Source:** `COMP214_Term_Project_prof.Sarajlic-goup.pdf`, PDF pages 18-19.  
**Status:** AI-drafted implementation for group review; the PDF supplies fields but no CREATE TABLE statement for this table.

## Purpose

Database auditing, staff accountability, transaction history, and operational traceability.

## Source and implementation

Field names, purposes, and status examples come from the PDF. Data types, lengths, nullability, defaults, key implementation, and constraints are proposed choices, not source SQL or verified group decisions.

[Table SQL](../scripts/10_audit_logs.sql)

## Fields

| Field | Oracle type | Default and constraints | Description |
|---|---|---|---|
| `audit_id` | `NUMBER` | GENERATED ALWAYS AS IDENTITY PRIMARY KEY | Unique identifier for each audit record. |
| `staff_reference` | `NUMBER` | REFERENCES hms_staff(staff_id) | Identifies the employee associated with the operation. |
| `staff_name` | `VARCHAR2(150)` | Nullable; no explicit default or other column constraint. | Employee name at the time of the operation. |
| `staff_role` | `VARCHAR2(50)` | Nullable; no explicit default or other column constraint. | Employee role at the time of the operation. |
| `affected_entity` | `VARCHAR2(128)` | NOT NULL | Identifies the table or business entity modified. |
| `operation_type` | `VARCHAR2(10)` | NOT NULL CHECK (operation_type IN ('INSERT', 'UPDATE', 'DELETE')) | INSERT, UPDATE, or DELETE. |
| `affected_record_identifier` | `VARCHAR2(200)` | NOT NULL | Identifies the specific record modified. |
| `previous_value` | `VARCHAR2(4000)` | Nullable; no explicit default or other column constraint. | Value before the modification. |
| `new_value` | `VARCHAR2(4000)` | Nullable; no explicit default or other column constraint. | Value after the modification. |
| `operation_timestamp` | `TIMESTAMP` | DEFAULT SYSTIMESTAMP NOT NULL | Date and time when the operation occurred. |
| `database_user` | `VARCHAR2(128)` | DEFAULT USER NOT NULL | Database account responsible for the operation. |
| `transaction_description` | `VARCHAR2(4000)` | Nullable; no explicit default or other column constraint. | Description of the operation or change. |
| `transaction_reference` | `VARCHAR2(200)` | Nullable; no explicit default or other column constraint. | Related reservation, payment, or operational transaction reference. |
| `change_reason` | `VARCHAR2(4000)` | Nullable; no explicit default or other column constraint. | Reason for the modification, where applicable. |
| `audit_severity` | `VARCHAR2(20)` | NOT NULL CHECK (audit_severity IN ('Normal', 'Important', 'Critical')) | Normal, Important, or Critical classification of the operation. |
| `source_module` | `VARCHAR2(100)` | Nullable; no explicit default or other column constraint. | Application module responsible for the change. |

For the seven newly drafted tables, all implementation choices in the type and constraint columns require group review.

## Relationships

- `hms_audit_logs` references `hms_staff.staff_id`.

## Review notes

- staff_reference is nullable for system operations; staff snapshot text is retained separately.
- The supplied audit trigger writes to hms_room_status_log, not this table. Trigger integration remains unresolved and no trigger is rewritten here.
- This table alone does not meet the trigger-written audit requirement until a compatible trigger is supplied.

## Handoff checklist

- [ ] Owner confirms the maintained source version and proposed choices, where applicable.
- [ ] Column list, constraints, and diagram are consistent.
- [ ] CREATE execution, applicable sample-data counts, and constraint tests are captured.
- [ ] Actual results and executing member are linked in the evidence index.

No Oracle execution or successful test result is claimed by this file.
