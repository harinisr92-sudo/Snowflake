# Snowflake Practice

Hands-on Snowflake practice scripts and notes. I'm an ETL and data integration engineer (10+ years) moving into cloud data engineering, and this repo is where I practise Snowflake fundamentals with small, runnable examples.

All data is made up. No real credentials are stored in this repo.

## Contents

| File | What it covers |
|---|---|
| `Table_Types.sql` | Creating a database and schemas; permanent, transient and temporary tables; transient schemas; `DATA_RETENTION_TIME_IN_DAYS` |
| `Constraints.sql` | `PRIMARY KEY`, `UNIQUE`, `NOT NULL` and defaults; showing that keys are not enforced on standard tables; adding and changing a primary key; deduplication with `MERGE`, `DISTINCT` and `QUALIFY ROW_NUMBER()` |
| `Zero_Copy_Cloning.sql` | Zero-copy cloning of databases and tables; `CREATE TABLE AS SELECT` vs `LIKE` vs `CLONE`; clone chains and storage metrics; `UNDROP` and Time Travel |
| `S3_Integration.sql` | Storage integration with Amazon S3, file formats, an external stage, and external tables over CSV files (placeholders replace all account values) |
| `snowflake_learnings.md` | Notes on what I learned and the mistakes I made along the way |

## What I learned

1. **Standard tables do not enforce primary or unique keys.** A duplicate key is accepted without error, so I handle uniqueness in the load logic (`MERGE`) and with duplicate checks.
2. **`CREATE TABLE AS SELECT` copies data but no constraints. `LIKE` copies the structure and constraints but no data. `CLONE` copies structure, constraints and data.**
3. **Clones are zero-copy.** A change to a clone is stored in new micro-partitions and does not change the original's storage.
4. **Dropped tables can be recovered** with `UNDROP` during the Time Travel window, and Time Travel queries (`AT (OFFSET => ...)`) show earlier states.
5. **An explicit `NULL` does not trigger a column default.** To use the default, leave the column out of the insert or use the `DEFAULT` keyword.
6. **Unquoted identifiers are case-insensitive, and quoted ones are case-sensitive.**

## How to run

1. Run `Table_Types.sql` first. It creates the `HSR_PRACTICE` database and `CORE_SCHEMA`.
2. Run `Constraints.sql`, then `Zero_Copy_Cloning.sql`.
3. For `S3_Integration.sql`, replace the placeholders with your own IAM role ARN and bucket, and follow the comments to finish the trust policy in AWS.

Run statements one at a time in a worksheet. Some lines are notes or pasted results, not runnable SQL.

## Security

- No AWS keys, role ARNs, account IDs or external IDs are committed. Placeholders such as `<YOUR_IAM_ROLE_ARN>` mark where your own values go.
- Never commit `.env` files, key files or connection configs.

## Author

Harini Srinivasaraghavan · [LinkedIn] · [email]
