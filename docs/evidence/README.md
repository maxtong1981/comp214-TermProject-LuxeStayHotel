# Execution Evidence Guide

Collect evidence when each object is tested. Keep the original full-resolution screenshot and the matching statement/output text together.

## Existing evidence in the group PDF

- Pages 26-30: ten images showing table SQL and creation output, including Rooms, Guests, Reservations, booking lines, and room-status log objects across versions.
- Page 31: audit-trigger compilation screenshot.
- Page 32: business-rule-trigger compilation screenshot.
- Page 33: ER diagram image, which belongs with design/report material rather than runtime test evidence.

These thirteen embedded images are existing work. Index them before requesting additional screenshots. Some are near headings for other object types; classify them by image content. Compilation and creation do not establish complete behavior/data coverage. See [the progress review](../progress-review.md).

## Capture requirements

- Show the full application window, connected user and SQL Developer session, statement, and result together.
- Include the session identity and timestamp required by sections 5.4 and 6.1 of the brief.
- Keep code and output visible in the same frame; separate code-only and result-only images do not satisfy the rule.
- Keep text readable when placed in the report.
- Under every screenshot in the report, paste the matching statement and output as selectable text.
- Caption each screenshot with the requirement, object name, and member who executed it.

## Minimum evidence by object type

| Type | Evidence to collect |
|---|---|
| Tables | CREATE execution and SELECT of populated rows, with row counts visible |
| Constraints | One deliberate violation per implemented constraint type and the returned ORA error |
| Sequence | Use during insertion and update, including resulting rows |
| Indexes | Creation and the search supported by each index |
| Triggers | Before, firing DML, and after screenshots for each trigger, showing its action or rejection |
| Procedures | One successful call and one handled failure per procedure |
| Functions | One correct return and one handled failure per function |
| Package | Spec/body compile without errors; package-qualified call to every exposed subprogram; use of public member |
| Website | Every interface screen, including a result from a procedure or function |

The demonstration script must also exercise success and failure paths for every programming unit, including packaged units. Retain evidence of private package members being exercised.

## File naming

Use `<object>_<scenario>_<member>.png` for screenshots and the same base name with `.txt` for statement/output text. For a trigger sequence, include `01_before`, `02_dml`, and `03_after` in the scenario. Add subfolders by object type only if needed.

## Evidence index

| Requirement | Object | Scenario | Executed by | Screenshot | Statement/output file | Reviewed by |
|---|---|---|---|---|---|---|
| TBD | TBD | TBD | TBD | TBD | TBD | TBD |

Source: assignment brief, sections 5.4 and 6, pages 5-6.
