# Reservations

**Table:** `hms_reservations`  
**Recorded owner:** Malachi  
**Source:** `COMP214_Term_Project_prof.Sarajlic-goup.pdf`, PDF pages 10-14; SQL version on page 12.  
**Status:** Existing DDL extracted from the HMS-prefixed version in the group PDF; not executed in this task.

## Purpose

Smart booking validation, reservation lifecycle, cancellations, and discounts.

## Source and implementation

The linked CREATE TABLE statement is extracted without changing its SQL text. Only the file header is new.

[Table SQL](../scripts/03_reservations.sql)

## Fields

| Field | Oracle type | Default and constraints | Description |
|---|---|---|---|
| `reservation_id` | `NUMBER` | GENERATED ALWAYS AS IDENTITY PRIMARY KEY | Unique identifier for each reservation. |
| `guest_reference` | `NUMBER` | NOT NULL REFERENCES hms_guests(guest_id) | Identifies the guest making the reservation. |
| `check_in_date` | `DATE` | NOT NULL | Expected arrival date. |
| `check_out_date` | `DATE` | NOT NULL | Expected departure date. |
| `reservation_status` | `VARCHAR2(30)` | NOT NULL CHECK (reservation_status IN ('Booked', 'Confirmed', 'Active', 'Checked-Out', 'Cancelled')) | Booked, Confirmed, Active, Checked-Out, or Cancelled. |
| `total_deposit_paid` | `NUMBER(10,2)` | NOT NULL CHECK (total_deposit_paid >= 0) | Amount paid in advance to secure the reservation. |
| `booking_source` | `VARCHAR2(50)` | NOT NULL | Website, Walk-in, Phone, etc. |
| `cancellation_details` | `VARCHAR2(4000)` | Nullable; no explicit default or other column constraint. | Cancellation reason and applicable cancellation conditions. |
| `applicable_discounts` | `VARCHAR2(500)` | Nullable; no explicit default or other column constraint. | VIP, promotional, or other discounts applied. |
| `modification_information` | `VARCHAR2(4000)` | Nullable; no explicit default or other column constraint. | Details of changes to reservation dates or booking details. |
| `total_reservation_amount` | `NUMBER(10,2)` | NOT NULL CHECK (total_reservation_amount >= 0) | Total room cost for the reservation. |
| `special_booking_requests` | `VARCHAR2(2000)` | Nullable; no explicit default or other column constraint. | Early check-in, late checkout, special arrangements, etc. |
| `booking_validation_status` | `VARCHAR2(50)` | NOT NULL | Indicates whether booking requirements have been validated. |

Types and implemented constraints above describe the extracted SQL version.

## Relationships

- `hms_reservations` references `hms_guests.guest_id`.

Table-level constraint: `chk_hms_res_dates` requires `check_out_date > check_in_date`.

## Review notes

- The HMS-prefixed reservations version is retained; earlier bookings versions are not combined with it.

## Handoff checklist

- [ ] Owner confirms the maintained source version and proposed choices, where applicable.
- [ ] Column list, constraints, and diagram are consistent.
- [ ] CREATE execution, applicable sample-data counts, and constraint tests are captured.
- [ ] Actual results and executing member are linked in the evidence index.

No Oracle execution or successful test result is claimed by this file.
