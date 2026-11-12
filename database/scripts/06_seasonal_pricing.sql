/*
Group: TBD (confirm the registered group name)
Members: Malachi, Nevan, Jazeel, Wei (confirm full names and student IDs)
File: 06_seasonal_pricing.sql
Table: hms_seasonal_pricing
Source: COMP214_Term_Project_prof.Sarajlic-goup.pdf, PDF pages 16
Recorded table owner: Nevan
Status: AI-drafted implementation for group review; the PDF supplies fields but no CREATE TABLE statement for this table.
Provenance: Field names, purposes, and status examples come from the PDF. Data types, lengths, nullability, defaults, key implementation, and constraints are proposed choices, not source SQL or verified group decisions.
Prerequisites: None outside this table
Scope: table DDL only; no data, cleanup, triggers, or execution proof.
*/

CREATE TABLE hms_seasonal_pricing (
    pricing_id                         NUMBER           GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    room_type_reference                VARCHAR2(50)     NOT NULL,
    season_name                        VARCHAR2(50)     NOT NULL,
    pricing_period                     VARCHAR2(200)    NOT NULL,
    seasonal_rate                      NUMBER(10,2)     NOT NULL CHECK (seasonal_rate >= 0),
    weekend_surcharge                  NUMBER(10,2)     CHECK (weekend_surcharge >= 0),
    promotional_rate                   NUMBER(10,2)     CHECK (promotional_rate >= 0),
    pricing_validity                   VARCHAR2(20)     NOT NULL CHECK (pricing_validity IN ('Active', 'Inactive')),
    holiday_surcharge                  NUMBER(10,2)     CHECK (holiday_surcharge >= 0),
    minimum_stay_requirement           NUMBER(5)        NOT NULL CHECK (minimum_stay_requirement > 0),
    pricing_priority                   NUMBER(5)        NOT NULL
);
