# Landing CDC Data into MinIO

This script reads Kafka topics and writes them into MinIO as Parquet files in a structured raw data lake.

## Setup

1. Ensure Docker Compose stack from Step 1 is running.  
2. Install Python dependencies:

```bash
pip install -r requirements.txt
