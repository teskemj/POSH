<#
.SYNOPSIS
Get-DiskInventory retrieves logical disk information from one or more computers.
.DESCRIPION
Get-DiskInventory uses WMI to retrieve the Win32_LogicalDisk instances from one or more computers.
It displays each disks drive letter, free space, total size and percentage of free space.
.PARAMETER computername
The computer name, or names, to query. Default: Localhost
.PARAMETER drivetype
They drive type to query. See Win32_locialdisk documentation for values. 3 is fixed disk, and is the default
.EXAMPLE
Get-DiskInventory -computername FS1 -drivetype 3
#>



Param (
    $computername = 'localhost',
    $drivetype = 3
)

Get-CimInstance -Class win32_logicaldisk -ComputerName $computername -Filter "drivetype=$drivetype" |
Sort-Object -Property deviceid |
Format-Table -Property deviceid, @{label ='FreeSpace(MB)';Expression={$_.FreeSpace/1MB -as [INT]}},
@{label='Size(GB)'; Expression={$_.Size/1GB -as [INT]}},
@{label='%Free';Expression={$_.FreeSpace/$_.size*100 -as [INT]}}

Param (
    $computername = 'localhost',
    $drivetype = 3
)

Get-WmiObject -Class win32_logicaldisk -ComputerName $computername -Filter "drivetype=$drivetype" |
Sort-Object -Property deviceid |
Format-Table -Property deviceid, @{label ='FreeSpace(MB)';Expression={$_.FreeSpace/1MB -as [INT]}},
@{label='Size(GB)'; Expression={$_.Size/1GB -as [INT]}},
@{label='%Free';Expression={$_.FreeSpace/$_.size*100 -as [INT]}}