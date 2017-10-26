resolve-dnsname google.com
resolve-dnsname google.com | select *
resolve-dnsname www.microsoft.com | select *
test-netconnection google.com -TraceRoute
get-command -Module net* | group module
get-command -module netnat
help new-netnat
Get-NetIPAddress | Sort InterfaceIndex | FT InterfaceIndex, InterfaceAlias, AddressFamily, IPAddress, PrefixLength -Autosize
get-netipaddress | where AddressFamily -eq ipv4 | ft -AutoSize
get-netipaddress | where AddressFamily -eq ipv4 | select -ExpandProperty ipaddress
get-netadapter wi-fi | get-netipaddress | ft -AutoSize
Test-NetConnection www.microsoft.com -InformationLevel Detailed
Test-NetConnection www.microsoft.com | select -ExpandProperty pingreplydetails | ft address,status,roundtriptime
1..10 | foreach { Test-NetConnection -computername www.microsoft.com -RemotePort 80 } | ft -AutoSize
resolve-dnsname www.microsoft.com
resolve-dnsname www.microsoft.com -Type mx
resolve-dnsname www.microsoft.com -Server 8.8.8.8 -Type a
get-netroute -Protocol local -DestinationPrefix 172.*
get-netroute -Protocol local -DestinationPrefix 10.*
get-netadapter
get-netadapter ethernet | get-netroute
Get-NetAdapter ethernet
Get-NetAdapter ethernet | get-netroute
Get-NetAdapter "ethernet 2" | get-netroute
test-netconnection www.microsoft -traceroute
test-netconnection www.microsoft.com -traceroute
test-netconnection outlook.com -traceroute | select -ExpandProperty traceroute | foreach {Resolve-DnsName $_ -Type ptr -ErrorAction SilentlyContinue }
Get-NetTCPConnection
Get-NetTCPConnection | group state,remoteport | sort count | ft count,name -AutoSize
Get-NetTCPConnection | where state -eq established | ft -AutoSize
Get-NetTCPConnection | where state -eq established | where RemoteAddress -notlike 127* | foreach { $_;Resolve-DnsName $_.RemoteAddress -Type ptr -ErrorAction SilentlyContinue }
h
c:
cd scripts
cd\
cd .\Users\11568034\posh\
