Enable-PSRemoting
Enable-PSRemoting -Force
Set-WSManQuickConfig -Force
Get-NetFirewallProfile
Get-NetAdapter
Get-NetFirewallProfile -interfacealias ethernet
Get-NetConnectionProfile -interfacealias ethernet
Get-NetConnectionProfile
Get-NetConnectionProfile -InterfaceAlias "vEthernet (extNET)"
Set-NetConnectionProfile -InterfaceAlias "vEthernet (extNET)" -NetworkCategory Private
Enable-PSRemoting
Set-NetConnectionProfile -InterfaceAlias "vEthernet (intNET)" -NetworkCategory Private
Enable-PSRemoting