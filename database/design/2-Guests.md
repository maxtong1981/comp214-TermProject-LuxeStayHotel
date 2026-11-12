# Guests

**Table:** `hms_guests`  
**Recorded owner:** Malachi  
**Source:** `COMP214_Term_Project_prof.Sarajlic-goup.pdf`, PDF pages 5-10; SQL version on pages 11-12.  
**Status:** Existing DDL extracted from the HMS-prefixed version in the group PDF; not executed in this task.

## Purpose

Guest profiles, loyalty management, and personalized experiences.

## Source and implementation

The linked CREATE TABLE statement is extracted without changing its SQL text. Only the file header is new.

[Table SQL](../scripts/02_guests.sql)

## Fields

| Field | Oracle type | Default and constraints | Description |
|---|---|---|---|
| `guest_id` | `NUMBER` | GENERATED ALWAYS AS IDENTITY PRIMARY KEY | Unique identifier for each guest. |
| `profile_names` | `VARCHAR2(150)` | NOT NULL | Guest first, middle, and last name. |
| `passport_id` | `VARCHAR2(50)` | NOT NULL | Passport or government identification number. |
| `contact_information` | `VARCHAR2(500)` | NOT NULL | Phone number, email, and contact details. |
| `vip_loyalty_status` | `VARCHAR2(30)` | NOT NULL | Regular, VIP, or another loyalty classification. |
| `loyalty_points` | `NUMBER` | DEFAULT 0 NOT NULL CHECK (loyalty_points >= 0) | Points accumulated through eligible stays and transactions. |
| `membership_level` | `VARCHAR2(30)` | NOT NULL CHECK (membership_level IN ('Silver', 'Gold', 'Platinum')) | Silver, Gold, Platinum, etc. |
| `guest_preferences` | `VARCHAR2(1000)` | Nullable; no explicit default or other column constraint. | Preferred room type, pillow preference, smoking preference, etc. |
| `special_requirements` | `VARCHAR2(1000)` | Nullable; no explicit default or other column constraint. | Accessibility, dietary, or special accommodation requirements. |
| `total_stays` | `NUMBER` | DEFAULT 0 NOT NULL CHECK (total_stays >= 0) | Number of completed hotel stays. |
| `guest_feedback_notes` | `VARCHAR2(4000)` | Nullable; no explicit default or other column constraint. | Guest feedback and service preferences for future visits. |

Types and implemented constraints above describe the extracted SQL version.

## Relationships

No foreign key is declared in this CREATE TABLE statement.

## Review notes

- The supplied SQL does not make passport_id UNIQUE; this extraction does not silently add that rule.

## Handoff checklist

- [ ] Owner confirms the maintained source version and proposed choices, where applicable.
- [ ] Column list, constraints, and diagram are consistent.
- [ ] CREATE execution, applicable sample-data counts, and constraint tests are captured.
- [ ] Actual results and executing member are linked in the evidence index.

No Oracle execution or successful test result is claimed by this file.
