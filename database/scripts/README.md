# Table SQL Scripts

Each numbered SQL file defines one of the ten table sections in the group PDF. Files 01-03 extract existing DDL; files 04-10 are new, explicitly labelled drafts requiring group review.

## Execution order

Run on a clean development schema after reviewing the proposed choices. The numeric filenames follow the document order, not dependency order: Staff must exist before its dependent housekeeping/audit tables.

| Step | File | Prerequisite tables |
|---|---|---|
| 1 | [01_rooms.sql](01_rooms.sql) | None outside this table |
| 2 | [02_guests.sql](02_guests.sql) | None outside this table |
| 3 | [03_reservations.sql](03_reservations.sql) | hms_guests |
| 4 | [08_staff.sql](08_staff.sql) | None outside this table |
| 5 | [04_room_allocations.sql](04_room_allocations.sql) | hms_reservations, hms_rooms |
| 6 | [05_hotel_charges.sql](05_hotel_charges.sql) | hms_reservations |
| 7 | [06_seasonal_pricing.sql](06_seasonal_pricing.sql) | None outside this table |
| 8 | [07_payments.sql](07_payments.sql) | hms_reservations |
| 9 | [09_housekeeping_attendance.sql](09_housekeeping_attendance.sql) | hms_rooms, hms_staff |
| 10 | [10_audit_logs.sql](10_audit_logs.sql) | hms_staff |

Do not run a CREATE statement against an already existing table. These are source table definitions, not a complete re-runnable submission script. No cleanup or DROP statements are included, and no script was executed against Oracle in this task.

## Remaining work

- Confirm proposed data types, lengths, defaults, constraints, and ambiguous field meanings with owners.
- Resolve physical table count, lookup/reference coverage, and compatibility with the existing trigger targets.
- Prepare and verify the final cleanup/setup entry script and separate demonstration script.
- Supply member-authored meaningful data, sequences, indexes, triggers, PL/SQL units, and tests.
- Capture actual clean-run, second-run, data-count, constraint-violation, and programming-unit evidence.

Oracle syntax reference: [CREATE TABLE](https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/CREATE-TABLE.html).
