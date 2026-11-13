# Rooms

**Table:** `hms_rooms`  
**Recorded owner:** Malachi  
**Source:** `COMP214_Term_Project_prof.Sarajlic-goup.pdf`, PDF pages 1-5; SQL version on page 11.  
**Status:** Existing DDL extracted from the HMS-prefixed version in the group PDF; not executed in this task.

## Purpose

Room inventory, availability, maintenance, and readiness management.

## Source and implementation

The linked CREATE TABLE statement is extracted without changing its SQL text. Only the file header is new.

[Table SQL](../scripts/01_rooms.sql)

## Fields

| Field | Oracle type | Default and constraints | Description |
|---|---|---|---|
| `room_id` | `NUMBER` | GENERATED ALWAYS AS IDENTITY PRIMARY KEY | Unique identifier for each room. |
| `room_number` | `VARCHAR2(20)` | NOT NULL UNIQUE | Physical room number, such as 101 or 205. |
| `room_type` | `VARCHAR2(50)` | NOT NULL | Single, Double, Suite, Deluxe, etc. |
| `baseline_daily_rate` | `NUMBER(10,2)` | NOT NULL CHECK (baseline_daily_rate >= 0) | Standard nightly rate before seasonal pricing or discounts. |
| `operational_status` | `VARCHAR2(30)` | NOT NULL CHECK (operational_status IN ('Clean', 'Occupied', 'Maintenance', 'Unavailable')) | Clean, Occupied, Maintenance, or Unavailable. |
| `room_capacity` | `NUMBER` | NOT NULL CHECK (room_capacity > 0) | Maximum number of guests allowed. |
| `amenities` | `VARCHAR2(1000)` | Nullable; no explicit default or other column constraint. | Wi-Fi, balcony, bathtub, minibar, etc. |
| `room_readiness` | `VARCHAR2(30)` | NOT NULL CHECK (room_readiness IN ('Ready', 'Awaiting Cleaning', 'Awaiting Inspection')) | Ready, Awaiting Cleaning, or Awaiting Inspection. |
| `last_maintenance_date` | `DATE` | Nullable; no explicit default or other column constraint. | Date of the most recent maintenance activity. |
| `maintenance_notes` | `VARCHAR2(4000)` | Nullable; no explicit default or other column constraint. | Details about maintenance issues or repairs. |

Types and implemented constraints above describe the extracted SQL version.

## Relationships

No foreign key is declared in this CREATE TABLE statement.

## Review notes

- Uses the HMS-prefixed SQL version on page 11; earlier unprefixed versions remain in the PDF.
- Room type is text in the supplied DDL and is not a unique reference key.

## Decided changes (not yet applied to the SQL)

- **D2:** `room_type` is to be constrained to a fixed value list instead of free text, so that room types cannot drift apart between rows. The owner of this table supplies the values. Until the script is edited, the field table above still describes the current free-text definition.

## Handoff checklist

- [ ] Owner confirms the maintained source version and proposed choices, where applicable.
- [ ] Column list, constraints, and diagram are consistent.
- [ ] CREATE execution, applicable sample-data counts, and constraint tests are captured.
- [ ] Actual results and executing member are linked in the evidence index.

No Oracle execution or successful test result is claimed by this file.
