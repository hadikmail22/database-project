# Humanitarian Aid Tracking System in Palestinian Camps

This repository contains a database project for managing and tracking humanitarian aid operations in Palestinian refugee camps. The system is designed to support beneficiary registration, family and camp management, aid provider records, campaigns, donations, inventory, aid distribution tracking, staff management, distribution locations, and feedback handling.

## Project Idea

Many humanitarian aid operations in refugee camps still depend on manual or fragmented records. This project proposes a relational database system that helps NGOs, staff, and donors organize aid activities, reduce duplicated work, improve transparency, and make sure aid reaches the right beneficiaries.

## Main Features

- Beneficiary registration and linking beneficiaries to families and camps
- Family and camp management
- Aid type and aid provider management
- Campaign and donation recording
- Inventory tracking for available aid items
- Aid distribution tracking by beneficiary, provider, campaign, staff member, location, date, and quantity
- Staff and distribution location management
- Feedback collection and handling

## Database Tables

The SQL script creates the following tables:

- `Camp`
- `Family`
- `Beneficiary`
- `Aid_Type`
- `Aid_Provider`
- `Campaign`
- `Donation`
- `Inventory`
- `Staff`
- `Distribution_Location`
- `Aid_Distribution`
- `Feedback`

## Files

```text
.
├── README.md
├── .gitignore
├── sql/
│   └── human-aid-camps.sql
└── docs/
    └── database-project-report.docx
```

## How to Run the Database Script

### Option 1: MySQL Workbench

1. Open MySQL Workbench.
2. Connect to your local MySQL server.
3. Open `sql/human-aid-camps.sql`.
4. Run the full script.
5. Refresh the schemas list and open the `human_aid_camps` database.

### Option 2: Command Line

```bash
mysql -u root -p < sql/human-aid-camps.sql
```

Then log in to MySQL and check the database:

```sql
USE human_aid_camps;
SHOW TABLES;
SELECT * FROM Beneficiary;
```

## Notes

- The SQL file includes table creation statements and sample data inserts.
- The database is intended for a course project and can be extended later with a user interface, dashboards, offline access, and map-based distribution tracking.

## Team Members

- Akram Zakarna
- Hadi Kmail
