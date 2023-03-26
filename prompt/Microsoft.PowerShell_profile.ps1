write-host "Hello World" -ForegroundColor Yellow
# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Am I the boss...
# Nope...Deb is
$IsAdmin = (New-Object Security.Principal.WindowsPrincipal ([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

# MS: "Who the hell do you think you are?"
# TF: "I'm Toby"
$CmdPromptUser = [Security.Principal.WindowsIdentity]::GetCurrent();

# Where the hell am I?
$CmdPromptCurrentFolder = Split-Path -Path $pwd -Leaf

# Show me where I am?
$host.ui.RawUI.WindowTitle = "Current Folder: $pwd"	

. e:\prompt\prompt.ps1