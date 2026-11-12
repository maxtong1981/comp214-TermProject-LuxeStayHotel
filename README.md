# LuxeStay — COMP214 Term Project

This repository contains the database design, SQL scripts, website source code, and supporting documents for our four-person group project.

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