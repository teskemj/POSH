Workflow start-stop-vms { 
    Param 
    (    
        [Parameter(Mandatory)][ValidateNotNullOrEmpty()] 
        [String] 
        $AzureSubscriptionId = '8bc4fbf0-6ad5-4922-aaaa-226b44e5db84', 

        [Parameter(Mandatory)][ValidateNotNullOrEmpty()] 
        [String]$AzureVMList = "windows1,demo2,demo3",

        [Parameter]
        [Switch]
        $All,

        [Parameter(Mandatory)][ValidateSet('Start', 'Stop')] 
        [String] 
        $Action 
    ) 
     
    $connectionName = 'AzureRunAsConnection'

    try {
        # Get the connection 'AzureRunAsConnection'
        $servicePrincipalConnection = Get-AzAutomationConnection -Name $connectionName         

        'Logging in to Azure...'
        Add-AzAccount `
            -ServicePrincipal `
            -TenantId $servicePrincipalConnection.TenantId `
            -ApplicationId $servicePrincipalConnection.ApplicationId `
            -CertificateThumbprint $servicePrincipalConnection.CertificateThumbprint 
    }
    catch {
        if (!$servicePrincipalConnection) {
            $ErrorMessage = "Connection $connectionName not found."
            throw $ErrorMessage
        }
        else {
            Write-Error -Message $_.Exception
            throw $_.Exception
        }
    }
 
    if ($AzureVMList -ne 'All') { 
        $AzureVMs = $AzureVMList.Split(',') 
        [System.Collections.ArrayList]$AzureVMsToHandle = $AzureVMs 
    } 
    else { 
        $AzureVMs = (Get-AzureRmVM).Name 
        [System.Collections.ArrayList]$AzureVMsToHandle = $AzureVMs 
    } 
 
    foreach ($AzureVM in $AzureVMsToHandle) { 
        if (!(Get-AzVM | Where-Object { $_.Name -eq $AzureVM })) { 
            throw "AzureVM : [$AzureVM] - Does not exist! - Check your inputs." 
        } 
    } 
 
    if ($Action -eq 'Stop') { 
        Write-Output 'Stopping VMs'; 
        foreach -parallel ($AzureVM in $AzureVMsToHandle) { 
            Get-AzVM | Where-Object { $_.Name -eq $AzureVM } | Stop-AzVM -Force 
        } 
    } 
    else { 
        Write-Output 'Starting VMs'; 
        foreach -parallel ($AzureVM in $AzureVMsToHandle) { 
            Get-AzVM | Where-Object { $_.Name -eq $AzureVM } | Start-AzVM 
        } 
    } 
}
