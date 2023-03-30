# Bing version of move photo
# Set the source directory
$sourceDir = "C:\Photos"

# Set the destination directory
$destDir = "E:\OrganizedPhotos"

# Create a log file
$logFile = "$destDir\PhotoOrganizer.log"
New-Item -ItemType File -Path $logFile -Force

# Write to log file
Function Write-Log([string]$logText) {
    Add-Content $logFile -Value "$(Get-Date) - $logText"
}

# Write to log file
Write-Log "Starting photo organization"

# Get all image files from the source directory and its subdirectories
$photos = Get-ChildItem $sourceDir -Recurse -Include *.jpg, *.jpeg, *.png, *.gif

# Loop through each photo
foreach ($photo in $photos) {
    # Get the year the photo was taken
    $year = (Get-Date $photo.LastWriteTime).Year

    # Create the destination directory if it doesn't exist
    $yearDir = "$destDir\$year"
    if (!(Test-Path $yearDir)) {
        New-Item -ItemType Directory -Path $yearDir | Out-Null
        Write-Log "Created directory: $yearDir"
    }

    # Move the photo to the destination directory
    Move-Item $photo.FullName $yearDir
    Write-Log "Moved $($photo.Name) to $yearDir"
}

# Write to log file
Write-Log "Finished photo organization"
```

This script assumes that your photos are located in `C:\Photos` and that you want to move them to `E:\OrganizedPhotos`. You can change these values by modifying the `$sourceDir` and `$destDir` variables at the top of the script.

I hope this helps! Let me know if you have any questions or if there's anything else I can do for you.