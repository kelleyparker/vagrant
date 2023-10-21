# Function to install a package on Windows
function Install-Package {
    param (
        [string]$url,
        [string]$outputPath
    )
    Invoke-WebRequest -Uri $url -OutFile $outputPath
    Start-Process -FilePath $outputPath -ArgumentList "/S" -Wait
    Remove-Item $outputPath
}

# Define the VirtualBox URL
$virtualboxUrl = "https://download.virtualbox.org/virtualbox/7.0.12/VirtualBox-7.0.12-159484-Win.exe"

# Define the path where the installer will be saved
$virtualboxInstallerPath = "$env:TEMP\VirtualBox-7.0.12-159484-Win.exe"

# Install VirtualBox
Install-Package -url $virtualboxUrl -outputPath $virtualboxInstallerPath

# Define the Vagrant URL
$vagrantUrl = "https://releases.hashicorp.com/vagrant/2.4.0/vagrant_2.4.0_windows_amd64.msi"

# Define the path where the installer will be saved
$vagrantInstallerPath = "$env:TEMP\vagrant_installer.msi"

# Function to install Vagrant on Windows
function Install-Vagrant {
    param (
        [string]$url,
        [string]$outputPath
    )
    Invoke-WebRequest -Uri $url -OutFile $outputPath
    Start-Process -FilePath msiexec.exe -ArgumentList "/i $outputPath /qn" -Wait
    Remove-Item $outputPath
}

# Install Vagrant
Install-Vagrant -url $vagrantUrl -outputPath $vagrantInstallerPath
