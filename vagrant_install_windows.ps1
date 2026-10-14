#Requires -RunAsAdministrator
<#
.SYNOPSIS
  Downloads and silently installs Oracle VirtualBox and HashiCorp Vagrant.
.EXAMPLE
  .\vagrant_install_windows.ps1
  .\vagrant_install_windows.ps1 -VagrantVersion 2.4.1
#>
param(
    [string]$VirtualBoxUrl   = "https://download.virtualbox.org/virtualbox/7.0.12/VirtualBox-7.0.12-159484-Win.exe",
    [string]$VagrantVersion   = "2.4.0"
)

$ErrorActionPreference = "Stop"

function Get-Installer {
    param([string]$Url, [string]$OutFile)
    Write-Host "Downloading $Url"
    Invoke-WebRequest -Uri $Url -OutFile $OutFile -UseBasicParsing
}

# --- VirtualBox -------------------------------------------------------------
$vbox = Join-Path $env:TEMP "VirtualBox-installer.exe"
Get-Installer -Url $VirtualBoxUrl -OutFile $vbox
Start-Process -FilePath $vbox -ArgumentList "--silent", "--ignore-reboot" -Wait
Remove-Item $vbox -Force

# --- Vagrant ----------------------------------------------------------------
$vagrantUrl = "https://releases.hashicorp.com/vagrant/$VagrantVersion/vagrant_${VagrantVersion}_windows_amd64.msi"
$msi = Join-Path $env:TEMP "vagrant_installer.msi"
Get-Installer -Url $vagrantUrl -OutFile $msi
Start-Process -FilePath msiexec.exe -ArgumentList "/i", "`"$msi`"", "/qn", "/norestart" -Wait
Remove-Item $msi -Force

Write-Host "Done. Open a NEW terminal (and reboot if Vagrant asks) then run: vagrant --version"
