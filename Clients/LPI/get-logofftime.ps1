$user = $env:USERNAME
$date = get-date -Format d
$time = get-date -Format t

try {
    
}
catch {
    
}

Write-Output "$user logged out on $date at $time" | out-file -FilePath \\lpierp\data\logon\logon.txt -Append
