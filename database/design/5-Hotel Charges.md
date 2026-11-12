# Hotel Charges

**Table:** `hms_hotel_charges`  
**Recorded owner:** Not specified in the group notes  
**Source:** `COMP214_Term_Project_prof.Sarajlic-goup.pdf`, PDF pages 15-16.  
**Status:** AI-drafted implementation for group review; the PDF supplies fields but no CREATE TABLE statement for this table.

## Purpose

Integrated POS billing, additional expenses, and guest charge management.

## Source and implementation

Field names, purposes, and status examples come from the PDF. Data types, lengths, nullability, defaults, key implementation, and constraints are proposed choices, not source SQL or verified group decisions.

[Table SQL](../scripts/05_hotel_charges.sql)

## Fields

| Field | Oracle type | Default and constraints | Description |
|---|---|---|---|
| `charge_id` | `NUMBER` | GENERATED ALWAYS AS IDENTITY PRIMARY KEY | Unique identifier for each hotel charge. |
| `reservation_reference` | `NUMBER` | NOT NULL REFERENCES hms_reservations(reservation_id) | Identifies the reservation associated with the charge. |
| `charge_type` | `VARCHAR2(50)` | NOT NULL | Room Service, Spa, Mini-bar, Restaurant, Laundry, etc. |
| `transaction_timestamp` | `TIMESTAMP` | DEFAULT SYSTIMESTAMP NOT NULL | Date and time when the charge was recorded. |
| `quantity` | `NUMBER(10)` | NOT NULL CHECK (quantity > 0) | Number of units or services consumed. |
| `applicable_discount` | `VARCHAR2(500)` | Nullable; no explicit default or other column constraint. | Discount applied to the charge. |
| `billing_status` | `VARCHAR2(30)` | NOT NULL CHECK (billing_status IN ('Pending', 'Billed', 'Paid')) | Pending, Billed, or Paid. |
| `amount_due` | `NUMBER(10,2)` | NOT NULL CHECK (amount_due >= 0) | Final amount charged after adjustments. |
| `unit_price` | `NUMBER(10,2)` | NOT NULL CHECK (unit_price >= 0) | Price per unit of service or item. |
| `service_location` | `VARCHAR2(100)` | Nullable; no explicit default or other column constraint. | Restaurant, Spa, Room Service, or another department. |
| `pos_transaction_reference` | `VARCHAR2(100)` | Nullable; no explicit default or other column constraint. | Reference to the corresponding POS transaction. |
| `charge_description` | `VARCHAR2(4000)` | Nullable; no explicit default or other column constraint. | Description of the service or purchase. |

For the seven newly drafted tables, all implementation choices in the type and constraint columns require group review.

## Relationships

- `hms_hotel_charges` references `hms_reservations.reservation_id`.

## Review notes

- applicable_discount is stored as descriptive text because the source does not define amount versus percentage.
- The DDL stores charge values; it does not calculate amounts, discounts, or POS integration.

## Handoff checklist

- [ ] Owner confirms the maintained source version and proposed choices, where applicable.
- [ ] Column list, constraints, and diagram are consistent.
- [ ] CREATE execution, applicable sample-data counts, and constraint tests are captured.
- [ ] Actual results and executing member are linked in the evidence index.

No Oracle execution or successful test result is claimed by this file.
