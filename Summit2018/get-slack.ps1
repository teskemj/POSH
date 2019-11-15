$users = Get-SlackUserMap -Update

$history = Get-SlackChannel -name community-demos |
    Get-SlackHistory -after (Get-Date "4/10/2018 1:00") -Paging |
    Where {$_.user -eq $users.michaeltlombardi -and $_.Reactions}

$data = foreach($message in $history) {
    $yay = ($message.Reactions.users | Select -Unique).count
    [pscustomobject]@{
        Votes = $yay
        Session = $message.Text
    }
}

$data | Sort-Object Votes -Descending