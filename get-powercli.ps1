. "C:\Program Files (x86)\VMware\Infrastructure\PowerCLI\Scripts\Initialize-PowerCLIEnvironment.ps1" $true
get-vm s2012* | get-networkadapter | Set-NetworkAdapter -NetworkName Internet-26
get-vm s2016-core-13 | get-networkadapter | Set-NetworkAdapter -NetworkName Internet-26
get-vm s2016-core-* | get-networkadapter | Set-NetworkAdapter -NetworkName Internet-26
get-vm s201* | get-networkadapter | Select name
get-vm s201* | get-networkadapter | Select NetworkName
cd .\Users\11568034\posh\
