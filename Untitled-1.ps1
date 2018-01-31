function New-YearFolder {
    (cmdletbinding[])
    
}



$files = Get-ChildItem -path C:\test

foreach ($file in $files) {
    $year = $file.LastWriteTime.Year
    if (!(test-path c:\test\$year)) {
        New-Item -path c:\test\$year -ItemType Directory
    }
}
