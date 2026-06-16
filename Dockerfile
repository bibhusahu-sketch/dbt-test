FROM python:3.10-slim

# Install git in case your dbt project needs to pull external packages/packages.yml
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Install the BigQuery adapter (this automatically handles dbt-core installation)
RUN pip install --no-cache-dir dbt-bigquery==1.8.0

WORKDIR /usr/app

# Copy all dbt profiles, models, macros, and configuration files into the container
COPY . .

# Set the entrypoint to dbt so you can pass run/test commands dynamically
ENTRYPOINT ["dbt"]
