# # TO INSTALL THIS:
# Create a folder called \WindowsPowerShell\Modules\ifconfig\ in your Documents folder.
# Copy this text, paste it into Notepad, and save it in the ifconfig folder as
# "ifconfig.psm1" and yes, that's right -- the file's name must match the folder
# name.
# Start up PowerShell, type "get-ipinfo," and it'll run.
Function Get-IPInfo {
    <#
    .SYNOPSIS 
    Generates a summary report on your NIC and IP status.
    
    .DESCRIPTION
    Get-IPInfo tries to offer output like the venerable ipconfig command, but
    in a somewhat more concise fashion, adding a few new bits of information
    provided by Windows 8 and 2012's in-the-box cmdlets, including link speed.
    
    .INPUTS
    None. Get-IPInfo doesn't take any input parameters, nor does it make use
    of pipeline input. And the fact that Help claims that it takes the common
    parameters just plain isn't true -- this cmdlet was built by a guy who 
    knows very little about PowerShell scripting.
    
    .OUTPUTS
    Just text, with hope self explanatory text.
    
    .Link
    get-netadapter inventoried the adapters -- just the real ones  -- and
    provided NIC name, index, description, link speed, MAC address
    and more.
    
    get-netipaddress provided the IP addresses, subnet mask size, 
    source (DHCP or manual).
    
    get-netroute provided the default gateways.
    
    get-DNSClientGlobalSetting provided the DNS suffix search path.
    
    get-DNSClientServerAddress provided the DNS servers.
    
    #>
    
    
    PROCESS {
    
    <#
    Collect the old stuff... hostname, suffix info. All pre-.NET so we've got to go to the
    Registry for the suffix.
    #>
    
    # This command reads the environment variable "COMPUTERNAME=" and stores
    # it in a variable I just created called $Hostname. Get-content basically
    # retrieves what's in something like an environment variable or a file.
    # Name of variables in PowerShell, by the way, always start with a dollar sign.
    
    $Hostname = Get-CimInstance -ClassName Win32_ComputerSystem | select -ExpandProperty name
    
    # Next, get the suffix from the Registry. To do that, we examine the TCPIP/Parameters
    # Registry key, using Get-ItemProperty, and that's the roundabout way we've got to do
    # in PowerShell to THEN retrieve the value of a Registry entry in that key, "NV Domain."
    
    $PrimaryDNSSuffix = (Get-ItemProperty HKLM:\System\CurrentControlSet\Services\Tcpip\Parameters)."NV Domain"
    
    # The DNS suffix search list is a bit easier, as one of the new PowerShell net-related
    # cmdlets contains it. If you were to type "Get-DnsClientGlobalSetting", you'd get 
    # several lines of output, including "SuffixSearchList." This syntax lets me capture
    # it into a variable I just created called "$DNSSuffixSearchList"
    
    $DNSSuffixSearchList = (Get-DnsClientGlobalSetting).suffixsearchlist
    
    # Time to produce some actual output. Just type the strings that you'd like
    # PowerShell to display, and use the plus sign to glue two strings together.
    
    # Write title and NIC section
    ""
    "Windows IP Configuration"
    ""
    " Host Name................: " + $Hostname 
    " Primary DNS Suffix.......: "+ $PrimaryDNSSuffix
    " DNS Suffix Search List...: " + $DNSSuffixSearchList 
 

    $NICs=get-netadapter
    
    # Now that I've got my bunch of NIC objects in $NICs, I want PowerShell to analyze
    # and report on each one at a time, looping from the first to the last.
    # 
    # The PowerShell command to do that is "foreach." Simply typing
    # $NICs
    # and pressing Enter would cause PowerShell to dump out everything it knows on 
    # the screen, which would be way too chaotic and unrefined, so instead I can 
    # use foreach to do the looping for me. Basically foreach looks like
    #
    # $NICs | foreach {command1; command2; command3...}
    #
    # Which causes foreach to grab the info on the first NIC and do command1, then 
    # command2, and then command3, then get the next NIC and do commands1, 2, and
    # 3, and so on. Because I'm going to want to do a lot of things to each NIC
    # it'll be more than three commands, AND it'll stretch over a fair number of 
    # lines. Watch the "{" and its matching "}" to see the span of commands that
    # foreach will do for us, but if you do, notice that we'll end up with TWO
    # foreach commands -- one "nested" inside another.
    #
    
    $NICs | ForEach-Object { 
    
    Write-Output ""
    
    # Next, list the adapter's name, its index number and status as its section heading
    
    
    "Adapter '" + $_.interfacealias + "' Index=" + $_.ifindex + " Status="+$_.status + ":"
    
    ""
    # And then a series of statistics about this NIC
    # They're just properties from this particular NIC's object
    
    " " + "Description ............: " + $_.InterfaceDescription 
    " " + "Link Speed..............: " + $_.LinkSpeed
    " " + "Physical Address....... : " + $_.MacAddress
    
    # Next, default gateway. In theory every NIC has only one default gateway,
    # but get-netadapter does not include that info. Instead, we'll use another
    # cmdlet, "get-netroute" and pass it the index number of this NIC, like
    # get-netroute -InterfaceIndex 12
    # THAT gives us an object that is the routing table for that NIC.
    # We then just look for the route whose "NextHop" is "0.0.0.0" -- the address that means
    # "the whole world" -- and whatever address it tells us to use to get to
    # the whole world is the default gateway.
    # The "Where" stuff is where we pluck off JUST the line with the gateway.
    # We store that in $defaultgateway. 
    
    $defaultgateway=(get-netroute -InterfaceIndex $_.ifIndex | Where {$_.DestinationPrefix -like "0.0.0.0*"}).NextHop
    
    #Now that we've got it, print it out
    
    " " + "Default Gateway........ : " + $defaultgateway
    
    # Next, use yet another cmdlet, get-DnsClientServerAddress,
    # to retrieve the DNS servers associated with the NIC,
    # and as we've done before, report them
    
    $dnsservers = (get-dnsclientserveraddress -interfaceindex $_.ifindex).serveraddresses
    " " + "DNS Server(s).......... : " + $dnsservers
    
    # There's one more thing we need to know about this NIC... its
    # IP address or, more likely nowadays, IP addressES. As we do
    # not know how many NICs are there, it's time for another
    # foreach, and a cmdlet that will give us an object for each
    # IP address on our current NIC. That cmdlet is the get-
    # newipaddress. Note again that we're doing a foreach INSIDE
    # a foreach.
    
    $ipaddress=get-netipaddress -interfaceindex $_.ifindex 
    $ipaddress |foreach {
    #grab each IP, collect the ipaddress type, address, the
    # CIDR-type subnet mask length and source and report
    
    " "+$_.addressfamily+ " Address........... : " + $_.ipaddress + "/" +$_.PrefixLength
    " Source of Address.......: " + $_.SuffixOrigin
    }
    # Done with that IP address, on to the next address
    ""
    } # Done with that NIC, leave a blank line and on to the next one
    } # And now we're done!
}
     