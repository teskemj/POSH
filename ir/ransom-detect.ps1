##Sodihibi Malware Checker
$evidence_dir = "c:\investigation-$env:ComputerName"
mkdir $evidence_dir
cd $evidence_dir



#event log before 2-17-20

$log_clear = get-winevent -LogName security -Oldest -MaxEvents 1
write-host "hello there"

if($log_clear.id -eq 1102){
    $cleared_logs = 1
    get-winevent -LogName security |select * |Export-CLIxml -path $evidence_dir\security-log-2-18.xml
    write-host "Log was cleared not good - INFECTED" -BackgroundColor red -ForegroundColor white

}else{$security_check = 0}

#check windows directory for directx.sys

if(Get-item c:\Windows\directx.sys){
$neshta_files = 1
write-host "directx.sys IS present - !!!INFECTED!!!" -BackgroundColor Red -ForegroundColor White
Get-Item c:\windows\directx.sys |select * >> fileing.txt -ErrorAction SilentlyContinue

}else{

write-host "directx.sys not present - CLEAN" -BackgroundColor Green -ForegroundColor White
  
}

#svchost.com
if(Get-item c:\Windows\svchost.com){
$neshta_files = 1
write-host "scvhost.com IS present - !!!INFECTED!!!" -BackgroundColor Red -ForegroundColor White
Get-Item c:\windows\svchost.com |select * >> fileing.txt

}else{

write-host "scvhost.com not present - CLEAN" -BackgroundColor Green -ForegroundColor White

}

#check reg persistence
$reg = Get-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Classes\exefile\shell\open\command
if($reg.'(default)' -like "*C:\WINDOWS\svchost.com*"){
$reg_persistence = 1

write-host "Regsitry Persistence Detected - INFECTED" -BackgroundColor Red -ForegroundColor White

}


#get contents of folder

if(get-childitem "c:\folder"){

Compress-Archive -literalpath "c:\folder" -DestinationPath "c:\folder-$env:computername.zip"

mv "c:\folder-$env:computername.zip" $evidence_dir\folder-$env:computername.zip

}

cp C:\windows\system32\LogFiles\Firewall\ $evidence_dir\Firewall\ -ErrorAction SilentlyContinue
cp C:\windows\system32\LogFiles\HTTPERR\ $evidence_dir\HTTPERR -ErrorAction SilentlyContinue

$notes = Get-ChildItem -path C:\Users\ -Recurse |Where-Object -Property name -like "*readme*"
mkdir $evidence_dir\notes
cp $notes[0].Fullname $evidence_dir\notes

$obj = @()
$properties= @{

        Cleared_logs = $Cleared_logs
        neshta_files = $neshta_files
        registry_persistence = $reg_persistence 

}

$obj = New-Object -TypeName psobject -Property $properties


$verdict = $obj.Cleared_logs + $obj.neshta_files + $obj.registry_persistence

if($verdict -ne $null){

Write-host "Computer $env:ComputerName has been infected and shows $verdict signs out of 3 - INFECTED" -BackgroundColor Red -ForegroundColor White
Compress-Archive $evidence_dir "$evidence_dir.zip"
Write-Warning "Evidence has been collected and placed in $evidence_dir and then compressed please export compressed file for data collection."


} Else {

    write-host "$env:ComputerName is clean"

}
