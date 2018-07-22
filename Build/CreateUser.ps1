Function Create-User ()
{

$fname=Read-host "What is the employee's first name?"
$lname=Read-host "What is the employee's last name?"
$dept=Read-host "What department will this person be working in?"
$HomeOU=$dept + "_OU"
$path="OU=$HomeOU,DC=Contoso,DC=local"
$SecGroup=$dept+"_Group"
$Password = "Password101"
$setpass = ConvertTo-SecureString $Password -AsPlainText -force
$CN="Cn=$SecGroup,path"


##Create User using data from above

    $SamAccountName = "$fname.$lname"
    New-ADUser -SamAccountName $SamAccountName -Name "$fname $lname" `
                -Path $path `
                -AccountPassword $setpass `
                -ChangePasswordAtLogon $True `
                -Department $dept `
                -Company 
      
                -Enabled $True -Verbose
##Add User to Group

    Add-ADGroupMember -Identity $cn -Members $SamAccountName
}
