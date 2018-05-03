function Get-OSInfo {
    <#
.SYNOPSIS
    Retrieves OS info
.DESCRIPTION
    Retrieves OS info
.EXAMPLE
    get-osinfo -computername server1

#>
    param(
        [string]$computername
    )
    get-ciminstance -ClassName Win32_OperatingSystem -ComputerName $computer | Format-list BuildNumber, Caption, ServicePackMajorVersion

}

function Get-ServiceStartType {
    <#
.SYNOPSIS
    Retrieves services based on starttype
.DESCRIPTION
    Retrieves services based on starttype
.EXAMPLE
    get-servicestarttype -computername server1 -startype disabled
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    General notes
#>
    # Parameter help description
    [Parameter(Mandatory = $true)]
    [string]$computername = 'localhost',
    
    # Parameter help description
    [Parameter(Mandatory = $true)]
    [ValidateSet ('automatic', 'manual', 'disabled')]
    [string]$starttype
    
    get-service -ComputerName $computername | where StartType -eq $starttype
}
