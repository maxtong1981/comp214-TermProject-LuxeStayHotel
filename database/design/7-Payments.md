# Payments

**Table:** `hms_payments`  
**Recorded owner:** Nevan  
**Source:** `COMP214_Term_Project_prof.Sarajlic-goup.pdf`, PDF pages 16-17.  
**Status:** AI-drafted implementation for group review; the PDF supplies fields but no CREATE TABLE statement for this table.

## Purpose

Automated billing, payment tracking, refunds, and financial reconciliation.

## Source and implementation

Field names, purposes, and status examples come from the PDF. Data types, lengths, nullability, defaults, key implementation, and constraints are proposed choices, not source SQL or verified group decisions.

[Table SQL](../scripts/07_payments.sql)

## Fields

| Field | Oracle type | Default and constraints | Description |
|---|---|---|---|
| `payment_id` | `NUMBER` | GENERATED ALWAYS AS IDENTITY PRIMARY KEY | Unique identifier for each payment transaction. |
| `reservation_reference` | `NUMBER` | NOT NULL REFERENCES hms_reservations(reservation_id) | Identifies the reservation associated with payment. |
| `payment_amount` | `NUMBER(10,2)` | NOT NULL CHECK (payment_amount >= 0) | Amount paid by the guest. |
| `payment_method` | `VARCHAR2(30)` | NOT NULL | Cash, Debit, Credit, etc. |
| `transaction_timestamp` | `TIMESTAMP` | DEFAULT SYSTIMESTAMP NOT NULL | Date and time of payment. |
| `payment_status` | `VARCHAR2(30)` | NOT NULL CHECK (payment_status IN ('Pending', 'Completed', 'Failed', 'Refunded')) | Pending, Completed, Failed, or Refunded. |
| `refund_amount` | `NUMBER(10,2)` | CHECK (refund_amount >= 0) | Amount returned to the guest. |
| `transaction_reference` | `VARCHAR2(100)` | Nullable; no explicit default or other column constraint. | Payment transaction reference number. |
| `payment_type` | `VARCHAR2(30)` | NOT NULL CHECK (payment_type IN ('Deposit', 'Partial Payment', 'Final Payment', 'Refund')) | Deposit, Partial Payment, Final Payment, or Refund. |
| `outstanding_balance` | `NUMBER(10,2)` | CHECK (outstanding_balance >= 0) | Remaining amount payable for the reservation. |
| `payment_verification_status` | `VARCHAR2(50)` | NOT NULL | Indicates whether payment has been verified. |
| `refund_reason` | `VARCHAR2(4000)` | Nullable; no explicit default or other column constraint. | Reason for refund, if applicable. |

For the seven newly drafted tables, all implementation choices in the type and constraint columns require group review.

## Relationships

- `hms_payments` references `hms_reservations.reservation_id`.

## Review notes

- The draft treats payment_amount and refund_amount as non-negative values; the group must confirm the refund accounting convention.
- outstanding_balance is stored as described in the source; maintaining its consistency is not implemented here.

## Handoff checklist

- [ ] Owner confirms the maintained source version and proposed choices, where applicable.
- [ ] Column list, constraints, and diagram are consistent.
- [ ] CREATE execution, applicable sample-data counts, and constraint tests are captured.
- [ ] Actual results and executing member are linked in the evidence index.

No Oracle execution or successful test result is claimed by this file.
