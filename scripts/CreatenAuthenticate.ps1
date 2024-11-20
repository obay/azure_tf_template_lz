<#
.SYNOPSIS
Creates a Service Principal with specified permissions at the Management Group level and authenticates to Azure using the new credentials.

.PARAMETER ManagementGroupID
The ID of the Management Group where the Service Principal will be granted permissions.

.EXAMPLE
.\CreatenAuthenticate.ps1 -ManagementGroupID "90ed61fe-5f1b-4123-96ba-241fd24058cf"
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$ManagementGroupID,

    [Parameter(Mandatory=$true)]
    [string]$ServicePrincipalName = "sp-terraform",

    [Parameter(Mandatory=$true)]
    [string]$RoleDefinitionName = "Owner"
)

$SP = az ad sp create-for-rbac --name $ServicePrincipalName --role $RoleDefinitionName --scopes "/providers/Microsoft.Management/managementGroups/$ManagementGroupID" | ConvertFrom-Json
$env:ARM_CLIENT_ID = $SP.appId
$env:ARM_CLIENT_SECRET = $SP.password
$env:ARM_TENANT_ID = $SP.tenant
az login --service-principal -u "$env:ARM_CLIENT_ID" -p "$env:ARM_CLIENT_SECRET" --tenant "$env:ARM_TENANT_ID"
