cd\
cd scripts
dir
gc moltools.ps
gc moltools.ps1
cls
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = 'c:\scripts'
$watcher.EnableRaisingEvents = $true
$changed = Register-ObjectEvent $watcher 'Changed' -action {write-output "Changed: $($eventargs.fullpath)"}
dir > stuff.txt
$watcher.Filter = "moreheros.txt"
$changed = Register-ObjectEvent $watcher 'Changed' -action {write-output "Changed: $($eventargs.fullpath)"}
$changed
$changed
$changed | gm
start-job -id 2
$changed
Start-Job $changed
cls
help Register-ObjectEvent -ShowWindow
get-event
help get-event
help get-event -showwindow
$changed
cls
h
(h).commandline events.ps1
cls
