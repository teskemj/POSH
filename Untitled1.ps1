Get-AdUser -Filter * | where {$_.samaccountname -eq "rich"} |
     ForEach{ 
        $SID=$_.SID
        Get-EventLog System -Source Microsoft-Windows-WinLogon -ComputerName LPIDC2|
            Where{$_.ReplacementStrings[1] -eq $SID}
    } 