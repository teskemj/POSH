cd \scripts
dir
type .\MyFirstScript.txt
$stuff = get-content .\MyFirstScript.txt
$stuff -split ':'
$stuff -split ','
$stuff -split '\,'
$stuff -split '?=,'
$stuff -split '(?=,)'
