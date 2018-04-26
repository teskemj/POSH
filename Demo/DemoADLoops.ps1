# Search AD Objects
Search-ADAccount –LockedOut
Search-ADAccount –AccountDisabled -UsersOnly | select name
Search-ADAccount –PasswordExpired
Search-ADAccount –PasswordNeverExpires
Search-ADAccount –AccountInactive –timespan 90.00:00:01
help Search-ADAccount -full
get-adobject

New-ADOrganizationalUnit -path "ou=corp,dc=automate,dc=local" -Name "Super PowerShell"
Get-ADOrganizationalUnit -Filter 'name -like "super*"' | Set-ADOrganizationalUnit -ProtectedFromAccidentalDeletion $false


# Set User Attributes
get-aduser -filter * -SearchBase "ou=corp,dc=automate,dc=local" | set-aduser -Enabled $true -Department "PowerShell Gods"
get-aduser -filter * -SearchBase "ou=corp,dc=automate,dc=local" -properties * | select name,enabled,department
get-aduser -filter * -properties * | select *

get-aduser -filter 'description -like "*marv*"' -SearchBase "ou=corp,dc=automate,dc=local" | select name,enabled
get-aduser -filter * -SearchBase "ou=corp,dc=automate,dc=local" | select name,description
get-aduser -filter * -SearchBase "ou=corp,dc=automate,dc=local" -Properties * | select name,description
get-aduser -Filter * | set-aduser -Description "DC Comics"
get-aduser -filter 'name -like "*paper*"' -SearchBase "ou=corp,dc=automate,dc=local" |
Set-ADAccountPassword -NewPassword (ConvertTo-SecureString -String P@ssword -AsPlainText -Force)
$pwd = read-host "enter password" -AsSecureString

# Getting inactive objects
$inactiveDate=(get-date).AddDays(-1)
(Get-ADComputer -filter {(lastlogondate -le $inactivedate) -and (Passwordlastset -le $inactiveDate)} -Properties name,lastlogondate,created).count
Get-ADComputer -filter {(lastlogondate -le $inactivedate) -and (Passwordlastset -le $inactiveDate)} -Properties * | select name,lastlogondate,created
Get-ADUser -filter {(lastlogondate -le $inactivedate)} -Properties * | select name


# The simplest and most useful loop is foreach. These loop performs an operation for each of input objects
# http://social.technet.microsoft.com/wiki/contents/articles/4542.powershell-loops.aspx
$array = (get-service)[5..10]
ForEach ($value in $array) {

    Write-host $value.name `t`t $value.StartType | fw
}

# or
# $array = 1,2,3,4,5
# $array | ForEach {Write-Host $_}

# The While statement performs an operation until the condition is true.
# http://social.technet.microsoft.com/wiki/contents/articles/4542.powershell-loops.aspx
$a=1
while ($a -lt 10){

    "Hello, `$a equals $a. This is less than 10"
    $a+5
}

# For loop is standard loop to execute a specific number of times

For ($i=1; $i -le 5; $i++){  
                
    Write-Host $i
}

# Do while is executes as long as condition is true but in first time is always execute
# http://social.technet.microsoft.com/wiki/contents/articles/4542.powershell-loops.aspx
$i = 1
do {
    Write-Host $i; $i++
}
while ($i -lt 5)

# Do until works almost the same as do while but it executes until the condition is not true.
# http://social.technet.microsoft.com/wiki/contents/articles/4542.powershell-loops.aspx
$i = 6
do {
    Write-Host $i; $i++
}
until ($i -gt 5)

$array = 1..5 
switch ($array) {
    "Current element: $_"
} 

# Switch Region
$OSName = (Get-CimInstance -ClassName Win32_OperatingSystem).caption
switch -wildcard ($OSName) {
    "Microsoft Windows 7*" {"Great choice of $osname" | Out-File "OSOpinion.txt"}
    "Microsoft Windows 8*" {"Sorry to hear that you are running $osname" | Out-File "OSOpinion.txt"}
    "Microsoft Windows 10*" {"Gotta love Start Menu in $osname" | Out-File "OSOpinion.txt"}
    "Microsoft Windows Server 2012 R2*" {"So you are an ITPro?" | Out-File "OSOpinion.txt"}
    default {write-warning "Unexpected OS detected - are you still on XP?"}
}
notepad .\OSOpinion.txt
$i = 6
$j = 9
if (($i -lt 3) -or ($j -gt 6) ) {
    "it's less"

}else{
    "it's more"
}
