function Get-ComputerInfo {
    param(
        [string]$computername = 'localhost'
    )
    $os = Get-WmiObject -Class win32_OperatingSYstem -ComputerName $computername
    $bios = Get-WmiObject -Class win32_BIOS -ComputerName $computername
    $disk = Get-WmiObject -Class win32_logicaldisk -Filter "DeviceID='c:'" -ComputerName $computername
    
    $obj = New-Object -TypeName PSObject
    $obj | Add-Member -MemberType NoteProperty -Name Computername -Value $computername
    $obj | Add-Member -MemberType NoteProperty -Name SPVersion -value $os.servicepackmajorversion
    $obj | Add-Member -MemberType NoteProperty -Name OSVersion -Value $os.caption
    $obj | Add-Member -MemberType NoteProperty -Name OSBuild -Value $os.buildnumber
    $obj | Add-Member -MemberType NoteProperty -Name BIOSSerial -Value $bios.serialnumber
    $obj | Add-Member -MemberType NoteProperty -Name SystemFree -Value $disk.freespace

    write-output $obj
}
Get-ComputerInfo –computername localhost

 
