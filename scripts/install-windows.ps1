# Install VirtualBox and Vagrant on Windows via winget.
# Run from an elevated PowerShell. winget installs the latest published versions.
$ErrorActionPreference = 'Stop'

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    throw "winget not found. Install 'App Installer' from the Microsoft Store, then re-run."
}

foreach ($id in 'Oracle.VirtualBox', 'Hashicorp.Vagrant') {
    winget install --id $id --exact --silent --accept-package-agreements --accept-source-agreements
}

Write-Host "Done. Open a new terminal so PATH changes take effect, then run: vagrant --version"
