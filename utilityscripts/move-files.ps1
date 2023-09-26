# Initialize the source directory and target directory
$sourceDir = "C:\Users\micha\Dropbox (Pluralsight)\michael-teske\sc-200\mitigate-threats-azure-sentinel-cert"  # Replace with your source directory
$targetDir = "C:\Users\micha\Dropbox (Pluralsight)\michael-teske\sc-200\mitigate-threats-azure-sentinel-cert\sentineldecks"  # Replace with your target directory

# Check if the target directory exists; if not, create it
if (-Not (Test-Path $targetDir)) {
    New-Item -Path $targetDir -ItemType Directory
}

# Search and copy files
Get-ChildItem -Path $sourceDir -Recurse | ForEach-Object {
    if ($_.Name -like "*-reviewed.*") {
        Copy-Item -Path $_.FullName -Destination $targetDir
    }
}
