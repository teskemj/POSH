<#
.Synopsis
   Opens a Word document
.DESCRIPTION
   Opens a Word document and -comobject for access in that session.
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
#>

Function Get-WordDoc {
    [cmdletbinding()]
    Param (
        [parameter(Mandatory = $true,
                    ValueFromPipelineByPropertyName=$false,
                    Position=0)]
        [string]$path
    )
    #need to verify if path exists.
    if (test-path $path) {
        $Word=NEW-Object –comobject Word.Application
        $Word.documents.open($path)
        $Word.Visible = $true
    } 
    else {
        Write-Output "$path not found."
    }
    
}
