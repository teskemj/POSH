param (
    [datetime]$TargetDate = "05/05/2026"
)

$today = Get-Date

if ($TargetDate -lt $today) {
    Write-Output "Target date $($TargetDate.ToString('MM/dd/yyyy')) is in the past."
    return
}

$daysUntil = 0
$current = $today.Date

while ($current -lt $TargetDate.Date) {
    if ($current.DayOfWeek -notin 'Saturday', 'Sunday') {
        $daysUntil++
    }
    $current = $current.AddDays(1)
}

$totalDays = [math]::Floor(($TargetDate - $today).TotalDays)

Write-Output "$daysUntil working days ($totalDays calendar days) until $($TargetDate.ToString('MM/dd/yyyy'))"
