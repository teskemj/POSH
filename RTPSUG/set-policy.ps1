$subid = (Get-AzSubscription).SubscriptionId

$policydef = New-AzPolicyDefinition -name 'ALLOWEDVMS' -Description 'Restrict VM sizes to 3' -Policy D:\OneDrive\_Git\posh\RTPSUG\azvmdefs.json

Get-AzPolicyDefinition -Name ALLOWEDVMS

$resourcegroupID = (Get-AzResourceGroup -name 'rtpsug-sat').resourceid

New-AzPolicyAssignment -Name ALLOWEDVMS -PolicyDefinition $policydef -Scope $resourcegroupID


New-AzurePolicyAssignment -Name RestrictVMsizes -PolicyDefinition $policydef -Scope /subscriptions/$SubID