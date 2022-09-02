function Start-VidXtendee {

	[CmdletBinding()]
	param (
		[Parameter()]
		[string]$Port=8082,
		[string]$RootDir=$PSScriptRoot,
		[string]$LogFileDir=$null,
		[string]$LogFileName=$null
	)

	$_vidxt_podeweb_version = "0.8.1"
	$_vidxt_podeweb_port = $Port
	$_vidxt_podeweb_logfiledir = $LogFileDir
	$_vidxt_podeweb_logfilename = $LogFileName

	# Import the Pode module which acts as an webserver 
	if (-Not (Get-Module -ListAvailable | Where-Object { $_.Name -eq "Pode.Web" })) { Write-Output "Install Modules Pode.Web and Pode"; Install-Module -Name Pode.Web -RequiredVersion $_vidxt_podeweb_version -Scope CurrentUser }
	if (-Not ((Get-Module -Name Pode.Web).Version -eq $_vidxt_podeweb_version)) { Import-Module -Name Pode }
	
	Start-PodeServer {
		Add-PodeEndpoint -Address localhost -Port $_vidxt_podeweb_port -Protocol Http -Name Frickeldave_VidXtendee

		Show-PodeGui -Title "Frickeldave site"
		Use-PodeWebTemplates -Title "Frickeldave" -Theme Dark
	}
}