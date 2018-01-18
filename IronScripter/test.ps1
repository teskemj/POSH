$Monitor = Get-ciminstance wmiMonitorID -namespace root\wmi -computername tsw-1
$cimmonitor = get-ciminstance -ClassName CIM_DesktopMonitor -Namespace root/cimv2
$Computer = Get-CimInstance -Class Win32_ComputerSystem -computername tsw-1
$Bios = Get-CimInstance -ClassName Cim_BIOSElement -computername tsw-1

$psObject = New-Object PSObject
$psObject | Add-Member NoteProperty ComputerName ""
$psObject | Add-Member NoteProperty ComputerType ""
$psObject | Add-Member NoteProperty ComputerSerial ""
$psObject | Add-Member NoteProperty MonitorSerial ""
$psObject | Add-Member NoteProperty MonitorType ""

 
$Monitor | Foreach {
    $psObject.ComputerName = $computername
    $psObject.ComputerType = $Computer.model
    $psObject.ComputerSerial = $Bios.SerialNumber 
    $psObject.MonitorSerial = ($.SerialNumberID -ne 0 | % {[char]$_}) -join ""
    $psObject.MonitorType = ($_.UserFriendlyName -ne 0 | % {[char]$_}) -join "" 
 
    $psObject 
}