#### demo1

1. Open task schedule
2. View Microsoft-Defrag
3. Right click and select properties
4. Select Triggers, actions, conditions and settings.

Create a basic task to open notepad
1. create basic tasks in the demo folder
2. Run once
3. Select notepad
4. set for 1 minute into the future

Delete Notepad task

#### Demo2
1. right click and delete task
2. run schtasks
3. run schtasks /fo list
4. run schtasks /fo csv /v > tasks.csv
5. $tasks = Import-Csv -Path tasks.csv
6. $tasks | get-member
7. $tasks.'task to run'
8. $tasks | where-object {$_.'task to run' -like '*powershell*'} | Select-Object hostname, 'task to run' | format-list
9. schtasks /create /?
10. schtasks /create /tn notes /tr notepad.exe /st <time in lower right corner + 2 minutes> /sc once
11. schtasks /delete /?
12. schtasks /delete /tn notes /fc


#### demo3
1. get-scheduledtaks
2. get-scheduledtask | get-member
3. get-scheduledtask -taskname *windows* | format-list
4. get-scheduledtask | where-object {$_.taskname -like '*defender*'} | select-object taskname, state | format-list

#### demo4
1. get-help new-scheduledtask
2. $action = new-scheduledtaskaction -execute "cmd.exe"
3. $trigger = new-scheduledtasktrigger -once -at 
4. $task = new-scheduledtask -action $action -trigger $trigger
5. register-scheduledtask MyCMDTask -inputobject $task
