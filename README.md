# LuxeStay — COMP214 Term Project

This repository contains the database design, SQL scripts, website source code, and supporting documents for our four-person group project.
## Deliverables

| # | Deliverable | Filename pattern | Status |
|---|---|---|---|
| 1 | Schema and objects script | `GroupName_ProjectName_TermProject_Schema.sql` | |
| 2 | Demonstration script | `GroupName_ProjectName_TermProject_Demo.sql` | |
| 3 | Project document (Word or PDF) | `GroupName_ProjectName_TermProject_Report.docx` | |
| 4 | Front-end source code, zipped (for the bonus) | `GroupName_ProjectName_TermProject_FrontEnd.zip` | |

## Table Inventory — Design, Script, Demo, Owner

Status of the ten numbered tables currently in this repository. "Not created" means the artefact does not exist in the repo yet; it is not an assessment of member work done elsewhere.

| No. | Database table | Design | Create script | Demo script | Owner |
|---|---|---|---|---|---|
| 1 | `hms_rooms` | [01_rooms.md](database/design/01_rooms.md) | [01_rooms.sql](database/scripts/01_rooms.sql) | Not created | Malachi |
| 2 | `hms_guests` | [02_guests.md](database/design/02_guests.md) | [02_guests.sql](database/scripts/02_guests.sql) | Not created | Malachi |
| 3 | `hms_reservations` | [03_reservations.md](database/design/03_reservations.md) | [03_reservations.sql](database/scripts/03_reservations.sql) | Not created | Malachi |
| 4 | `hms_room_allocations` | [04_room_allocations.md](database/design/04_room_allocations.md) | [04_room_allocations.sql](database/scripts/04_room_allocations.sql) | Not created | Max |
| 5 | `hms_hotel_charges` | [05_hotel_charges.md](database/design/05_hotel_charges.md) | [05_hotel_charges.sql](database/scripts/05_hotel_charges.sql) | Not created | Max |
| 6 | `hms_seasonal_pricing` | [06_seasonal_pricing.md](database/design/06_seasonal_pricing.md) | [06_seasonal_pricing.sql](database/scripts/06_seasonal_pricing.sql) | Not created | Nevan |
| 7 | `hms_payments` | [07_payments.md](database/design/07_payments.md) | [07_payments.sql](database/scripts/07_payments.sql) | Not created | Nevan |
| 8 | `hms_staff` | [08_staff.md](database/design/08_staff.md) | [08_staff.sql](database/scripts/08_staff.sql) | Not created | Jazeel |
| 9 | `hms_housekeeping_attendance` | [09_housekeeping_attendance.md](database/design/09_housekeeping_attendance.md) | [09_housekeeping_attendance.sql](database/scripts/09_housekeeping_attendance.sql) | Not created | Jazeel |
| 10 | `hms_audit_logs` | [10_audit_logs.md](database/design/10_audit_logs.md) | [10_audit_logs.sql](database/scripts/10_audit_logs.sql) | Not created | Jazeel |


## Programming Units — Ownership and Status

Covers brief sections 4.2-4.7 (10 of the project's 15 marks). Row order follows section 4; script numbering follows the execution order required by section 5.3, where functions precede procedures, which precede the package, which precedes triggers.

| Task | Detail | Owner | Script | Status |
|---|---|---|---|---|
| Sequence | At least one. Must be used to insert sample data **and** used to update table(s). Identity columns do not satisfy this. | Nevan | `11_sequences.sql` | Not started |
| Index 1 | On a column the application actually searches; the report must name the search this index supports. | TBC | `12_indexes.sql` | Not started |
| Index 2 | On a different searched column. Both indexes must back a real query and not duplicate each other. | TBC | `12_indexes.sql` | Not started |
| Trigger 1 | Audit/logging trigger: writes to the audit table when a row is inserted, updated or deleted. | Malachi | `16_triggers.sql` | Source in group PDF; not in repo |
| Trigger 2 | Business-rule trigger: enforces a rule a constraint cannot express. Must not do the same kind of work as Trigger 1. | Malachi | `16_triggers.sql` | Source in group PDF; not in repo |
| Procedure 1 | Uses an explicit cursor and processes multiple rows; named exception section; business errors raised with `RAISE_APPLICATION_ERROR`. | Nevan / Jazeel, split TBC | `14_procedures.sql` | Not started |
| Procedure 2 | Validates input before applying DML; named exception section relevant to the operation. `WHEN OTHERS THEN NULL` scores zero. | Nevan / Jazeel, split TBC | `14_procedures.sql` | Not started |
| Function 1 | Returns a scalar derived from a query (count, total, average or status); every execution path reaches `RETURN`; has an exception section. | Nevan / Jazeel, split TBC | `13_functions.sql` | Not started |
| Function 2 | Called from the group's own code (trigger, procedure, view or check-style validation); every path reaches `RETURN`; has an exception section. | Nevan / Jazeel, split TBC | `13_functions.sql` | Not started |
| Package | Spec and body. Exposes 2 procedures and 2 functions. Spec declares a public variable or constant; body declares a private variable or subprogram that is actually used at run time; use `%TYPE` / `%ROWTYPE`; packaged subprograms need the same exception handling. | TBC | `15_package.sql` | Not started |

## Directory Structure

```text
.
├── database/
│   ├── design/
│   ├── scripts/
│   └── README.md
├── docs/
│   ├── evidence/
│   ├── submission/
│   └── contributions.md
├── website/
│   └── README.md
├── LICENSE
└── README.md
```

## Where to Put Files

| Location | Purpose | What to Store |
|---|---|---|
| `database/design/` | Database design documentation | ER diagram source files and exported images, table and column descriptions, constraints, business rules, and programming unit descriptions |
| `database/scripts/` | Executable database files | Setup and cleanup scripts, table definitions, sample data, sequences, indexes, functions, procedures, packages, triggers, and demonstration scripts |
| `database/README.md` | Database setup instructions | Required environment, connection setup without passwords, script execution order, and instructions for running demonstrations |
| `docs/evidence/` | Evidence of execution | Screenshots and matching text output from database tests and website demonstrations |
| `docs/submission/` | Final submission files | Final schema script, demonstration script, report, and website source archive, using the filenames required by the assignment |
| `docs/contributions.md` | Contribution record | Each member’s completed work, including implementation, testing, documentation, and demonstrations |
| `website/` | Website implementation | Website source code, assets, and configuration examples |
| `website/README.md` | Website setup instructions | Required tools, installation steps, local configuration, and instructions for starting the website |
| `README.md` | Main project guide | Project overview, directory guide, and links to important resources |
| `LICENSE` | Repository licensing terms | The license applicable to this repository |

## Working Guidelines

### Database Design and Scripts

- Keep design explanations in `database/design/` and executable SQL in `database/scripts/`.
- Update the relevant design documents whenever the database structure changes.
- Save both the editable ER diagram and an exported image for easy viewing.
- Document the script execution order in `database/README.md`.
- Verify that the setup scripts work on a clean schema and can be run again.

### Execution Evidence

- Store screenshots and their matching text output together in `docs/evidence/`.
- Use descriptive filenames, such as `procedure-name_success.png` and `procedure-name_success.txt`.
- Follow the assignment’s screenshot requirements.
- Record the requirement demonstrated, object name, and member who performed the demonstration.

### Documentation and Contributions

- Update `docs/contributions.md` as work is completed.
- Describe actual contributions clearly, including testing and review work.
- If the report is edited in a shared online document, add its link below and use that document as the single working copy.

### Final Submission

- Use `docs/submission/` only for files prepared for submission.
- Continue development in the original folders, then refresh the submission files after verification.
- Check filenames and required deliverables against the assignment instructions before submitting.

### Shared Repository

- Pull the latest changes before starting work.
- Keep commits focused and use clear commit messages.
- Ask another member to review changes before merging them into `main`.
- Do not commit passwords, real credentials, local environment files, or generated dependency folders.

## Shared Resources

- **Working report:** To be added
- **Task board:** To be added
- **Submission deadline:** Confirm on the LMS
- **Presentation date:** Confirm on the LMS

## Planning Documents

- [Existing work and remaining verification](docs/progress-review.md)

- [Planning index](docs/README.md)
- [Project scope and milestones](docs/project-plan.md)
- [Task tracker](docs/tasks.md)
- [Assignment requirements checklist](docs/requirements-checklist.md)
- [Work preferences and verified contributions](docs/contributions.md)
- [Database work guide](database/README.md)
- [Database design work plan](database/design/README.md)
- [SQL script guide](database/scripts/README.md)
- [Website work guide](website/README.md)
- [Execution evidence guide](docs/evidence/README.md)
- [Final submission guide](docs/submission/README.md)
