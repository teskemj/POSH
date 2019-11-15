function Reset-SWADPassword
<#
.Synopsis
   Reset the password for specified user to a random password.
.DESCRIPTION
   Uses the functions New-SWRandomPassword and Get-Phonetic to generate a random
   password with specified length, reset the specified user's password and display
   the new password with phonetic spelling.
 
   Will unlock specified user and unless the parameter -NoChange is specified the user
   will have to change its password on next logon.
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
#>
{
    [cmdletbinding(SupportsShouldProcess=$true,ConfirmImpact='Medium')]
    param(
        # Identity of user that should have their pasword reset
        [Parameter(Mandatory=$true)]
        [Alias('DistinguishedName')]
        [String]$Identity,
 
        # Length of password that will be generated
        [ValidateRange(1,[int]::MaxValue)]
        [int]$Length = 8,
 
        # Specifies an array of strings containing charactergroups from which the password will be generated.
        # At least one char from each group (string) will be used.
        [String[]]$InputStrings = @('abcdefghijkmnopqrstuvwxyz', 'ABCEFGHJKLMNPQRSTUVWXYZ', '23456789', '!"#%&'),
 
        # Specifies that the user will not have to change their password on next logon
        [Switch]$NoChange
    )
    Try
    {
        $Password = New-SWRandomPassword -PasswordLength $Length -InputStrings $InputStrings
        $SecPaswd = ConvertTo-SecureString -String $Password -AsPlainText -Force
        if($PSCmdlet.ShouldProcess("`n$DistinguishedName",'Reset password'))
        {
            $ADUser = Set-ADAccountPassword -Reset -NewPassword $SecPaswd -Identity $Identity -PassThru -Confirm:$false -WhatIf:$false -ErrorAction Stop
            Write-Verbose -Message 'Password reset successfully'
            if(-Not $NoChange)
            {
                Set-ADUser -ChangePasswordAtLogon $true -Identity $ADUser -Confirm:$false -WhatIf:$false -ErrorAction Stop
                Write-Verbose -Message 'Change password at logon set to True'
            }
            Unlock-ADAccount -Identity $ADUser -Confirm:$false -WhatIf:$false -ErrorAction Stop
            Write-Verbose -Message 'Useraccount unlocked'
            Get-Phonetic -Char $Password
        }
    }
    Catch
    {
        Throw $_
    }
}