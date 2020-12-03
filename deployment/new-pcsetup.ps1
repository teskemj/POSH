  <#
.SYNOPSIS
  BoxStarter script to configure Windows 10 development PC.

.DESCRIPTION
  Install BoxStarter:
  . { Invoke-WebRequest -useb http://boxstarter.org/bootstrapper.ps1 } | Invoke-Expression; get-boxstarter -Force

  Run by calling the following from an **elevated** command-prompt. 
  Remove -DisableReboots parameter to allow the script to reboot as required.
  Install-BoxstarterPackage -PackageName <URL-TO-RAW-GIST> -DisableReboots

.NOTES
  Author : Ian Noble
  Created: 2017-10-22
#>
. { Invoke-WebRequest -useb http://boxstarter.org/bootstrapper.ps1 } | Invoke-Expression; get-boxstarter -Force

Write-Verbose "Temporarily disable UAC"
Disable-UAC

Write-Verbose "Trust PSGallery"
Get-PackageProvider -Name NuGet -ForceBootstrap
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

Write-Verbose "Install PowerShell Get"
Install-Module -Name PowerShellGet -force

Write-Verbose "Configure Windows: Explorer Options"
Set-WindowsExplorerOptions -EnableShowFileExtensions -EnableShowHiddenFilesFoldersDrives -EnableShowFullPathInTitleBar


Write-Verbose "Installing posh-git and oh-my-posh"
Install-Module -Name posh-git
Update-Module -Name posh-git

Install-Module -Name oh-my-posh
Update-Module -Name oh-my-posh

Write-Verbose "Install SysInternals"
choco upgrade sysinternals -y

Write-Verbose "Install ShareX (Screenshots)"
choco upgrade sharex -y

Write-Verbose "Install ScreenToGif"
choco install screentogif -y

Write-Verbose "Install Visual Studio Code"
choco upgrade vscode -y

Write-Verbose "Install Markdown Master"
choco upgrade markdownmonster -y

Write-Verbose "Install ClipboardFusion"
choco upgrade clipboardfusion -y

Write-Verbose "Install AutoHotKey"
choco upgrade autohotkey.install -y

Write-Verbose "Install Visual Studio Code Extensions"
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Verbose "Install Google Chrome"
choco upgrade googlechrome -y

Write-Verbose "Install Cmder Mini"
choco upgrade cmdermini -y
mkdir C:\tools\cmdermini\config\
invoke-webrequest -URI https://gist.githubusercontent.com/ian-noble/eab10f92c207c1deeb589cd135025d3c/raw/7134c2ffaa0461a145d12fad58acf5dd95164f40/ConEmu.xml -Outfile C:\tools\cmdermini\config\ConEmu.xml

Write-Verbose "Install Packer"
choco upgrade packer -y

Write-Verbose "Install Pester"
choco upgrade pester -y

Write-Verbose "Install PowerBI"
choco upgrade powerbi -y

Write-Verbose "Install WinSCP"
choco upgrade winscp -y

Write-Verbose "Install WireShark"
choco upgrade wireshark -y

Write-Verbose "Install Baretail"
choco upgrade baretail -y

Write-Verbose "Reset Cache Location"
choco config set cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install Sql Server Management Studio"
choco upgrade sql-server-management-studio -y

Write-Verbose "Install NuGet Command Line"
choco upgrade nuget.commandline -y

Write-Verbose "Install Carnac"
choco upgrade carnac -y

Write-Verbose "Install Etcher"
choco upgrade etcher -y

Write-Verbose "Install Lessmsi"
choco upgrade lessmsi -y

Write-Verbose "Install VSWhere"
choco upgrade vswhere -y

Write-Verbose "Install Keypirinha"
choco upgrade keypirinha -y
keypirinha
# --Download keypirinha user ini file
Write-Verbose "Download Keypiranha user config"
invoke-webrequest -URI https://gist.githubusercontent.com/ian-noble/6fbf1f40ca818ce74a38b6ac94823239/raw/98048be2f2db7dd22d9494d90fb85e996a29a80d/keypirinha.ini -Outfile $env:appdata\keypirinha\user\keypirinha.ini

Write-Verbose "Install PuTTY"
choco upgrade putty -y

Write-Verbose "Install BeyondCompare"
choco upgrade beyondcompare -y

Write-Verbose "Install LinqPad"
choco upgrade linqpad -y

Write-Verbose "Install Postman"
choco upgrade postman -y

Write-Verbose "Install Insomnia"
choco upgrade insomnia-rest-api-client -y

Write-Verbose "Install Fiddler4"
choco upgrade fiddler -y

Write-Verbose "Install FileZilla"
choco upgrade filezilla -y

Write-Verbose "Install VLC"
choco upgrade vlc -y

Write-Verbose "Install Git"
choco install git -params '"/GitAndUnixToolsOnPath /WindowsTerminal /SChannel /NoAutoCrlf"' -y
choco upgrade git -y
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

git config --global user.name "Ian Noble"
#git config --global user.email "<removed>@<removed>"
git config --global credential.helper wincred
git config --global --bool pull.rebase true

Write-Verbose "Install SourceTree"
choco upgrade sourcetree -y

Write-Verbose "Install RoyalTS"
choco upgrade royalts -y

Write-Verbose "Install Kindle"
choco upgrade kindle -y

Write-Verbose "Install Rambox"
choco upgrade rambox -y

Write-Verbose "Install WiX Toolset"
choco upgrade wixtoolset -y

code --force --install-extension kumar-harsh.graphql-for-vscode 
code --force --install-extension humao.rest-client
code --force --install-extension ms-vscode.azurecli
code --force --install-extension ms-azuretools.vscode-azurefunctions
code --force --install-extension msazurermtools.azurerm-vscode-tools
code --force --install-extension VisualStudioOnlineApplicationInsights.application-insights
code --force --install-extension johnpapa.Angular2
code --force --install-extension formulahendry.auto-close-tag
code --force --install-extension formulahendry.auto-rename-tag
code --force --install-extension vsmobile.cordova-tools
code --force --install-extension abusaidm.html-snippets
code --force --install-extension eg2.vscode-npm-script
code --force --install-extension christian-kohler.npm-intellisense
code --force --install-extension eg2.tslint
code --force --install-extension PeterJausovec.vscode-docker
code --force --install-extension ryu1kn.annotator
code --force --install-extension codezombiech.gitignore
code --force --install-extension waderyan.gitblame
code --force --install-extension donjayamanne.githistory
code --force --install-extension eamodio.gitlens
code --force --install-extension shaharkazaz.git-merger
code --force --install-extension ipedrazas.kubernetes-snippets
code --force --install-extension brendandburns.vs-kubernetes
code --force --install-extension technosophos.vscode-helm
code --force --install-extension vsmobile.vscode-react-native
code --force --install-extension ms-vscode.PowerShell
code --force --install-extension bbenoist.vagrant
code --force --install-extension bungcip.better-toml
code --force --install-extension HookyQR.beautify
code --force --install-extension alefragnani.Bookmarks
code --force --install-extension formulahendry.code-runner
code --force --install-extension dbaeumer.vscode-eslint
code --force --install-extension blackmist.LinkCheckMD
code --force --install-extension emilast.LogFileHighlighter
code --force --install-extension mdickin.markdown-shortcuts
code --force --install-extension DavidAnson.vscode-markdownlint
code --force --install-extension christian-kohler.path-intellisense
code --force --install-extension alefragnani.project-manager
code --force --install-extension stkb.rewrap
code --force --install-extension Shan.code-settings-sync
code --force --install-extension robertohuertasm.vscode-icons

Write-Verbose "Uninstall 3D Builder"
Get-AppxPackage Microsoft.3DBuilder | Remove-AppxPackage

Write-Verbose "Uninstall Alarms"
Get-AppxPackage Microsoft.WindowsAlarms | Remove-AppxPackage

Write-Verbose "Disable PowerShell v2"
Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root

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

Write-Verbose "Install NuGet Package Explorer"
choco upgrade nugetpackageexplorer
if (test-path (Join-Path ([Environment]::GetFolderPath("Desktop")) "NugetPackageExplorer.exe.lnk")) {
    Move-Item (Join-Path ([Environment]::GetFolderPath("Desktop")) "NugetPackageExplorer.exe.lnk") (Join-Path ([Environment]::GetEnvironmentVariable("AppData")) "Microsoft\Windows\Start Menu\Programs\NugetPackageExplorer.lnk")
}

Write-Verbose "Restore UAC"
Enable-UAC

Write-Verbose "Check for / install Windows Updates"
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula

Write-Output "Complete"