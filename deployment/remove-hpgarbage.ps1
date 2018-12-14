<#
.SYNOPSIS

.DESCRIPTION
.NOTES
Author: Michael TEske
  Created: 2018-12-14
  Modified: 2018-12-14

#http://lifeofageekadmin.com/how-to-uninstall-programs-using-powershell/
Function Remove-HP {
    
        $apps = Get-WmiObject -Class Win32_Product | Where-Object {
            $_.Name -like “HP*”}

        foreach ($app in $apps) {
        if ($app.name -notlike "HP Support Assistant") {
            $app.name
            Uninstall-Package $app.name -Force

            
        }
        
    }

}
$apps = get-package -name HP*

Install-BoxstarterPackage -PackageName http://gist.github.com/teskemj/deployhp.ps1 -DisableReboots
