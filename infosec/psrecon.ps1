# Basic PowerShell Script for Forensic Analysis of a Windows 11 PC

# Set output file path
$outputFile = "ForensicAnalysisOutput.txt"

# Clear existing output file, if any
if (Test-Path $outputFile) {
    Remove-Item $outputFile
}

# Gather and output current user information
Write-Output "Current User:" | Out-File $outputFile -Append
whoami | Out-File $outputFile -Append
Write-Output "`n" | Out-File $outputFile -Append

# Gather and output installed programs
Write-Output "Installed Programs:" | Out-File $outputFile -Append
Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion | Out-File $outputFile -Append
Write-Output "`n" | Out-File $outputFile -Append

# Gather and output network connections
Write-Output "Network Connections:" | Out-File $outputFile -Append
Get-NetTCPConnection | Where-Object { $_.State -eq "Established" } | Out-File $outputFile -Append
Write-Output "`n" | Out-File $outputFile -Append

# Gather and output running processes
Write-Output "Running Processes:" | Out-File $outputFile -Append
Get-Process | Out-File $outputFile -Append
Write-Output "`n" | Out-File $outputFile -Append

# Gather and output startup items
Write-Output "Startup Items:" | Out-File $outputFile -Append
Get-CimInstance -ClassName Win32_StartupCommand | Select-Object Name, Location, CommandLine | Out-File $outputFile -Append
Write-Output "`n" | Out-File $outputFile -Append

# Show completion message
Write-Output "Forensic analysis data saved to: $outputFile"

#Paolo Frigo, scriptinglibrary.com
#Ping Sweep
(1..254) | % {$ip="192.168.0.$_"; Write-output "$IP  $(test-connection -computername "$ip" -quiet -count 1)"}
(1..254) | % {$ip="192.168.0.$_"; ping $ip -c 1}