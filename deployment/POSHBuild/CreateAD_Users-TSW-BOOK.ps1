#import Active Directory Module
Import-Module ActiveDirectory

#Assign the contents of the ImportUsers.csv to the variabl $ucsv using the import-csv cmdlet
$ucsv=import-csv g:\Poshbuild\ImportUsers.csv

#begin foreach loop. $line is each row in the $ucsv file. The header of each column is represented in the $line.xxx within New-ADUser parameter
foreach ($line in $ucsv)
{ 
New-ADUser -Name $line.Name -SamAccountName $line.SamAccountName -Department $line.Department -Path $line.Path -OfficePhone $line.OfficePhone -AccountPassword (ConvertTo-SecureString $line.AccountPassword -AsPlainText -force)
}

#Finish up! You have to add the groups before you can add them users to them.
#Add users to their department's security group
#ADD-ADGroupMember “InfoTech_Group” –members “James.Kirk","Sam.Malone","Ryan.Howard","Daryll.Philbin"
#ADD-ADGroupMember “Accounting_Group” –members “Angela.Martin","Kevin.Malone","Oscar.Martinez","Cosmo.Kramer"
#ADD-ADGroupMember “Developers_Group” –members “Peter.Gibbons","Michael.Bolton","Tom.Smykowski","Bill.Lumbergh"
#ADD-ADGroupMember “Manufacturing_Group” –members “Michael.Scott","Milton.Waddams","Bob.Slydell","Bob.Porter"