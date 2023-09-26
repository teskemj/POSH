# Set the source directory where the photos are located
$sourceDir = "C:\Photos"

# Set the destination directory where the photos will be moved to
$destinationDir = "E:\Photos"

# Get all the photos in the source directory and subdirectories
$photos = Get-ChildItem -Path $sourceDir -Recurse -Include *.jpg,*.jpeg,*.png,*.mp4

# Loop through each photo and move it to the correct year folder in the destination directory
foreach ($photo in $photos) {
    # Get the creation date of the photo
    $creationDate = Get-Date $photo.LastWriteTime
    
    # Create the year folder in the destination directory if it does not already exist
    $yearFolder = Join-Path $destinationDir $creationDate.Year.ToString()
    if (!(Test-Path $yearFolder)) {
        New-Item -ItemType Directory -Path $yearFolder | Out-Null
    }
    
    # Move the photo to the year folder in the destination directory
    $newPath = Join-Path $yearFolder $photo.Name
    Move-Item -Path $photo.FullName -Destination $newPath
    
    # Log the move operation to a text file
    Add-Content -Path "$destinationDir\log.txt" -Value "Moved $($photo.FullName) to $newPath"
}

# Output a message when the script has completed
Write-Host "Organizing photos complete!"


New-ScheduledTask: Used to create a new scheduled task.
Get-ScheduledTask: Used to retrieve information about existing scheduled tasks.
Set-ScheduledTask: Used to modify the properties of an existing scheduled task.
Remove-ScheduledTask: Used to delete a scheduled task.
