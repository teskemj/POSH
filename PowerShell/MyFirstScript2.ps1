<# MyFirstScript.ps1
Author: Michael Teske
Date: today
Purpose: Retrieve running services and IP Addresse configuratoin
#>

#Get Running Services
$Header ='__________________'
$NL=''
Write-Output $Header | out-file c:\scripts\teskefirstcript.txt
Write-Output "Running Services" | out-file c:\scripts\teskefirstcript.txt
 Write-Output $Header | out-file c:\scripts\teskefirstcript.txt
get-service | Where-Object {$_.status -eq 'running'} | Select-Object name,status | out-file c:\scripts\teskefirstcript.txt
$NL
$Header
#Get IP Information
$IPs = get-netadapter | where {$_.status -eq 'up'} | Get-netipaddress | where {$_.addressfamily -eq 'ipv4'} | select -ExpandPr
operty IPaddress
$dns = get-netadapter | where {$_.status -eq 'up'} | Get-DnsClientServerAddress | select -ExpandProperty serveraddresses
$nics = Get-NetAdapter
$nics | foreach {
    ""
    "Adapter '" + $_.interfacealias + "' Index=" + $_.ifindex + " Status=" + $_.status + ":"
    ""
    " " + "Description ............: " + $_.InterfaceDescription 
    " " + "Link Speed..............: " + $_.LinkSpeed
    " " + "Physical Address....... : " + $_.MacAddress
    ""
    $defaultgateway = (get-netroute -InterfaceIndex $_.ifIndex | Where {$_.DestinationPrefix -like "0.0.0.0*"}).NextHop

    $dnsservers = (get-dnsclientserveraddress -interfaceindex $_.ifindex).serveraddresses
    " " + "DNS Server(s).......... : " + $dnsservers

    $ipaddress = get-netipaddress -interfaceindex $_.ifindex 
    $ipaddress |foreach {
        #grab each IP, collect the ipaddress type, address, the
        # CIDR-type subnet mask length and source and report

        " " + $_.addressfamily + " Address........... : " + $_.ipaddress + "/" + $_.PrefixLength
        " Source of Address.......: " + $_.SuffixOrigin
    }

}
