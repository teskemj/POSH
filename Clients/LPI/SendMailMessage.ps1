$userid='youremail'
#grab the credentials
$creds=Get-Credential $userid
Send-MailMessage `
    -To 'theiremail' `
    -Subject 'Test' `
    -Body 'Test' `
    -UseSsl `
    -Port 587 `
    -SmtpServer 'smtp.office365.com' `
    -From $userid `
    -Credential $creds


#Another Swing
$cred = get-credential
$body = “Just a test email”
Send-MailMessage -To vlad@demo.com -from noreply@demo.com -Subject 'test' -Body $body -BodyAsHtml -smtpserver smtp.office365.com -usessl -Credential $cred -Port 587 

#And another
#Below is the PowerShell 4 / Office 365 CMDlet that works. 

$secpasswd = ConvertTo-SecureString “InsertPasswordHere” -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential (“MyEmail@domain.com”, $secpasswd)

Send-MailMessage -To "simon@domain.com" -Cc "simon@otherdomain.com" -Attachments "d:\logs\log1.txt","d:\logs\log2.txt","d:\logs\log3.log" -SmtpServer "smtp.office365.com" -Credential $mycreds -UseSsl "Backup Notification" -Port "587" -Body "This is an automatically generated message.<br>Your server backup has been successful.<br> Please remember to swap your hard drives when you return to the office for the continuing safety of your data<br>Best regards<br><b>Your Support Bot</b>" -From "support@domain.com" -BodyAsHtml
