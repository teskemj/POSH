<#
.SYNOPSIS

.DESCRIPTION
.NOTES
Author: Michael TEske
Created: 2018-12-14
Modified: 2018-12-14

#http://lifeofageekadmin.com/how-to-uninstall-programs-using-powershell/
#>
#Function Remove-HP {
    
# Other packages are dependent on HP Device Support

uninstall-package -Name "HP Device Access Manager" -Force

    

# Retrieve all HP packages
# YOU'LL COME BACK HERE AFTER THE FINAL STEPS AND RERUN THIS TO CLEAN UP RESIDUALS

$apps = get-package -name HP*



# Process each app that isn't the HP Support Assistant. HPSA is convenient for updating drivers

foreach ($app in $apps) {

    if ($app.name -notlike "HP Support Assistant") {

        $app.name

        Uninstall-Package $app.name -Force

    } #End If

} #End foreach

#} #End Function

# Set script execution policy. If this isn't done, then the later process will fail.

Set-ExecutionPolicy RemoteSigned -Force

# Disable powerconfig...ie, hibernation. This prevents the system from going to sleep and stuff.

powercfg -h off

# House Keeping
# Rename the computer ksi-122018-# (# is an incremental number you need to keep track of) Change the number on each deployment

rename-computer -NewName ksi-122018-5 -restart


## Start here after rebooot ##

# Side note This installs boxstarter. Once installed. Insert the "raw" GIST link
# place cursor on the following line and press F8

. { Invoke-WebRequest -useb http://boxstarter.org/bootstrapper.ps1 } | Invoke-Expression; get-boxstarter -Force

# Make sure you replace the value (URL) after with the GIST RAW URL. This example "may" work. But if it doesn't replace with new RAW URL
Install-BoxstarterPackage -PackageName https://gist.githubusercontent.com/teskemj/840e5df39bb105d643952a7a8e145c32/raw/e0d71c3d62badb31329729100c7d10aa1677dde5/deployhp.ps1 -DisableReboots
