function get-REvents{
    [cmdletbinding()]
    param (
        [parameter(Mandatory=$True,
                   ValueFromPipeline=$True,
                   ValueFromPipelineByPropertyName=$True,
                   HelpMessage="Provide computername(s).")]
        [Alias('Hostname','cn')]
        [String[]]$Computername,
        [string]$logname
    )
    Begin {
        $cred = get-credential
    }
    Process{
        Write-Verbose "Here we go....."
        foreach ($computer in $computername){
            try {
                Write-Verbose "Retrieving errors from $computer $logname log"
                get-eventlog -LogName $logname -ComputerName $Computername -Newest 20 -EntryType Error -Verbose
            } catch {
            }
        }
    }
}