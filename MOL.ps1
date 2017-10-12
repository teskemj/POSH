Get-Process
Get-WmiObject win32_logicaldisk -filter 'drivetype=3' -ComputerName localhost | Select-Object pscomputername,deviceid,size,freespace
