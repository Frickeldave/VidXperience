if (-Not (Get-PSRepository -Name PSGallery)) {Write-Output "Register default repository"; Register-PSRepository -Default}

Write-Output "Set PSGallery to trusted to avoid WARNING messages"
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted


# Seems to be incompatible with Pode.web. You get several ERRORS like this:
# Import-Module: C:\Users\...\Documents\WindowsPowerShell\Modules\Pode\2.7.0\Private\Helpers.ps1:912:17
if (Get-Module oh-my-posh-core) { Write-Output "Disable oh-my-posh because of incompatibility"; Remove-Module oh-my-posh-core -Force }

if (Get-Module VidXtendee) { Write-Output "Remove previous installed VidXtendee module"; Remove-Module VidXtendee -Force }
Import-Module .\VidXtendee -Force

Write-Output "Start VidXtendee"
Start-VidXtendee

Write-Output "Set Repository to untrusted"
Set-PSRepository -Name PSGallery -InstallationPolicy Untrusted