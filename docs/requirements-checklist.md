# Assignment Requirements Checklist

Use this checklist to review deliverables against the assignment brief. An unchecked item means it has not been verified here; it does not establish whether a draft already exists. Add actual source and evidence links before checking an item.

## Existing progress baseline

- [x] Ten numbered table designs have purposes and field descriptions (group PDF pp1-19).
- [x] Table SQL and explanations are present for part of the schema (pp2-14).
- [x] Table-creation results are shown in screenshots (pp26-30).
- [x] Both trigger sources and explanations are present (pp20-24).
- [x] Both triggers have compilation screenshots (pp31-32).
- [x] An ER diagram with fields and relationships exists (p33 image).
- [x] Member responsibilities are recorded (p33).

These checked baseline items credit existing work. The detailed checklist below tracks full acceptance of each requirement, not whether work has started. Reconcile ten numbered table sections with twelve ER boxes before checking the physical table limit. See [the progress review](progress-review.md).

## Tables and data

- [ ] **4.1:** Total table count is between 5 and 10, including reference and audit/log tables.
- [ ] At least one lookup/reference table is included.
- [ ] At least one audit/log table is written to by a trigger.
- [ ] Every table has a primary key; foreign keys represent relationships.
- [ ] NOT NULL, UNIQUE, and CHECK constraints are applied where required by business rules.
- [ ] Each data table has at least 10 INSERT statements; each lookup/reference table has at least 5 rows.
- [ ] Sample values are meaningful for the domain.

## Sequences and indexes

- [ ] **4.2:** At least one sequence is created and used in sample data insertion.
- [ ] The sequence is also demonstrated in an update, with resulting rows visible.
- [ ] **4.3:** At least two indexes are created on columns actually searched by the application.
- [ ] Each index has a demonstrated search query and a report explanation of the search it supports.

## Triggers

- [ ] **4.4:** At least two triggers serve different purposes.
- [ ] One trigger writes audit/log information when a row is inserted, updated, or deleted.
- [ ] Another enforces a business rule that an ordinary constraint cannot express.
- [ ] Trigger demonstrations include success and failure behavior as required by the demonstration script.
- [ ] Each trigger has before, firing DML, and after evidence.

## Procedures and functions

- [ ] **4.5:** At least two procedures are implemented with named, relevant exception handling.
- [ ] At least one procedure uses an explicit cursor and processes multiple rows.
- [ ] At least one procedure validates inputs or conditions before performing DML.
- [ ] Business errors use RAISE_APPLICATION_ERROR with understandable messages.
- [ ] No required exception handler silently swallows errors with WHEN OTHERS THEN NULL.
- [ ] **4.6:** At least two functions have exception sections and return on every execution path.
- [ ] At least one function returns a scalar derived from a query.
- [ ] At least one function is called from elsewhere in the group's own code.
- [ ] Each procedure and function has successful and handled-failure demonstrations.

## Package

- [ ] **4.7:** At least one package includes both specification and body.
- [ ] It exposes at least two procedures and two functions; these may reuse the previously implemented units.
- [ ] Its specification declares a public variable or constant.
- [ ] Its body contains a private variable or subprogram that is actually exercised during execution/testing.
- [ ] %TYPE and/or %ROWTYPE is used where variables mirror columns or rows.
- [ ] Packaged subprograms satisfy the corresponding exception-handling requirements.
- [ ] Spec and body compile without errors; each packaged subprogram is called through the package name and the public member is used.

## Scripts and demonstrations

- [ ] **5:** Setup runs on a clean schema without manual intervention.
- [ ] Cleanup is provided and setup runs a second time without errors.
- [ ] Every script starts with group, member, and filename information.
- [ ] Objects are ordered to execute cleanly, following the brief's specified sequence and actual dependencies.
- [ ] A separate demonstration script exercises every programming unit, including success and failure paths.
- [ ] The demonstration script begins with the output-enabling and user/date statements specified in section 5.4.

## Evidence

- [ ] **6:** Screenshots show the full application window, connected user/session, timestamp, statement, and result together.
- [ ] Screenshots are legible at the size used in the report.
- [ ] Each screenshot has matching statement/output as selectable text underneath in the report.
- [ ] Each caption identifies requirement, object, and executing member.
- [ ] Tables: successful CREATE execution and populated rows with visible row counts.
- [ ] Constraints: a deliberate violation and returned ORA error for every implemented constraint type.
- [ ] Sequence: insert and update uses with resulting rows.
- [ ] Indexes: CREATE INDEX execution and the search supported by each index.
- [ ] Triggers: three screenshots per trigger, before/DML/after, showing the log action or blocked action.
- [ ] Procedures and functions: success and handled-failure evidence for each.
- [ ] Package: compilation, calls to each exposed subprogram, and public member use.
- [ ] Website: each interface screen, including a result returned by a procedure or function.

## Website and report

- [ ] The wireframe matches the schema and implemented interface.
- [ ] The website connects to Oracle and calls the group's PL/SQL programming units; raw table SELECT/INSERT calls alone do not satisfy the interface requirement.
- [ ] **7:** The report follows the required section order in the [submission guide](submission/README.md).
- [ ] Member-written descriptions explain each programming unit's purpose, handled exceptions, and callers.
- [ ] ER diagram shows all tables, keys, and relationships and is legible at full page size.
- [ ] Contribution statement is accurate and initialled by all members.
- [ ] Original-work declaration is signed by all members.

## Presentation and submission

- [ ] **8:** All members attend and speak; every member can execute and explain other members' work.
- [ ] Group registration is completed by W12; exact date checked on the LMS.
- [ ] Schema script, demonstration script, report, and applicable front-end archive use the required filenames.
- [ ] Submission is made once through the LMS Dropbox by the end of W12; exact deadline checked.
- [ ] W13 lab presentation details are confirmed.
- [ ] The group follows the brief's generative AI restrictions and cites permitted code fragments in script comments.

## Verification record

| Requirement or object | Source path | Evidence path | Checked by | Result and date |
|---|---|---|---|---|
| TBD | TBD | TBD | TBD | Pending |

## Marking clarification

Section 3 assigns 10 marks to scripts, 3 to interface/presentation, and 2 to the report. The brief also describes a 5% front-end bonus and lists the working interface as 1.5 + 5.0. Confirm the exact base/bonus treatment with the instructor; keep wireframe and interface tasks in the plan until clarified.

Source: `COMP214_Term_Project_prof.Sarajlic.pdf`, sections 3-8 and Submission, pages 2-9.
