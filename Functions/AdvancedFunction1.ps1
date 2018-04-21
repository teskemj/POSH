function do-something {
    [cmdletbinding()]
    Param()
    
    Write-output "This is my output"
    write-verbose "Command completed successfully"
}



function get-OSINfo {
    [cmdletbinding()]
    Param(
        [string[]]$computername = 'localhost'
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

function WorkerComputerInfo {
    param(
        [string[]]$computername
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
function Get-MTComputerInfo {
    #comment based help
    <#
.EXAMPLE
'server1','localhost' | Get-ComputerInfo
.EXAMPLE
get-content C:\computers.txt | Get-ComputerInfo
.EXAMPLE
Get-Adcomputer -filter * | select @{n='computername';e={$_.name}}| Get-ComputerInfo
.EXAMPLE
Get-ComputerInfo -computername 'localhost'
.EXAMPLE
Get-ComputerInfo -host 'server1'
.EXAMPLE
Get-ComputerInfo localhost
.EXAMPLE
Get-ComputerInfo -comp (Get-Content C:\computers.txt
#>
    [Cmdletbinding()]    #Binds many attributes of cmdlets to functions
    param (
        [Parameter(Mandatory = $true, Position = 1, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $true)]
        [Alias('host')]
        [string[]]$computername)
    BEGIN {}    #Run Once Code
    PROCESS {
        #Run for each object in the pipeline
        foreach ($name in $computername) {
            WorkerComputerInfo $name
        }
    }
    END {}  #Run Once after Process Code
}


<#

different ways to pass info
'server1','localhost' | Get-ComputerInfo
get-content C:\computers.txt | Get-ComputerInfo
get-adcomputer -filter * | select @{n='computername';e={$_.name}}| Get-ComputerInfo
Get-ComputerInfo -computername 'localhost'
Get-ComputerInfo -host 'server1'
Get-ComputerInfo localhost
Get-ComputerInfo -comp (Get-Content C:\computers.txt)

#>
