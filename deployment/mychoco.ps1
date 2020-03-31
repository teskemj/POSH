Set-ExecutionPolicy RemoteSigned
. { Invoke-WebRequest -useb http://boxstarter.org/bootstrapper.ps1 } | Invoke-Expression; get-boxstarter -Force
powercfg -h off
choco install powershell-core -y
choco install microsoft-edge -y
choco install microsoft-windows-terminal -y
choco install vscode -y; choco install microsoft-edge -y
choco search vmware
choco install vmwareworkstation -y
choco install dropbox -y
choco install googledrive -y
choco install slack -y
Rename-Computer blackbox -restart
choco install camtasia 2019 -y
choco install camtasia -y
choco install git -y
choco install azure-cli -y; 
choco install azure-data-studio-sql-server-admin-pack -y
choco install git -y; choco install forticlient -y
choco install forticlientvpn -y
choco install brave
choco install azure-data-studio-sql-server-admin-pack -y
choco install azurestorageexplorer -y
choco install sql-server-management-studio -y