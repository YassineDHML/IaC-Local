# IaC-Local

Practical DevOps lab for building and automating infrastructure with Terraform and CI/CD.
## Lab Overview

This project provisions a local infrastructure using Terraform and Docker:
- PostgreSQL container (database service)
- Nginx-based web container (simple app endpoint)

The same deployment lifecycle is automated in GitHub Actions on each push to `main`.

## Tech Stack

- Terraform
- Docker
- GitHub Actions

## Deployment Lifecycle (DLC)

Run the following commands in order:

```bash
terraform init
terraform plan
terraform apply -auto-approve
```

Then validate:
- App URL: http://localhost:8080

Cleanup:

```bash
terraform destroy -auto-approve
```

## CI/CD Pipeline

Workflow file: `.github/workflows/main.yml`

Pipeline stages:
1. Setup Terraform
2. Terraform Init
3. Terraform Plan
4. Terraform Apply

`Apply` only runs if `Plan` succeeds.