FROM python:3.10-slim

# Install git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Install dbt-bigquery
RUN pip install --no-cache-dir dbt-bigquery==1.8.0

WORKDIR /usr/app

# Copies your whole repo into /usr/app
COPY . .

# 🎯 THE FIX: Force dbt to always look at the root /usr/app folder for profiles.yml
ENV DBT_PROFILES_DIR=/usr/app

# Step into the subfolder where dbt_project.yml lives
WORKDIR /usr/app/gcp_netsuite_analytics

ENTRYPOINT ["dbt"]
