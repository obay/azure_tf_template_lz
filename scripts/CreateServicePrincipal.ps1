<#
.SYNOPSIS
    Creates an Azure Service Principal with specified RBAC role at the Management Group scope.

.DESCRIPTION
    This script creates a new Azure Service Principal and assigns it the specified RBAC role
    at the Management Group level. It outputs the Service Principal's ID and secret which
    can be used for authentication.

.PARAMETER ServicePrincipalName
    The display name for the new Service Principal. Should be unique within your tenant.
    Example: "sp-terraform-prod"

.PARAMETER RoleDefinitionName
    The Azure RBAC role to assign to the Service Principal.
    Common values: "Owner", "Contributor", "Reader"

.PARAMETER ManagementGroupId
    The ID of the Management Group where the role will be assigned.
    This is typically found in the Azure Portal under Management Groups.

.EXAMPLE
    .\CreateServicePrincipal.ps1 -ServicePrincipalName "sp-terraform-prod" -RoleDefinitionName "Owner" -ManagementGroupId "mg-production"

.EXAMPLE
    .\CreateServicePrincipal.ps1 -ServicePrincipalName "sp-terraform-dev" -RoleDefinitionName "Contributor" -ManagementGroupId "mg-development"

.NOTES
    Requires:
    - Azure CLI (az) to be installed and logged in
    - Sufficient permissions to create Service Principals and assign roles
    
    Author: Your Name
    Last Modified: $(Get-Date -Format "yyyy-MM-dd")
#>

param(
    [Parameter(Mandatory=$true,
               HelpMessage="Enter the name for the new Service Principal (e.g., 'sp-terraform-prod')")]
    [string]$ServicePrincipalName,
    
    [Parameter(Mandatory=$true,
               HelpMessage="Enter the RBAC role to assign (e.g., 'Owner', 'Contributor', 'Reader')")]
    [string]$RoleDefinitionName,
    
    [Parameter(Mandatory=$true,
               HelpMessage="Enter the Management Group ID where the role will be assigned")]
    [string]$ManagementGroupId
)

$sp = (az ad sp create-for-rbac --name $ServicePrincipalName --role $RoleDefinitionName --scopes /providers/Microsoft.Management/managementGroups/$ManagementGroupId) | ConvertFrom-Json
Write-Host "Service Principal ID: $($sp.appId)"
Write-Host "Service Principal Secret: $($sp.password)"
Write-Host "Service Principal created successfully!" -ForegroundColor Green
