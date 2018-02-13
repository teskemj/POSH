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
    .INPUTS
        Inputs (if any)
    .OUTPUTS
        Output (if any)
    .NOTES
        General notes
    #>
    [CmdletBinding()]
    param(
        [string[]] $computername = "localhost"
    )
    $Monitor = Get-CimInstance -ClassName wmiMonitorID -Namespace root/WMI
    $Computer = Get-CimInstance -ClassName CIM_ComputerSystem
    $Bios = Get-CimInstance -ClassName CIM_BIOSElement

    #create custom object set empty values
    $psObject = New-Object PSObject
    $psObject | Add-Member NoteProperty ComputerName ""
    $psObject | Add-Member NoteProperty ComputerType ""
    $psObject | Add-Member NoteProperty ComputerSerial ""
    $psObject | Add-Member NoteProperty MonitorSerial ""
    $psObject | Add-Member NoteProperty MonitorType ""

 
    ForEach ($items in $Monitor) {
        $psObject.ComputerName = $env:computername
        $psObject.ComputerType = $Computer.model
        $psObject.ComputerSerial = $Bios.SerialNumber 
        $psObject.MonitorSerial = ($_.SerialNumberID -ne 0 | ForEach-Object {[char]$_}) -join ""
        $psObject.MonitorType = ($_.UserFriendlyName -ne 0 | ForEach-Object {[char]$_}) -join "" 
 
        $psObject 
 
    }
}