# As this is a clean Windows Server we should install NuGet first.
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

# Make sure the PowerShell Gallery is a trusted repository
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

# Install the module from PowerShell Gallery
Install-Module -Name PSWindowsUpdate

# Run Windows Updates and reboot
Get-WUInstall -AcceptAll -AutoReboot