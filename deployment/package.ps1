Install-BoxstarterPackage
boxstartershell
find-module boxstarter
get-psrepository
import-module boxstarter.chocolatey
gcm *uac*
get-command -module PackageManagement
Register-PackageSource -name Chocolatey -ProviderName Chocolatey -Location http://chocolatey.org/api/v2
Get-PackageSource
get-packageprovider
find-package -source chocolatey -name *zip*
(get-history).CommandLine | package.ps1
