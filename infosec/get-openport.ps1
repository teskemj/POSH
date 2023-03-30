$computer1 = Read-Host "Enter the remote computer name"
$ports = 1..65535

foreach ($port in $ports) {
    $socket = New-Object Net.Sockets.TcpClient
    $connection = $socket.BeginConnect($computer1, $port,$null,$null)
    Start-Sleep -Milliseconds 100

    if ($connection.AsyncWaitHandle.WaitOne(100, $false)) {
        Write-Host "Port $port is open" -ForegroundColor Green
    } else {
        Write-Host "Port $port is closed" -ForegroundColor Red
    }

    $socket.EndConnect($connection)
}
