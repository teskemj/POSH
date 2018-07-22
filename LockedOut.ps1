Search-ADAccount –LockedOut
Search-ADAccount –AccountDisabled -UsersOnly
Search-ADAccount –PasswordExpired
Search-ADAccount –PasswordNeverExpires
Search-ADAccount –AccountInactive –timespan 90.00:00:01
Search-ADAccount –ComputersOnly

#Getting inactive objects
$inactiveDate=(get-date).AddDays(-3)

(Get-ADComputer -filter {(lastlogondate -le $inactivedate) -and (Passwordlastset -le $inactiveDate)} -Properties name,lastlogondate,created).count

Get-ADComputer -filter {(lastlogondate -le $inactivedate) -and (Passwordlastset -le $inactiveDate)} -Properties name,lastlogondate,created

Get-ADUser -filter {(lastlogondate -le $inactivedate)} -Properties * 


