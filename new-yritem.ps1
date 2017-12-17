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
            $month=$file.LastWriteTime.month
            if (!(test-path $path\$year)) {
                New-Item -path $path\$year\$month -ItemType Directory
            }
            move-item -path $path\$file -Destination $path\$year\$month
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