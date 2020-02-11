# https://docs.microsoft.com/en-us/azure/virtual-machines/windows/quick-create-powershell
# https://shell.azure.com/powershell
# Demo script creates VMs in Azure

Connect-AzAccount


# View VM sizes avaiable in your region
Get-AzVMSize -Location 'Central US'


New-AzVM `
    -ResourceGroupName "demo-rg" `
    -Name "demo-3" `
    -Location "CentralUS" `
    -VirtualNetworkName "demo-vnet" `
    -SubnetName "default" `
    -SecurityGroupName "demo-1-nsg" `
    -PublicIpAddressName "demo-3-ip" `
    -OpenPorts 80, 3389

$publicIP = Get-AzPublicIpAddress -ResourceGroupName "demo-rg" | Select-Object -ExpandProperty IpAddress
$demo1 = $publicIP[0]
$demo2 = $publicIP[1]

$vmstate = Get-AzVM -ResourceGroupName rtpsug-sat -Name 'windows1' -status

mstsc.exe /v:$demo1
mstsc.exe /v:$demo2

$publicIP = Get-AzPublicIpAddress -ResourceGroupName "demo-rg" | Select-Object IpAddress
$publicIP


# Clean up after yourself
Remove-AzResourceGroup -Name demo-rg


# Get a reference to the resource group that will be the scope of the assignment
$rg = Get-AzResourceGroup -Name 'RTPSUG-SAT'

# Get a reference to the built-in policy definition that will be assigned
$definition = Get-AzPolicyDefinition | Where-Object { $_.Properties.DisplayName -eq 'Allowed virtual machine SKUs' }

# Create the policy assignment with the built-in definition against your resource group
New-AzPolicyAssignment -Name 'audit-vm-manageddisks' -DisplayName 'Audit VMs without managed disks Assignment' -Scope $rg.ResourceId -PolicyDefinition $definition