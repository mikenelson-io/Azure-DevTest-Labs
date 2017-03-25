$Resource = Get-AzureRmResource -ResourceId "/subscriptions/$sub_GUID/resourcegroups/$RG_devlab_Name/providers/microsoft.devtestlab/labs/$LabName/virtualmachines/$VMName"
$Resource.Properties.computeId -match 'resourceGroups/(.+)/providers'
$RGName = $Matches[1]
$IP = (Get-AzureRmNetworkInterface -Name $VMName-ResourceGroupName $RGName).IpConfigurations.PrivateIpAddress
