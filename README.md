# CI/CD Workflow Templates
This repository contains template files for CI/CD workflows (GitHub Actions), intended for use in Python-based projects.

It contains a very simple application, composed of a FastAPI backend and a Streamlit frontend. This application is for demonstrative purposes/to provide code over which CI/CD steps can run.


# Author
Jacob Lillie : Jacob.Lillie@capgemini.com

# 🛠️ Continuous Integration (CI) Workflows

**Continuous Integration** is the practice of automatically building, testing, and validating code changes to ensure quality and consistency throught the software development lifecycle. It allows you to quickly and confidently integrate changes into your codebase, whilst minimising manual steps and the risk of regressions. 

This repository includes 3 CI workflows, written as .YAML files and designed to run using **GitHub Actions**. 

GitHub Actions defines CI/CD pipelines through YAML files. These files allow you to programmatically specify a sequence of steps/jobs that are executed by a GitHub-hosted runner.

Each workflow file is tailored to a different dependency management tool:

| Dependency Management Tool | Workflow File         |
|-------------|-----------------------|
| `uv`        | `CI (uv).yaml`        |
| `Pipenv`    | `CI (Pipenv).yaml`    |
| `venv`      | `CI (venv).yaml`      |


Please choose the workflow that matches your project's setup. This ensures that your environment is correctly recreated before running other CI steps, reducing the risk of failures.

## CI Workflow Overview
Each CI workflow consists of 5 jobs. These are logically separated steps performed by the CI workflow.

### 1. Setup 🏗️
Installs Python, your chosen dependency manager, and project dependencies

**Prerequisites**
| Workflow File         | Python Version specified in          | Dependencies specified in|
|-----------------------|--------------------------------------|--------------------------|
| `CI (uv).yaml`        | `.python-version` or `pyproject.toml`| `uv.lock`  or `pyproject.toml` or `requirements.txt`
| `CI (Pipenv).yaml`    | `.python-version` or `Pipfile`       | `Pipfile.lock`  or `Pipfile` or `requirements.txt`
| `CI (venv).yaml`      | `.python-version`                    | `requirements.txt`

### 2. Test 🧪
Runs all tests using `pytest` and outputs a coverage report. Any test failures will cause this job to fail.

**Prerequisites** 

All tests must be stored in the `./tests` folder

### 3. Security Scan 🛂
Performs static code analysis using `bandit` to detect common security vulnerabilities and outputs a scan report. Due to the risk of false-positives & overly-cautious warnings being raised, detected vulnerabilities will **not** cause this job to fail. User should review scan report and address vulnerabilities if appropriate.

**Prerequisites**

A template `bandit.yaml` file exists in this repo to configure `bandit`. Based on the existing configuration, scanning will not be performed on the `/.venv` and `./tests` folders. It is **recommended** to use this configuration, otherwise `bandit` will recursively scan the entire project, increasing scan times significantly. 

### 4. Linting 🧹
Checks code style and quality using `flake8` and `pylint`. Both linters have been used to maximise coverage. Both have been configured to **always** pass. The user should review the linting reports in the output console and address issues if appropriate. Also outputs a pylint score badge like ![badge](https://img.shields.io/badge/pylint-10.0-green) for use in your repo.

**Prerequisites**

N/A

### 5. Docker Build 🐋
Builds your app into a Docker Image/Images, enabling it to run as a containerised service.

**Prerequisites**
Dockerfile(s)


