# Room Allocations

**Table:** `hms_room_allocations`  
**Recorded owner:** Not specified in the group notes  
**Source:** `COMP214_Term_Project_prof.Sarajlic-goup.pdf`, PDF pages 14-15.  
**Status:** AI-drafted implementation for group review; the PDF supplies fields but no CREATE TABLE statement for this table.

## Purpose

Room assignment, availability control, and double-booking prevention.

## Source and implementation

Field names, purposes, and status examples come from the PDF. Data types, lengths, nullability, defaults, key implementation, and constraints are proposed choices, not source SQL or verified group decisions.

[Table SQL](../scripts/04_room_allocations.sql)

## Fields

| Field | Oracle type | Default and constraints | Description |
|---|---|---|---|
| `allocation_id` | `NUMBER` | GENERATED ALWAYS AS IDENTITY PRIMARY KEY | Unique identifier for each room allocation. |
| `reservation_reference` | `NUMBER` | NOT NULL REFERENCES hms_reservations(reservation_id) | Identifies the associated reservation. |
| `room_reference` | `NUMBER` | NOT NULL REFERENCES hms_rooms(room_id) | Identifies the assigned room. |
| `allocation_start_date` | `DATE` | NOT NULL | Date the room assignment begins. |
| `allocation_end_date` | `DATE` | NOT NULL | Date the room assignment ends. |
| `allocation_status` | `VARCHAR2(30)` | NOT NULL CHECK (allocation_status IN ('Active', 'Completed', 'Cancelled')) | Active, Completed, or Cancelled. |
| `room_reassignment_information` | `VARCHAR2(4000)` | Nullable; no explicit default or other column constraint. | Details of room changes during a stay. |
| `reassignment_reason` | `VARCHAR2(4000)` | Nullable; no explicit default or other column constraint. | Reason for changing the assigned room. |
| `previous_room_reference` | `NUMBER` | REFERENCES hms_rooms(room_id) | Previously assigned room, if reassigned. |

For the seven newly drafted tables, all implementation choices in the type and constraint columns require group review.

## Relationships

- `hms_room_allocations` references `hms_reservations.reservation_id`.
- `hms_room_allocations` references `hms_rooms.room_id`.
- `hms_room_allocations` references `hms_rooms.room_id`.

Proposed table-level constraint: `chk_hms_alloc_dates` requires `allocation_end_date > allocation_start_date`.

## Review notes

- Date order is checked; cross-row overlap prevention is not implemented by this table DDL.
- Required reference/date/status fields and optional reassignment details are proposed choices.

## Decided changes

- **D6 — applied to the script.** `allocation_validation_status` was dropped: it duplicated `allocation_status` and its value list was never defined. No column now records whether an availability check ran; the trigger in D4 is the only mechanism.
- **D4 — pending.** Cross-row overlap for the same room is to be blocked by a business-rule trigger, since no constraint can compare rows. Until it exists, double booking is only prevented by the application.

## Handoff checklist

- [ ] Owner confirms the maintained source version and proposed choices, where applicable.
- [ ] Column list, constraints, and diagram are consistent.
- [ ] CREATE execution, applicable sample-data counts, and constraint tests are captured.
- [ ] Actual results and executing member are linked in the evidence index.

No Oracle execution or successful test result is claimed by this file.
