cd\
cls
get-command
cls
get-command *computer*
get-command *fire*
cls
get-command *print*
cls
get-command *print*
cls
get-command -Name *print* -CommandType cmdlet
get-command *print*
cls
get-printer
cls
get-command *services* -CommandType cmdlet
get-command *service* -CommandType cmdlet
update-help
cls
get-help get-service
get-help get-service -full
Get-Service
get-help get-service -full
cls
get-help get-service -showwindow
get-help get-service -Online
get-service
cls
get-service -Name b*
get-service | get-member
cls
get-service | Select-Object *
cls
get-service -Name b* | Select-Object *
cls
get-service -Name b* | Select-Object name
get-service -Name bi* | Select-Object *
cls
get-service -Name b* | Select-Object name,status,StartType
get-service -Name bit*
get-service -Name bit* | Start-service
get-service -Name bit*
#get-command;get-help;get-member
#get-service stop-service select-object
h
h | out-file c:\scripts\epi1.ps1
(h).commandline
cls
(h).commandline
