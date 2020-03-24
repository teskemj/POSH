#import Active Directory Module
Import-Module ActiveDirectory

#Assign the contents of the ImportUsers.csv to the variabl $ucsv using the import-csv cmdlet
#Modify the location to your environment.
$ucsv = Import-Csv d:\repos\Posh\deployment\POSHBuild\lakes-test.csv
#begin foreach loop. $line is each row (single object in the collection) in the $ucsv file. The header of each column is represented in the $line.xxx within New-ADUser parameter
foreach ($line in $ucsv) { 

    New-ADUser -Name $line.displayname -SamAccountName $line.FirstName -Department $line.Department`-office $line.office -userprincipalname $line.userprincipalname `
        -Path $line.Path -OfficePhone $line.OfficePhone -AccountPassword (ConvertTo-SecureString $line.AccountPassword -AsPlainText -force) -country $line.country -surname $line.lastname -firstname $line.FirstName

}

#Finish up! You have to add the groups before you can add them users to them.
#Add users to their department's security group
#ADD-ADGroupMember “InfoTech_Group” –members “James.Kirk","Sam.Malone","Ryan.Howard","Daryll.Philbin"
#ADD-ADGroupMember “Accounting_Group” –members “Angela.Martin","Kevin.Malone","Oscar.Martinez","Cosmo.Kramer"
#ADD-ADGroupMember “Developers_Group” –members “Peter.Gibbons","Michael.Bolton","Tom.Smykowski","Bill.Lumbergh"
#ADD-ADGroupMember “Manufacturing_Group” –members “Michael.Scott","Milton.Waddams","Bob.Slydell","Bob.Porter"

$users = Get-Content C:\tools\POSHBuild\users.txt
#begin foreach loop. $line is each row (single object in the collection) in the $ucsv file. The header of each column is represented in the $line.xxx within New-ADUser parameter
foreach ($line in $users) { 
    @{ }
    New-ADUser -Name $line -SamAccountName $line -Department "Manufacturing" -userprincipalname "$line@lakesprecision.com" 
    -Path "ou=scanners,ou=threelakes,dc=ad,dc=lakesprecision -OfficePhone $line.OfficePhone -AccountPassword (ConvertTo-SecureString "chouChoe^54301, " -AsPlainText -force) -country $line.country -surname $line.lastname -givenname $line.FirstName
'this is ' + $line

}

$userparams = @{
    name = $line
    SamAccountName = $line
    Department = "Manufacturing"
    UserPrincipalName = "$line@lakesprecision.com"
    path = "ou=scanners, ou=threelakes, dc=ad, dc=lakesprecision"
    AccountPassword = (ConvertTo-SecureString "chouChoe^54301, " -asplaintext -force)
    city = "Three Lakes"
    Country = "US"
    GivenName = $line
    Company = "Lakes Precision"
    State = "WI"
    Surname = "Precision"
}

}
