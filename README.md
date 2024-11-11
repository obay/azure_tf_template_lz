# CPKCR Landing Zone Deployment

This project automates the deployment of a landing zone for CPKCR (Cloud Platform Kubernetes Container Registry) in Azure using Terraform.

## Components Deployed

This landing zone deployment includes the following components:

1. Azure Virtual Network for connectivity
2. Subnets for various services
3. Palo Alto Networks firewall for enhanced security
4. Network interfaces for connectivity
5. Azure Virtual Machine for Palo Alto firewall

## Prerequisites

Before you begin, ensure you have the following:

1. [Terraform](https://www.terraform.io/downloads.html) installed (version 0.12.x or later)
2. [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed and configured
3. An active Azure subscription

## Important: Accepting Palo Alto EULA

Before running the Terraform scripts, you must accept the Palo Alto Networks End User License Agreement (EULA). To do this:

1. Navigate to the `scripts` directory in this project.
2. Run the PowerShell script provided:

