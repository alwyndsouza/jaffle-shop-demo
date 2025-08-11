# Jaffle Shop Demo - CI/CD

This repository demonstrates a CI/CD pipeline for a dbt project using GitHub Actions.

## CI/CD Pipeline

The CI/CD pipeline is defined in the `.github/workflows/dbt-ci-pipeline.yml` file and is triggered on pushes to `dev` and `feature/*` branches, and on pull requests to `main` and `dev`.

The pipeline consists of the following jobs:

- **`setup-and-validate`**: This job checks out the code, detects file changes, and sets up the Python environment.
- **`pre-commit-hooks`**: This job runs the pre-commit hooks on the changed files to ensure code quality and consistency.
- **`prettier-check`**: This job checks the formatting of YAML files using Prettier.
- **`dbt-run-and-test`**: This job runs `dbt build` to build and test the dbt models. It runs in a temporary schema that is dropped at the end of the job.
- **`summary`**: This job provides a summary of the pipeline run, including the status of each job and links to artifacts.

### Required GitHub Secrets

To enable the CI pipeline, you need to set up the following secrets in your GitHub repository settings:

- `DBT_HOST`: Your Databricks workspace URL.
- `DBT_HTTP_PATH`: The HTTP path to your SQL warehouse.
- `DBT_TOKEN`: Your Databricks access token.

These values can be found in your `.env.example` file.

## Local Setup

To run the CI checks locally, you need to set up the project on your local machine.

### 1. Clone the repository

First, clone the repository to your local machine:

```bash
git clone https://github.com/alwyndsouza/jaffle-shop-demo.git
cd jaffle-shop-demo
```

### 2. Install dependencies

This project uses both Python and Node.js.

**Python dependencies:**

It's recommended to use a virtual environment to manage Python dependencies.

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
pip install -r dbt-requirements.txt
```

**Node.js dependencies:**

You'll also need to install the Node.js dependencies using `npm`:

```bash
npm install
```

### 3. Set up pre-commit hooks

This project uses pre-commit hooks to enforce code quality and consistency. To set up the hooks, run the following command:

```bash
pre-commit install
```

This will install the hooks defined in `.pre-commit-config.yaml`. The hooks will run automatically every time you make a commit.

### 4. Running tests and linters locally

You can run the pre-commit hooks manually on all files at any time:

```bash
pre-commit run --all-files
```

You can also run the Prettier check for YAML files separately:

```bash
npm run format:check:dbt
```

To format the YAML files, run:

```bash
npm run format:dbt
```
