# Banking Modern Data Stack — Step 1


This repo is a progressive, local-first implementation of a full modern data stack for a banking use case (OLTP + CDC + Lake + dbt + Snowflake + BI).


## What this step includes
- Repo skeleton and recommended folder layout
- Docker Compose for local infra: Postgres, Zookeeper, Kafka, Kafka Connect (Debezium), MinIO
- Initial Postgres DDL (customers, accounts, transactions)
- GitHub Actions CI skeleton


## Quick start (local)
1. Install Docker and Docker Compose.
2. From repo root: `docker-compose -f docker/docker-compose.yml up -d`
3. Apply Postgres schema: `psql -h localhost -p 5432 -U postgres -f postgres/schema.sql`
4. Confirm services are up (docker ps) and check MinIO web console (if needed).


See `docs/run-local.md` for full instructions.