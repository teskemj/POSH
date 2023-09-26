# Getting the first date
$firstDateInput = "05/28/2023"
$firstDate = [DateTime]::ParseExact($firstDateInput, "MM/dd/yyyy", $null)

# Getting the second date
$secondDateInput = Read-Host "Now enter the second date (MM/DD/YYYY), just to see how wild this ride gets"
$secondDate = [DateTime]::ParseExact($secondDateInput, "MM/dd/yyyy", $null)

# Calculating the difference in weeks
$daysDifference = ($secondDate - $firstDate).Days
$weeksDifference = $daysDifference / 7

Write-Host "Hold onto your hat, the difference between these two dates is $weeksDifference weeks. Time flies, doesn't it?"
