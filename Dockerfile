FROM python:3.10-slim

# Install git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Install dbt-bigquery
RUN pip install --no-cache-dir dbt-bigquery==1.8.0

WORKDIR /usr/app

# 1. Copies your whole repo (including the subfolder) into the container
COPY . .

# 🎯 2. THE FIX: Tell the container to move into the project subfolder where dbt_project.yml lives
WORKDIR /usr/app/gcp_netsuite_analytics

ENTRYPOINT ["dbt"]
