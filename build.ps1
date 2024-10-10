<#
.DESCRIPTION
    Wrapper for installing dependencies, running and testing the project
#>

param(
    [switch]$clean ## clean build, wipe out all build artifacts
    , [switch]$install ## install mandatory packages
    , [string]$directory = "simple"
)

function Invoke-Bootstrap {
    # Download bootstrap scripts from external repository
    Invoke-RestMethod https://raw.githubusercontent.com/avengineers/bootstrap-installer/v1.14.0/install.ps1 | Invoke-Expression
    # Execute bootstrap script
    . .\.bootstrap\bootstrap.ps1
}

## start of script
# Always set the $InformationPreference variable to "Continue" globally,
# this way it gets printed on execution and continues execution afterwards.
$InformationPreference = "Continue"

# Stop on first error
$ErrorActionPreference = "Stop"

Push-Location $PSScriptRoot
Write-Output "Running in ${pwd}"

try {
    # bootstrap environment
    Invoke-Bootstrap

    # Load utils from bootstrap
    . "$PSScriptRoot\.bootstrap\utils.ps1"

    if (-Not $install) {
        if ($clean) {
            Remove-Path "docs\$directory\build"
        }
        # Generate documentation
        Invoke-CommandLine ".venv\Scripts\sphinx-build.exe -E -a docs\$directory\docs docs\$directory\build"
    }

}
finally {
    Pop-Location
}
## end of script
