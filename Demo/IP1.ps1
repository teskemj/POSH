# Grab IP enabled NICs

$NICS = Get-WmiObject Win32_NetworkAdapterConfiguration -ComputerName localhost -ErrorAction Stop | where {$_.IPEnabled}

# Testing
# Process through each NIC in NICS
foreach ($NIC in $NICs) {
    
        $ip=$NIC.IpAddress[0]
        #get rid of the Microsoft Automated IP
        if ($ip -notlike "169.254*"){
            $sn=$NIC.IPSubnet[0]        
            #assigning the output to a var allows for better output. Eliminates the {}
            $gw=$NIC.DefaultIPGateway
            $dns=$NIC.DNSServerSearchOrder
            "IP: $ip"
            "SN: $sn"
            "GW: $gw"
            "DN: $dns"
            ""
    }
  
}           

  

