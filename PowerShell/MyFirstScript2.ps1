<# MyFirstScript.ps1
Author: Michael Teske
Date: today
Purpose: Retrieve running services and IP Addresse configuratoin
#>

#Get Running Services
$Header = '__________________'
$NL = ''
Write-Output $Header | out-file c:\scripts\teskefirstcript.txt
Write-Output "Running Services" | out-file c:\scripts\teskefirstcript.txt
Write-Output $Header | out-file c:\scripts\teskefirstcript.txt
get-service | Where-Object {$_.status -eq 'running'} | Select-Object name, status | out-file c:\scripts\teskefirstcript.txt
$NL
$Header
#Get IP Information
$IPs = get-netadapter | where {$_.status -eq 'up'} | Get-netipaddress | where {$_.addressfamily -eq 'ipv4'} | select -ExpandProperty IPaddress
$dns = get-netadapter | where {$_.status -eq 'up'} | Get-DnsClientServerAddress | select -ExpandProperty serveraddresses
"IP Addresses...." + $IPs[0]
"................" + $IPs[1]
"DNS Servers....." + $dns[0]