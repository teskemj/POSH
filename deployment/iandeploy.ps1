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
  Created: 2017-10-22
#>

Write-Verbose "Temporarily disable UAC"
Disable-UAC

Write-Verbose "Install Fonts: SourceCodePro"
choco upgrade sourcecodepro -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Configure Windows: Explorer Options"
Set-WindowsExplorerOptions -EnableShowFileExtensions -EnableShowHiddenFilesFoldersDrives -EnableShowFullPathInTitleBar

Write-Verbose "Configure Windows: Taskbar"
Set-TaskbarOptions -Size Small -Dock Top -Combine Full -AlwaysShowIconsOn

Write-Verbose "Install Windows Features: Microsoft-Windows-Subsystem-Linux"
choco install Microsoft-Windows-Subsystem-Linux -source windowsfeatures --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Trust PSGallery"
Get-PackageProvider -Name NuGet -ForceBootstrap
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

Write-Verbose "Installing Azure PowerShell modules"
Install-Module -Name AzureRM -Scope AllUsers
Install-Module -Name Azure -Scope AllUsers -AllowClobber

Write-Verbose "Install Microsoft Azure Storage Explorer"
choco upgrade microsoftazurestorageexplorer -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Installing AWS CLI"
choco upgrade awscli -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Installing Terraform"
choco upgrade terraform -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Installing posh-git and oh-my-posh"
Install-Module -Name posh-git -Scope AllUsers
Install-Module -Name oh-my-posh -RequiredVersion 2.0.114 -Scope AllUsers

Write-Verbose "Install SysInternals"
choco upgrade sysinternals -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install ShareX (Screenshots)"
choco upgrade sharex -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install ScreenToGif"
choco install screentogif -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install Visual Studio Code"
choco upgrade visualstudiocode -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install Markdown Master"
choco upgrade markdownmonster -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install ClipboardFusion"
choco upgrade clipboardfusion -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install AutoHotKey"
choco upgrade autohotkey.install -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install Visual Studio Code Extensions"
code --install-extension kumar-harsh.graphql-for-vscode
code --install-extension humao.rest-client
code --install-extension ms-vscode.azurecli
code --install-extension ms-azuretools.vscode-azurefunctions
code --install-extension msazurermtools.azurerm-vscode-tools
code --install-extension VisualStudioOnlineApplicationInsights.application-insights
code --install-extension johnpapa.Angular2
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension vsmobile.cordova-tools
code --install-extension abusaidm.html-snippets
code --install-extension eg2.vscode-npm-script
code --install-extension christian-kohler.npm-intellisense
code --install-extension eg2.tslint
code --install-extension PeterJausovec.vscode-docker
code --install-extension ryu1kn.annotator
code --install-extension codezombiech.gitignore
code --install-extension waderyan.gitblame
code --install-extension donjayamanne.githistory
code --install-extension eamodio.gitlens
code --install-extension shaharkazaz.git-merger
code --install-extension ipedrazas.kubernetes-snippets
code --install-extension brendandburns.vs-kubernetes
code --install-extension technosophos.vscode-helm
code --install-extension vsmobile.vscode-react-native
code --install-extension ms-vscode.PowerShell
code --install-extension bbenoist.vagrant
code --install-extension bungcip.better-toml
code --install-extension HookyQR.beautify
code --install-extension alefragnani.Bookmarks
code --install-extension formulahendry.code-runner
code --install-extension dbaeumer.vscode-eslint
code --install-extension blackmist.LinkCheckMD
code --install-extension emilast.LogFileHighlighter
code --install-extension mdickin.markdown-shortcuts
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension christian-kohler.path-intellisense
code --install-extension alefragnani.project-manager
code --install-extension stkb.rewrap
code --install-extension Shan.code-settings-sync
code --install-extension robertohuertasm.vscode-icons

Write-Verbose "Install Google Chrome"
choco upgrade googlechrome -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install Cmder Mini"
choco upgrade cmdermini -y --cacheLocation "$env:temp\chocolatey"
mkdir C:\tools\cmdermini\config\
invoke-webrequest -URI https://gist.githubusercontent.com/ian-noble/eab10f92c207c1deeb589cd135025d3c/raw/7134c2ffaa0461a145d12fad58acf5dd95164f40/ConEmu.xml -Outfile C:\tools\cmdermini\config\ConEmu.xml

Write-Verbose "Install Packer"
choco upgrade packer -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install Pester"
choco upgrade pester -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install PowerBI"
choco upgrade powerbi -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install WinSCP"
choco upgrade winscp -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install WireShark"
choco upgrade wireshark -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install Baretail"
choco upgrade baretail -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install Sql Server Management Studio"
choco upgrade sql-server-management-studio -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install NuGet Command Line"
choco upgrade nuget.commandline -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install Carnac"
choco upgrade carnac -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install Etcher"
choco upgrade etcher -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install Lessmsi"
choco upgrade lessmsi -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install VSWhere"
choco upgrade vswhere -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install Keypirinha"
choco upgrade keypirinha -y --cacheLocation "$env:temp\chocolatey"
keypirinha
# --Download keypirinha user ini file
Write-Verbose "Download Keypiranha user config"
invoke-webrequest -URI https://gist.githubusercontent.com/ian-noble/6fbf1f40ca818ce74a38b6ac94823239/raw/98048be2f2db7dd22d9494d90fb85e996a29a80d/keypirinha.ini -Outfile $env:appdata\keypirinha\user\keypirinha.ini

Write-Verbose "Install PuTTY"
choco upgrade putty -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install BeyondCompare"
choco upgrade beyondcompare -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install LinqPad"
choco upgrade linqpad -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install Postman"
choco upgrade postman -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install Insomnia"
choco upgrade insomnia-rest-api-client -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install Fiddler4"
choco upgrade fiddler4 -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install FileZilla"
choco upgrade filezilla -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install VLC"
choco upgrade vlc -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install Git"
choco install git -params '"/GitAndUnixToolsOnPath /WindowsTerminal"' -y --cacheLocation "$env:temp\chocolatey"
choco upgrade git -y --cacheLocation "$env:temp\chocolatey"
refreshenv
git config --global user.name "Ian Noble"
#git config --global user.email "<removed>@<removed>"
git config --global credential.helper wincred
git config --global --bool pull.rebase true

refreshenv
Write-Verbose "Install SourceTree"
choco upgrade sourcetree -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install RoyalTS"
choco upgrade royalts -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install Kindle"
choco upgrade kindle -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install Rambox"
choco upgrade rambox -y --cacheLocation "$env:temp\chocolatey"

Write-Verbose "Install WiX Toolset"
choco upgrade wixtoolset -y --cacheLocation "$env:temp\chocolatey"

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