<#
    Use this script to enter a remote session with your server and create folders and index.html files for each department
#>
# Change to YOUR webserver name. Make sure the name has single quotes.
$computername = 'MT-Web1'

# Create a PSSession (remote powershell session) with your webserver
New-PSSession -ComputerName $computername
Enter-pssession -Id 7 # change ID to whatever is displayed when you run New-PSSession. First column.

# Add missing departments
$departments = "Accounting","Sales","Info","Manufacturing"

# Process each department, checking to see if the folder exists. If not, create the deparmental folder
foreach ($dep in $departments){
    if (!(Test-Path c:\mywebstuff\$dep)){
        New-Item -path c:\mywebstuff\$dep -ItemType directory -Verbose
    }
    write-output "Welcome to $dep" | out-file C:\mywebstuff\$dep\index.html -Verbose
}

Exit-PSSession