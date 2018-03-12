#MOL Functioning
<#
MOLTools.ps1 is toolkit that can be used for chapter documentation. I am currenly using
this to start new chapters (create associated folder) and then close the chapter (dump history to a 
PS1 file per named chapter).
#>
function new-chapter {
    [cmdletbinding()]
    param (
        [Parameter(Mandatory=$True,HelpMessage="Enter the chapter you are working through"]
        [string]$chapter
    )
    $path='p:\powershell\mol'
    if (test-path $path\c$chapter) {
         Write-output "Chapter $chapter directory already exists"
    }
    else {
        new-item -Path $path -Name c$chapter -ItemType Directory -Verbose
    }
}

function close-chapter {
    [cmdletbinding()]
    param (
        [string]$chapter
    
    )
    
    (get-history).CommandLine | out-file p:\powershell\mol\c$chapter\chapter$chapter.ps1 -Verbose


}