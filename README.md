# Azure Cloud Infrastructure with Terraform

## Overview
Production-grade Azure infrastructure provisioned entirely with Terraform IaC. Demonstrates real-world cloud engineering practices including remote state management, modular configuration, network security, and GitOps principles.

## Architecture

```
Resource Group (farhan-cloud-rg)
├── Virtual Network (10.0.0.0/16)
│   └── Subnet (10.0.1.0/24)
│       └── Network Security Group (SSH inbound)
├── Public IP (Static, Standard SKU)
├── Network Interface
└── Linux Virtual Machine (Ubuntu 18.04 LTS)
```

## Infrastructure Components
| Resource | Name | Purpose |
|----------|------|---------|
| Resource Group | farhan-cloud-rg | Logical container for all resources |
| Virtual Network | farhan-vnet | Isolated network environment |
| Subnet | farhan-subnet | Network segment for compute resources |
| Network Security Group | farhan-nsg | Inbound/outbound traffic control |
| Public IP | farhan-public-ip | Static external IP (Standard SKU) |
| Network Interface | farhan-nic | VM network identity |
| Linux VM | farhan-vm | Ubuntu 18.04 LTS compute instance |

## Key Engineering Decisions
- Remote State — Terraform state stored in Azure Blob Storage with state locking to prevent concurrent apply conflicts
- Standard SKU Public IP — Used over Basic SKU which is being retired by Azure
- Static IP Allocation — Ensures consistent external addressing for DNS and firewall rules
- Pessimistic Version Constraints — ~> 3.0 prevents accidental breaking major version upgrades
- Sensitive Variables — Admin password marked sensitive so it never appears in logs or pipeline output
- Tagged Resources — All resources tagged with environment and managed_by for cost tracking and drift prevention

## Prerequisites
- Terraform >= 1.0
- Azure CLI
- Active Azure subscription
- Azure Blob Storage for remote state

## Backend Setup
Create remote state storage before initialising Terraform:

az group create --name tfstate-rg --location westeurope
az storage account create --name tfstatefarhan01 --resource-group tfstate-rg --location westeurope --sku Standard_LRS
az storage container create --name tfstate --account-name tfstatefarhan01

## Deployment

terraform init
terraform plan
terraform apply
terraform destroy

## Security Notes
- SSH currently open to 0.0.0.0/0 — production would restrict to bastion host or VPN IP
- Password authentication enabled for demo — production uses SSH keys only
- TLS 1.2 minimum should be enforced on storage account in production

## Author
Mohammed Farhan Ali — Cloud Engineer
[LinkedIn](https://www.linkedin.com/in/mohammedfarhan1/)