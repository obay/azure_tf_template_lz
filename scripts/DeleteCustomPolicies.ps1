<#
.SYNOPSIS
    Deletes all custom Azure Policy assignments, initiatives, and policy definitions across all scopes.

.DESCRIPTION
    This script performs a comprehensive cleanup of Azure Policy components in the following order:
    1. Removes all policy assignments from subscription, management group, and resource group scopes
    2. Deletes all custom policy initiatives
    3. Deletes all custom policy definitions

.PREREQUISITES
    - Azure PowerShell module (Az) installed
    - Authenticated to Azure (Connect-AzAccount)
    - Appropriate permissions to delete policies (Contributor or Policy Contributor role)

.PARAMETER None
    This script does not accept any parameters.

.EXAMPLE
    # First, connect to your Azure account
    Connect-AzAccount

    # Then run the script
    .\DeleteCustomPolicies.ps1

.NOTES
    File Name      : DeleteCustomPolicies.ps1
    Author         : [Your Name]
    Prerequisite   : Az Module
    Version        : 1.0

.OUTPUTS
    Displays detailed progress of deletion operations with color-coded status messages:
    - Green: Successful deletions
    - Red: Failed operations with error details
    - Yellow: Progress indicators
    - Cyan: Major operation steps
    - Gray: Processing details

.LINK
    https://learn.microsoft.com/en-us/azure/governance/policy/
#>

# Function to get all management groups
function Get-AllManagementGroups {
    $managementGroups = Get-AzManagementGroup
    return $managementGroups
}

Write-Host "Getting all policy assignments from all scopes..." -ForegroundColor Cyan

# Initialize array to store all assignments
$allAssignments = @()

# Get assignments from current subscription
Write-Host "Getting assignments from subscription scope..." -ForegroundColor Yellow
$allAssignments += Get-AzPolicyAssignment

# Get assignments from all management groups
Write-Host "Getting assignments from management group scope..." -ForegroundColor Yellow
$managementGroups = Get-AllManagementGroups
foreach ($mg in $managementGroups) {
    Write-Host "Processing management group: $($mg.DisplayName)" -ForegroundColor Gray
    $allAssignments += Get-AzPolicyAssignment -Scope $mg.Id
}

# Get assignments from all resource groups in the current subscription
Write-Host "Getting assignments from resource group scope..." -ForegroundColor Yellow
$resourceGroups = Get-AzResourceGroup
foreach ($rg in $resourceGroups) {
    Write-Host "Processing resource group: $($rg.ResourceGroupName)" -ForegroundColor Gray
    $allAssignments += Get-AzPolicyAssignment -Scope $rg.ResourceId
}

# Remove duplicate assignments
$allAssignments = $allAssignments | Sort-Object -Property Id -Unique

Write-Host "`nFound $($allAssignments.Count) unique policy assignments across all scopes" -ForegroundColor Cyan

# Remove all policy assignments
foreach ($assignment in $allAssignments) {
    Write-Host "Deleting policy assignment: $($assignment.Name) from scope: $($assignment.Scope)"
    try {
        Remove-AzPolicyAssignment -Id $assignment.Id -Force
        Write-Host "Successfully deleted policy assignment: $($assignment.Name)" -ForegroundColor Green
    }
    catch {
        Write-Host "Failed to delete policy assignment: $($assignment.Name)" -ForegroundColor Red
        Write-Host "Error: $_" -ForegroundColor Red
    }
}

# Get all policy initiatives and filter for custom ones
Write-Host "`nGetting custom policy initiatives..." -ForegroundColor Cyan
$allInitiatives = Get-AzPolicySetDefinition
$customInitiatives = $allInitiatives | Where-Object { $_.PolicyType -eq "Custom" }

# Remove custom policy initiatives
foreach ($initiative in $customInitiatives) {
    Write-Host "Deleting policy initiative: $($initiative.Name)"
    try {
        Remove-AzPolicySetDefinition -Id $initiative.Id -Force
        Write-Host "Successfully deleted policy initiative: $($initiative.Name)" -ForegroundColor Green
    }
    catch {
        Write-Host "Failed to delete policy initiative: $($initiative.Name)" -ForegroundColor Red
        Write-Host "Error: $_" -ForegroundColor Red
    }
}

# Get all custom policies
Write-Host "`nGetting custom policies..." -ForegroundColor Cyan
$allPolicies = Get-AzPolicyDefinition
$customPolicies = $allPolicies | Where-Object { $_.PolicyType -eq "Custom" }

# Loop through each custom policy and delete it
foreach ($policy in $customPolicies) {
    Write-Host "Deleting policy: $($policy.Name)"
    try {
        Remove-AzPolicyDefinition -Id $policy.Id -Force
        Write-Host "Successfully deleted policy: $($policy.Name)" -ForegroundColor Green
    }
    catch {
        Write-Host "Failed to delete policy: $($policy.Name)" -ForegroundColor Red
        Write-Host "Error: $_" -ForegroundColor Red
    }
}

Write-Host "`nDeletion process completed." -ForegroundColor Cyan
