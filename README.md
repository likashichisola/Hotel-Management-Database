# Hotel Management Relational Database

A comprehensive, fully normalized SQL database designed to handle the core data infrastructure for a Hotel Management System. This repository contains the raw Data Definition Language (DDL) scripts used to architect the schema from scratch.

## Features
* **Schema Architecture:** Custom `CREATE DATABASE` and `CREATE TABLE` scripts establishing a fully relational structure for Guests, Rooms, Reservations, and Billing.
* **Data Integrity:** Strict implementation of Primary Keys, Foreign Keys, and data type constraints to prevent orphaned records (e.g., ensuring a reservation cannot exist without a valid guest and room).
* **Comprehensive Documentation:** Includes a detailed Data Dictionary mapping out all tables, column definitions, constraints, and relational mappings for scalable developer handoff.

## Tech Stack
* **Language:** SQL (Data Definition Language)
* **Design & Documentation:** Data Dictionary (CSV/Excel)
