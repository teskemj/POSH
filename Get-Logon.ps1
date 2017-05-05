get-eventlog -LogName Security -ComputerName lpidc2 -Before ((get-date).AddDays(-10)) -UserName "internal\rich" | where {$_.eventid -eq "4624"}
get-eventlog -LogName Security -ComputerName lpidc2 -Before (get-date) -After (get-date).AddDays(-10) -UserName internal\rich

Get-EventLog security -computername lpidc2 -source microsoft-windows-security-auditing - |
    where {($_.instanceID -eq 4624) -and ($_.replacementstrings[5] -eq 'rich')} | 
    select * | out-file rich.txt