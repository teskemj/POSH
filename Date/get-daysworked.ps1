param (
    [datetime]$StartDate = "05/21/2018",
    [datetime]$EndDate = (Get-Date)
)

$daysWorked = 0
$current = $StartDate

while ($current -le $EndDate) {
    if ($current.DayOfWeek -notin 'Saturday', 'Sunday') {
        $daysWorked++
    }
    $current = $current.AddDays(1)
}

$yearsWorked = [math]::Floor(($EndDate - $StartDate).TotalDays / 365.25)

Write-Output "$yearsWorked years and $daysWorked working days since $($StartDate.ToString('MM/dd/yyyy'))"
