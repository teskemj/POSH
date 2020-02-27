#import Active Directory Module
Import-Module ActiveDirectory

#Assign the contents of the ImportOUs.csv to the variabl $csv using the import-csv cmdlet
$csv= import-csv e:\somepath\ImportOUs.csv

#begin foreach loop. $line is each row in the $csv file. The header of each column is represented in the $line.xxx within New-ADOrganizationalUnit parameter
foreach ($line in $csv)
{
	New-ADOrganizationalUnit -Name $line.Name -Description $line.Description -DisplayName $line.DisplayName -Path $line.Path -ProtectedFromAccidentalDeletion $False
}