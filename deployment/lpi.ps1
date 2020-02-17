Function Remove-HP {

    

    # Other packages are dependent on HP Device Support

    Uninstall-Package -Name "HP Device Access Manager" -Force

    

    # Retrieve all HP packages

    $apps = Get-Package -name HP*



    # Process each app that isn't the HP Support Assistant. HPSA is convenient for updating drivers

    foreach ($app in $apps) {

        if ($app.name -notlike "HP Support Assistant") {

            $app.name

            Uninstall-Package $app.name -Force

        } #End If

    } #End foreach

} #End Function

# Set script execution policy

Set-ExecutionPolicy RemoteSigned -Force

# Disable powerconfig...ie, hibernation

powercfg -h off

# House Keeping
# Rename the computer ksi-122018-# (# is an incremental number you need to keep track of)

Rename-Computer -NewName lpi-022020-2 -restart


## Start here after rebooot

# Side note This installs boxstarter. Once installed. Insert the "raw" GIST link
# place cursor on the following line and press F8
. { Invoke-WebRequest -useb http://boxstarter.org/bootstrapper.ps1 } | Invoke-Expression; get-boxstarter -Force



Install-BoxstarterPackage -PackageName https://gist.githubusercontent.com/teskemj/840e5df39bb105d643952a7a8e145c32/raw/212de01bd61967d2c6792b6ba279986787c729ac/deployhp.ps1 -DisableReboots


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


<#
PSReadlinefromLPI022020-1

#>
# Region

Rename-Computer lpi-022020-1 -restart
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install powershell-core -y
choco install micrososft-edge -y
choco install microsoft-edge -y
choco install office365proplus -y
choco install adobereader -y

cinst boxstarter -y

Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar -EnableOpenFileExplorerToQuickAccess -EnableShowRecentFilesInQuickAccess -EnableShowFrequentFoldersInQuickAccess -EnableExpandToOpenFolder -EnableShowRibbon
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar -EnableOpenFileExplorerToQuickAccess -EnableShowRecentFilesInQuickAccess -EnableShowFrequentFoldersInQuickAccess -EnableExpandToOpenFolder -EnableShowRibbon
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar -EnableOpenFileExplorerToQuickAccess -EnableShowRecentFilesInQuickAccess -EnableShowFrequentFoldersInQuickAccess -EnableExpandToOpenFolder -EnableShowRibbon
powercfg -h off
# End region