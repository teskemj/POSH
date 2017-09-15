$badapps=get-content -path \\lpierp\data\network\scripts\badapps.txt

ForEach ($app in $badapps) {
   $AppxPackage = Get-AppxProvisionedPackage -online | Where {$_.DisplayName -eq $App}
   Remove-AppxProvisionedPackage -online -packagename ($AppxPackage.PackageName)
   Remove-AppxPackage ($AppxPackage.PackageName)


}