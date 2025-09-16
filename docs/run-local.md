# Run local stack (Step 1)

**Prerequisites**:  
- Docker installed  
- Docker Compose installed  

---

## 1. Start services

    docker compose -f docker/docker-compose.yml up -d

---

## 2. Wait for Postgres
- Check logs with `docker logs <container-id>`  
- Or just wait ~10 seconds  

---

## 3. Apply schema

    psql "postgresql://postgres:postgres@localhost:5432/banking" -f postgres/schema.sql

---

## 4. Verify

- Postgres:  

      psql "postgresql://postgres:postgres@localhost:5432/banking" -c "\dt"

- MinIO: open http://localhost:9001  
  - Username: `minioadmin`  
  - Password: `minioadmin`  

- Kafka: use `kafka-console-consumer` from inside the container or external tools  

⚠️ If you run into permission or port conflicts, shut down other services occupying ports **5432 / 9092 / 9000 / 8083** and retry.  

---

## Acceptance criteria for Step 1

1. Able to run `docker compose -f docker/docker-compose.yml up -d` and see Postgres + Kafka + Connect + MinIO containers running.  
2. Able to apply Postgres DDL (`postgres/schema.sql`) to the local Postgres and confirm tables are created.  
3. CI skeleton file exists in `.github/workflows/ci.yml` and runs without fatal errors (placeholders acceptable at this stage).  

---

✅ If you’re happy with these artifacts, say **"Go to Step 2"** and I will start implementing Step 2: the fake data generator (Python Faker), plus instructions to run it and a simple test harness.
