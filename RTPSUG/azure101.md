# Azure 101 links

[Azure YouTube Free Stuff](https://www.youtube.com/watch?v=UI6pxZvJEkM&t=6s)

## Azure Passes

[Azure Free Stuff](https://azure.microsoft.com/en-us/free/)

[Bizspark-Microsoft Startups](https://startups.microsoft.com/en-us/)

[Azure Education/Imagine Academy](https://azureforeducation.microsoft.com/en-us)

### Pricing Help
[Azure Virtual Machine Pricing](https://azure.microsoft.com/en-us/pricing/details/virtual-machines/windows/)

[Azure Pricing Calculator](https://azure.microsoft.com/en-us/pricing/calculator/)

[Stopped v. Deallocated VMs](https://blogs.technet.microsoft.com/gbanin/2015/04/22/difference-between-the-states-of-azure-virtual-machines-stopped-and-stopped-deallocated/)

```powershell
# You have to use -force to have the VMs enter a deallocated state
# Resourcegroupname is optional. Remove and it will stop all VMs
# Stopping the VM in the portal also sends VM to a deallocated state
# Shutting down from the VM does not deallocate and compute charges will continue
# USing the command below WITHOUT the -force will leave the VM allocated.
# Deallocation unassigns public and private IP, meaning, bootting back up will change the IP assignments.

Get-azvm -resourcegroupname demo-rg | stop-azvm -force
```

#### Azure 101 Assets/Tools

[Azure Resource Group](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-overview#resource-groups)

[Azure Storage Documentation](https://docs.microsoft.com/en-us/azure/storage/)

[Azure Virtual Networks](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview)

[Azure Network Security Group](https://docs.microsoft.com/en-us/azure/virtual-network/security-overview#network-security-groups)

[Azure VMs Overview](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/overview)

[Azure CLI-PowerShell](https://docs.microsoft.com/en-us/powershell/azure/overview?view=azps-1.2.0)

```powershell
# Check installed versions of AzureRM
get-installedmodule -name azurerm -allversions

# Enable AzureRM compatibility aliases
enable-azurermalias -scope currentuser
```
[Azure CLI](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest)

#### Additional Learning Resources

[Microsoft Learn](httpss://www.microsoft.com/learn)

[Azure Docs/Pluralsight](https://docs.microsoft.com/)
