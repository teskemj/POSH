Function Get-Monitor {
    $Monitor = Get-WmiObject wmiMonitorID -namespace root\wmi 
    $Computer = Get-WmiObject -Class Win32_ComputerSystem 

    $psObject = New-Object PSObject
    $psObject | Add-Member NoteProperty ComputerName ""
    $psObject | Add-Member NoteProperty ComputerType ""
    $psObject | Add-Member NoteProperty ComputerSerial ""
    $psObject | Add-Member NoteProperty MonitorSerial ""
    $psObject | Add-Member NoteProperty MonitorType ""

 
    $Monitor | Foreach {
        $psObject.ComputerName = $env:computername
        $psObject.ComputerType = $Computer.model
        $psObject.ComputerSerial = $Computer.Name 
        $psObject.MonitorSerial = ($_.SerialNumberID -ne 0 | % {[char]$_}) -join ""
        $psObject.MonitorType = ($_.UserFriendlyName -ne 0 | % {[char]$_}) -join "" 
 
        $psObject 
 
    }
}