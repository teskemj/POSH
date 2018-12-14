<#
.SYNOPSIS

.DESCRIPTION
.NOTES
Author: Michael TEske
Created: 2018-12-14
Modified: 2018-12-14

#http://lifeofageekadmin.com/how-to-uninstall-programs-using-powershell/
#>
Function Remove-HP {
    
    # Other packages are dependent on HP Device Support
    uninstall-package -Name "HP Device Support" -Force
    
    # Retrieve all HP packages
    $apps = get-package -name HP*

    # Process each app that isn't the HP Support Assistant. HPSA is convenient for updating drivers
    foreach ($app in $apps) {
        if ($app.name -notlike "HP Support Assistant") {
            $app.name
            Uninstall-Package $app.name -Force
        } #End If
    } #End foreach
        
    }

} #End Function

Install-BoxstarterPackage -PackageName http://gist.github.com/teskemj/deployhp.ps1 -DisableReboots
