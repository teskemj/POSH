function New-YrItem {
    [CmdletBinding()]
    param (
        [string]$Path        
    )
    
    begin {
        $files = Get-ChildItem -path $path -File
    }
    
    process {
        foreach ($file in $files) {
            $year = $file.LastWriteTime.Year
            if (!(test-path $path\$year)) {
                New-Item -path $path\$year -ItemType Directory
            }
        }
    }
    
    end {
    }
}

function Move-YrItem {
    [CmdletBinding()]
    param (
        [string]$path
    )
    
    begin {
        $files = Get-ChildItem -path $path -File
        $dirs = Get-ChildItem -path $path -Directory
    }
    
    process {
        foreach ($file in $files){
            if ($file.Year -eq ) {
            
            }
        }
        
    }
    
    end {
    }
}