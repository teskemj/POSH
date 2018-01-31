Function Get-MonitorInfo {
    <#
    .SYNOPSIS
        Retrieve Monitor information from local and remote hosts
    .DESCRIPTION
        Retrieve Monitor information from local and remote hosts
    .EXAMPLE
        PS C:\> get-monitor
        Gets the monitor information from localhost
    .EXAMPLE
        PS C:\> get-monitor -computername DC,PC-001
        Gets the monitor information from remote systems DC, PC-001

    #>
    [CmdletBinding()]
    param(
        [string]$computername
    )
    $Monitor = Get-WMIObject wmiMonitorID -namespace root\wmi
    $Computer = Get-CimInstance -ClassName CIM_ComputerSystem -computername $computername
    $Bios = Get-CimInstance -ClassName CIM_BIOSElement -computername $computername

    #create custom object set empty values
    $psObject = New-Object PSObject
    $psObject | Add-Member NoteProperty ComputerName ""
    $psObject | Add-Member NoteProperty ComputerType ""
    $psObject | Add-Member NoteProperty ComputerSerial ""
    $psObject | Add-Member NoteProperty MonitorSerial ""
    $psObject | Add-Member NoteProperty MonitorType ""

 
    ForEach ($item in $Monitor) {
        $psObject.ComputerName = $env:computername
        $psObject.ComputerType = $Computer.model
        $psObject.ComputerSerial = $Bios.SerialNumber 
        $psObject.MonitorSerial = ($item.SerialNumberID -ne 0 | % {[char]$_}) -join ""
        $psObject.MonitorType = ($item.UserFriendlyName -ne 0 | % {[char]$_}) -join ""
 
        $psObject 
 
    }
}