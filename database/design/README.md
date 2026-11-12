# Table Design Index

These ten files follow the ten numbered table sections in the group PDF. Existing field descriptions are preserved and paired with per-table SQL files.

| No. | Design | SQL | Provenance | Recorded owner |
|---|---|---|---|---|
| 1 | [Rooms](1-Rooms.md) | [hms_rooms](../scripts/01_rooms.sql) | Existing source DDL | Malachi |
| 2 | [Guests](2-Guests.md) | [hms_guests](../scripts/02_guests.sql) | Existing source DDL | Malachi |
| 3 | [Reservations](3-Reservations.md) | [hms_reservations](../scripts/03_reservations.sql) | Existing source DDL | Malachi |
| 4 | [Room Allocations](4-Room%20Allocations.md) | [hms_room_allocations](../scripts/04_room_allocations.sql) | New draft; review required | Not specified in the group notes |
| 5 | [Hotel Charges](5-Hotel%20Charges.md) | [hms_hotel_charges](../scripts/05_hotel_charges.sql) | New draft; review required | Not specified in the group notes |
| 6 | [Seasonal Pricing](6-Seasonal%20Pricing.md) | [hms_seasonal_pricing](../scripts/06_seasonal_pricing.sql) | New draft; review required | Nevan |
| 7 | [Payments](7-Payments.md) | [hms_payments](../scripts/07_payments.sql) | New draft; review required | Nevan |
| 8 | [Staff](8-Staff.md) | [hms_staff](../scripts/08_staff.sql) | New draft; review required | Jazeel |
| 9 | [Housekeeping & Staff Attendance](9-Housekeeping%20and%20Staff%20Attendance.md) | [hms_housekeeping_attendance](../scripts/09_housekeeping_attendance.sql) | New draft; review required | Jazeel |
| 10 | [Audit Logs](10-Audit%20Logs.md) | [hms_audit_logs](../scripts/10_audit_logs.sql) | New draft; review required | Jazeel |

## Important integration decisions

- The first three SQL statements are extracted from the HMS-prefixed version on PDF pages 11-12. Seven other DDL statements are newly drafted from the field descriptions and are explicitly labelled.
- The existing diagram has twelve boxes, including booking lines and room-status log. This package covers only the ten numbered sections; it does not resolve which final physical objects the group includes.
- The existing audit trigger targets hms_room_status_log, while the main Audit Logs design is hms_audit_logs. No trigger is changed here.
- Lookup/reference-table coverage still needs confirmation. Identity primary keys do not replace the separately required sequence insert/update demonstration.
- Preserve the editable ER diagram and align it with the group-approved final version.

## Reference

Source: `COMP214_Term_Project_prof.Sarajlic-goup.pdf`, table sections on PDF pages 1-19, ER diagram and responsibilities on page 33.
