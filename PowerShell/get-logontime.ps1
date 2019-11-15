$user = $env:USERNAME
$date = get-date -Format d
$time = get-date -Format t

Write-Output "$user logged on $date at $time" | out-file -FilePath \\lpierp\data\logon\logon.txt -Append
Get-Content -