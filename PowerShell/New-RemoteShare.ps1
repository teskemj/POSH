function New-RemoteShare {
    [CmdletBinding()]
    # Parameter help description
    [Parameter(AttributeValues)]
    [ParameterType]
    [string]$FolderName,
    [string]$Path,
    [string]$Share
    [string]$Computername
    $command = {
        
        if (!(test-path $path)){
            write-output "Creating folder: " $path
            New-Item -Path $path -ItemType directory
        } else {
            write-output "The folder already exists: "$path
        }   
     
        
        if (!(Get-SmbShare -Name $share -ErrorAction SilentlyContinue)) {
            write-output "Creating share: " $share
            New-SmbShare –Name $share –Path $path –Description ‘Test Shared Folder’ –FullAccess Administrator –ReadAccess Everyone
        } else {
            write-output "The share already exists: " $share
        }
    }
    
    Invoke-Command -ComputerName $Computername -scriptblock $command
}    