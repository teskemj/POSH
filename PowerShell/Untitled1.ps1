#region - Gathering Information with WMI & CIM
Get-CimClass -ClassName CIM*


Get-CimClass -ClassName *disk* -ComputerName localhost

Get-WmiObject -class Win32_logicaldisk -ComputerName localhost

Get-CimInstance -ClassName CIM_LogicalDisk -ComputerName localhost |fl

#Viewing freespace
((Get-CimInstance -ClassName Win32_logicaldisk -ComputerName localhost |
     where DeviceID -EQ 'C:').FreeSpace)/1GB

#Last Reboot
(Get-CIMInstance -ClassName Win32_OperatingSystem –ComputerName localhost).LastBootUpTime

#endregion

#System Name
(Get-CIMInstance -ClassName Win32_OperatingSystem –ComputerName localhost).LastBootUpTime