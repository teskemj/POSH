# Connect/Change AzAccount and register device
Connect-AzAccount

# View VM sizes avaiable in your region
Get-AzVMSize -Location 'Central US'

# Assign arguments
$newvm = @{
    ResourceGroupName   = "my-migrate"
    Name                = "demo1"
    Location            = "CentralUS"
    VirtualNetworkName  = "target-vnet"
    SubnetName          = "default"
    SecurityGroupName   = "demo1-nsg"
    PublicIpAddressName = "demo1-ip"
    OpenPorts           = 80, 3389
}

# Create Demo3 
New-AzVM @newvm

# Restrict SKUs at RG and subscription level.
$subid = (Get-AzSubscription).SubscriptionId

# Create custom policy definition from JSON
$policydef = New-AzPolicyDefinition -name 'ALLOWEDVMS' -Description 'Restrict VM sizes to 3' -Policy D:\OneDrive\_Git\posh\RTPSUG\azvmdefs.json

Get-AzPolicyDefinition -Name ALLOWEDVMS

$resourcegroupID = (Get-AzResourceGroup -name 'rtpsug-sat').resourceid

# Assign Custom Policy at the resource group level
New-AzPolicyAssignment -Name ALLOWEDVMS -PolicyDefinition $policydef -Scope $resourcegroupID

# Assign at the subcription level.
New-AzPolicyAssignment -Name ALLOWEDVMS -PolicyDefinition $policydef -Scope /subscriptions/$SubID

$newvm = @{
    ResourceGroupName   = "rtpsug-sat"
    Name                = "demo4"
    Location            = "CentralUS"
    VirtualNetworkName  = "demo4-vnet"
    SubnetName          = "default"
    SecurityGroupName   = "demo4-nsg"
    PublicIpAddressName = "demo4-ip"
    OpenPorts           = 80, 3389
}

# Create Demo4
New-AzVM @newvm

# Check VM Statusus

Get-AzVM
Get-AzVM | Format-Table -AutoSize
Get-AzVM | Select-Object *
Get-AzVM | Get-Member
Get-Help Get-AzVM -Full



$vmstate = Get-AzVM -ResourceGroupName 'rtpsug-sat' -Name windows1
$vmstate
$vmstate = Get-AzVM -ResourceGroupName rtpsug-sat -Name 'windows1' -status
$vmstate
$vmstate.Statuses.displaystatus


# Grab Resource Groups and get statusesuss of all VMs. 
# This is my mod of a compiliation of @techtrainertim and John Savill https://4sysops.com/archives/check-azure-vm-status-with-powershell/

function Get-AZVMStatus {
    $RGs = Get-AzResourceGroup
    foreach ($RG in $RGs) {
        $VMs = Get-AzVM -ResourceGroupName $RG.ResourceGroupName
        foreach ($VM in $VMs) {
            $VMDetail = Get-AzVM -ResourceGroupName $RG.ResourceGroupName -Name $VM.Name -Status
            $RGN = $VMDetail.ResourceGroupName  
            foreach ($VMStatus in $VMDetail.Statuses) { 
                $VMStatusDetail = $VMStatus.DisplayStatus
            }
            Write-Output "Resource Group: $RGN", ("VM Name: " + $VM.Name), "Status: $VMStatusDetail" `n
        }
    }
}

# start-stop-vms.ps1 
Portal


# Clean up after yourself ya filthy animal
Remove-AzResourceGroup -Name rtpsug-sat
