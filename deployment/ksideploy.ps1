<#
.SYNOPSIS
  BoxStarter script to configure Windows 10 development PC.

.DESCRIPTION
  Install BoxStarter:
  . { Invoke-WebRequest -useb http://boxstarter.org/bootstrapper.ps1 } | Invoke-Expression; get-boxstarter -Force

  Run by calling the following from an **elevated** command-prompt:
  Install-BoxstarterPackage -PackageName <URL-TO-RAW-GIST> -DisableReboots

.NOTES
  Author : Ian Noble
  Contributor: Michael TEske
  Created: 2017-10-22
  Modified: 2018-12-14
#>

Write-Verbose "Temporarily disable UAC"
Disable-UAC

Write-Verbose "Configure Windows: Explorer Options"
Set-WindowsExplorerOptions -EnableShowFileExtensions -EnableShowHiddenFilesFoldersDrives -EnableShowFullPathInTitleBar

Write-Verbose "Configure Windows: Taskbar"
Set-TaskbarOptions -Size Small -Combine Full -AlwaysShowIconsOn

Write-Verbose "Trust PSGallery"
Get-PackageProvider -Name NuGet -ForceBootstrap
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

Write-Verbose "Install SysInternals"
choco upgrade sysinternals -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install Google Chrome"
choco upgrade googlechrome -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install Adobe Reader"
choco upgrade adobereader 2018.011.20063 -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install HP Universal Print Driver"
choco upgrade hp-universal-print-driver-pcl 6.6.5.23510 -y --cacheLocation "$env:temp\chocolatey"

write-verbose "Install Office365 ProPlus"
choco upgrade Office365ProPlus 2016.20181114 -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Disable SMBv1"
Disable-WindowsOptionalFeature -Online -FeatureName smb1protocol

Write-Verbose "Disable GameBarTips"
Disable-GameBarTips

Write-Verbose "Uninstall Bing Finance, News, Sports & Weather"
Get-AppxPackage Microsoft.BingFinance | Remove-AppxPackage
Get-AppxPackage Microsoft.BingNews | Remove-AppxPackage
Get-AppxPackage Microsoft.BingSports | Remove-AppxPackage
Get-AppxPackage Microsoft.BingWeather | Remove-AppxPackage

Write-Verbose "Uninstall Unrequired Windows 10 Store Apps"
Get-AppxPackage *BubbleWitch* | Remove-AppxPackage
Get-AppxPackage king.com.CandyCrush* | Remove-AppxPackage
Get-AppxPackage Microsoft.CommsPhone | Remove-AppxPackage
Get-AppxPackage microsoft.windowscommunicationsapps | Remove-AppxPackage
Get-AppxPackage Microsoft.WindowsMaps | Remove-AppxPackage  
Get-AppxPackage Microsoft.Messaging | Remove-AppxPackage
Get-AppxPackage Microsoft.People | Remove-AppxPackage
Get-AppxPackage Microsoft.Windows.Photos | Remove-AppxPackage
Get-AppxPackage Microsoft.SkypeApp | Remove-AppxPackage
Get-AppxPackage *Solitaire* | Remove-AppxPackage
Get-AppxPackage Microsoft.Office.Sway | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxApp | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxIdentityProvider | Remove-AppxPackage
Get-AppxPackage Microsoft.ZuneMusic | Remove-AppxPackage
Get-AppxPackage Microsoft.ZuneVideo | Remove-AppxPackage

Write-Verbose "Disable Xbox Gamebar"
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" -Name AppCaptureEnabled -Type DWord -Value 0
Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name GameDVR_Enabled -Type DWord -Value 0

Write-Verbose "Turn off People in Taskbar"
If (-Not (Test-Path "HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People")) {
    New-Item -Path HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People | Out-Null
}
Set-ItemProperty -Path "HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name PeopleBand -Type DWord -Value 0


Write-Verbose "Restore UAC"
Enable-UAC

Write-Verbose "Check for / install Windows Updates"
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula

Write-Output "Complete"
