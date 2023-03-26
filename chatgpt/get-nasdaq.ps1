$url = "https://finance.yahoo.com/quote/^IXIC"
$html = Invoke-WebRequest -Uri $url
$doc = New-Object -TypeName System.Windows.Forms.HtmlDocument
$doc.LoadHtml($html.Content)
$earnings = ($doc.DocumentNode.SelectNodes("//span[@data-reactid='36']") | Select-Object -ExpandProperty InnerText).Trim()
Write-Host "The latest NASDAQ earnings is: $earnings"

$url = "https://www.example.com/api/data"
$payload = @{
    "key1" = "value1"
    "key2" = "value2"
}
$response = Invoke-WebRequest $url -Method POST -Body $payload
$response.Content
