Set-ExecutionPolicy Bypass
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))


@"
This is some multi
line text
"@ -match '\n'

@"
This is some multiline text
"@ -match '\n'

'no new line' -match '\n'
