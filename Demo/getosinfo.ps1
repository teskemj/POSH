
#Using a Param Block
param (
    $computername = 'localhost'
)
Get-WmiObject -Class win32_operatingsystem -ComputerName $computername | `
Select-Object buildnumber,caption,servicepackmajorversion 
