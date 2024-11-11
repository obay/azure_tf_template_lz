<#
.SYNOPSIS
    Generates an Infracost breakdown report for infrastructure costs.

.DESCRIPTION
    This script runs Infracost to analyze and estimate cloud infrastructure costs.
    It requires Infracost to be installed and can be configured with custom API keys,
    paths, and project names.

.PARAMETER ApiKey
    The Infracost API key. If not provided, will use existing environment variable
    INFRACOST_API_KEY if present.

.PARAMETER Path
    The path to the infrastructure code directory. Defaults to parent directory.

.PARAMETER UsageFile
    Path to the usage file (YAML) containing resource usage estimates.
    Defaults to "usage.yml" in the parent directory.

.PARAMETER ProjectName
    Name of the project for the cost report. Defaults to "Infrastructure Cost Analysis".

.PARAMETER ShowSkipped
    Switch to show skipped resources in the report. Defaults to true.

.EXAMPLE
    # Basic usage with default parameters
    .\HowMuch.ps1 -ApiKey "your-api-key-here"

.EXAMPLE
    # Full customization
    .\HowMuch.ps1 -ApiKey "your-api-key" -Path "C:\project\terraform" -UsageFile "C:\project\custom-usage.yml" -ProjectName "My Project" -ShowSkipped:$false

.EXAMPLE
    # Use existing environment variable for API key
    .\HowMuch.ps1 -Path "./terraform" -ProjectName "Dev Environment"

.NOTES
    Requires Infracost to be installed. Visit https://infracost.io/docs/ for installation instructions.
#>

param(
    [string]$ApiKey = $env:INFRACOST_API_KEY,
    [string]$Path = "./",
    [string]$UsageFile = "usage.yml",
    [string]$ProjectName = "Infrastructure Cost Analysis",
    [bool]$ShowSkipped = $true
)

# Validate API Key
if ([string]::IsNullOrEmpty($ApiKey)) {
    throw "Infracost API key is required. Provide it via -ApiKey parameter or set INFRACOST_API_KEY environment variable."
}

# Set API Key for this session
$env:INFRACOST_API_KEY = $ApiKey

# Build command arguments
$arguments = @(
    "breakdown",
    "--path", $Path,
    "--usage-file", $UsageFile,
    "--project-name", "`"$ProjectName`""
)

if ($ShowSkipped) {
    $arguments += "--show-skipped"
}

# Execute Infracost with parameters
$command = "infracost $($arguments -join ' ')"
Write-Host "Executing: $command" -ForegroundColor Cyan
Invoke-Expression $command