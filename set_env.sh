#!/bin/bash

# Exit on error
set -e

# Load environment variables from .env file
if [ -f .env ]; then
  echo "Loading environment variables from .env..."
  while IFS='=' read -r key value; do
    # Skip comments and empty lines
    if [[ "$key" =~ ^#.* ]] || [[ -z "$key" ]]; then
      continue
    fi
    # Remove any surrounding quotes from the value
    value=$(echo "$value" | sed -e 's/^"//' -e 's/"$//')
    export "$key=$value"
  done < .env
else
  echo "Error: .env file not found."
  exit 1
fi

# Confirm variables are loaded
echo "DBT_HOST: $DBT_HOST"
echo "DBT_HTTP_PATH: $DBT_HTTP_PATH"

# Run dbt debug
echo "Running dbt debug..."
dbt debug --target dev

# Optional: Run dbt
# echo "Running dbt run..."
# dbt run --target dev
