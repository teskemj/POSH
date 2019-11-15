[function Verb-Noun {
    [CmdletBinding()]
    param (
        
    )
    
    begin {
    }
    
    process {
    }
    
    end {
    }
}]

$startDate = "05/21/2018"
#$endDate = get-date
$DaysWorked = New-TimeSpan -Start $startDate -end (get-date) | select -ExpandProperty days
$DaysWorked

