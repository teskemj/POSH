# https://docs.microsoft.com/en-us/azure/virtual-machines/windows/quick-create-powershell
# https://shell.azure.com/powershell
# Demo script creates VMs in Azure

Connect-AzAccount
# New-AzureRmResourceGroup -Name mt-rg -Location SouthCentralUS

# View VM sizes avaiable in your region
Get-AzVMSize -Location 'Central US'


New-AzVm `
    -ResourceGroupName "demo-rg" `
    -Name "demo2" `
    -Location "CentralUS" `
    -VirtualNetworkName "demo1-vnet" `
    -SubnetName "default" `
    -SecurityGroupName "demo1-nsg" `
    -PublicIpAddressName "demo2-ip" `
    -OpenPorts 80, 3389

$publicIP = Get-AZPublicIpAddress -ResourceGroupName "demo-rg" | Select -ExpandProperty IpAddress
$demo1 = $publicIP[0]
$demo2 = $publicIP[1]

mstsc.exe /v:$demo1
mstsc.exe /v:$demo2

$publicIP = Get-AZPublicIpAddress -ResourceGroupName "demo-rg" | Select IpAddress
$publicIP


# Clean up after yourself
Remove-AzResourceGroup -Name demo-rg
