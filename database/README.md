# Database Work Guide

Oracle Database is required for LuxeStay. Members maintain agreed design material in `design/` and executable SQL in `scripts/`.

## Work plan

1. Preserve the ten existing table designs, ER diagram, SQL, explanations, and creation/compilation screenshots.
2. Gather maintained source files; reconcile the ER diagram's twelve table boxes with the 5-10 physical-table limit and unify names and contracts.
3. Continue existing implementation work and complete remaining objects, sample data, and tests.
4. Prepare an independent demonstration script with success and handled-failure paths.
5. Verify setup on a clean schema and on a second run.
6. Save actual execution evidence in [docs/evidence](../docs/evidence/README.md).

Use the [requirements checklist](../docs/requirements-checklist.md) for exact acceptance criteria. The group notes already show successful creation of several tables and compilation of both triggers. See [the per-table design index](design/README.md) for source locations and individual files. Remaining checks concern integration, behavior, data, and evidence coverage rather than restarting that work.

## Environment to confirm

| Item | Agreed value |
|---|---|
| Oracle version and environment | TBD |
| SQL Developer version | TBD |
| How each member obtains a development schema | TBD |
| Required connection settings, excluding passwords | TBD |
| Setup entry script | TBD |
| Demonstration script | TBD |
| Integration owner and reviewer | TBD |

Store real passwords and private connection details locally, outside Git.

## Script execution order

The brief specifies cleanup, tables and constraints, sequences, indexes, sample data, functions, procedures, packages, triggers, then demonstration. Members must ensure the final scripts satisfy actual dependencies and execute without manual intervention. Record the verified filenames below after implementation.

| Step | Contents | Actual file or entry point |
|---|---|---|
| 1 | Cleanup/drop section | TBD |
| 2 | Tables and constraints | TBD |
| 3 | Sequences | TBD |
| 4 | Indexes | TBD |
| 5 | Sample data | TBD |
| 6 | Functions | TBD |
| 7 | Procedures | TBD |
| 8 | Package specification and body | TBD |
| 9 | Triggers | TBD |
| 10 | Separate demonstration script | TBD |

Every SQL file needs a group/member/filename header. Final schema and demonstration files are prepared in [docs/submission](../docs/submission/README.md) using the required submission names.

## Verification log

| Check | Executed by | Date | Source commit | Evidence | Result |
|---|---|---|---|---|---|
| Clean schema setup | TBD | TBD | TBD | TBD | Pending |
| Second setup run | TBD | TBD | TBD | TBD | Pending |
| Complete demonstration | TBD | TBD | TBD | TBD | Pending |


## Per-table design and SQL files

- [Design index](design/README.md): ten individual design files following the numbered table sections in the PDF.
- [SQL index](scripts/README.md): ten individual CREATE TABLE files and dependency order.

Rooms, Guests, and Reservations SQL is extracted from the existing HMS-prefixed PDF version. Seven other SQL files are new AI-drafted conversions of the documented fields and require owner review. The group PDF already demonstrates table creation and trigger compilation; these newly saved files have not been executed against Oracle in this task. The final physical table inventory, reference-table coverage, and trigger integration remain to be reconciled.
