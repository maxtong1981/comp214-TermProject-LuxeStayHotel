# Seasonal Pricing

**Table:** `hms_seasonal_pricing`  
**Recorded owner:** Nevan  
**Source:** `COMP214_Term_Project_prof.Sarajlic-goup.pdf`, PDF pages 16.  
**Status:** Draft implementation pending owner review; the PDF supplies fields but no CREATE TABLE statement for this table.

## Purpose

Dynamic pricing, seasonal adjustments, and hotel revenue optimization.

## Source and implementation

Field names, purposes, and status examples come from the PDF. Data types, lengths, nullability, defaults, key implementation, and constraints are proposed choices, not source SQL or verified group decisions.

[Table SQL](../scripts/06_seasonal_pricing.sql)

## Fields

| Field | Oracle type | Default and constraints | Description |
|---|---|---|---|
| `pricing_id` | `NUMBER` | GENERATED ALWAYS AS IDENTITY PRIMARY KEY | Unique identifier for each pricing rule. |
| `room_type_reference` | `VARCHAR2(50)` | NOT NULL | Identifies the room category to which the rule applies. |
| `season_name` | `VARCHAR2(50)` | NOT NULL | Peak, Off-Season, Holiday, etc. |
| `pricing_period` | `VARCHAR2(200)` | NOT NULL | Dates during which the pricing rule applies. |
| `seasonal_rate` | `NUMBER(10,2)` | NOT NULL CHECK (seasonal_rate >= 0) | Nightly rate applicable during the season. |
| `weekend_surcharge` | `NUMBER(10,2)` | CHECK (weekend_surcharge >= 0) | Additional amount charged for weekend stays. |
| `promotional_rate` | `NUMBER(10,2)` | CHECK (promotional_rate >= 0) | Special discounted rate during promotions. |
| `pricing_validity` | `VARCHAR2(20)` | NOT NULL CHECK (pricing_validity IN ('Active', 'Inactive')) | Active or Inactive. |
| `holiday_surcharge` | `NUMBER(10,2)` | CHECK (holiday_surcharge >= 0) | Additional rate applicable during holidays. |
| `minimum_stay_requirement` | `NUMBER(5)` | NOT NULL CHECK (minimum_stay_requirement > 0) | Minimum number of nights required for a pricing offer. |
| `pricing_priority` | `NUMBER(5)` | NOT NULL | Priority used when multiple pricing rules apply. |

For the seven newly drafted tables, all implementation choices in the type and constraint columns require group review.

## Relationships

No foreign key is declared in this CREATE TABLE statement.

## Review notes

- pricing_period remains one text field to preserve the source field list; a machine-readable date range is unresolved.
- room_type_reference is text matching the existing room_type representation. No foreign key is invented to the non-unique hms_rooms.room_type column.
- Rate selection, priority direction, date overlap, and category validation need an agreed business implementation.

## Handoff checklist

- [ ] Owner confirms the maintained source version and proposed choices, where applicable.
- [ ] Column list, constraints, and diagram are consistent.
- [ ] CREATE execution, applicable sample-data counts, and constraint tests are captured.
- [ ] Actual results and executing member are linked in the evidence index.

No Oracle execution or successful test result is claimed by this file.
