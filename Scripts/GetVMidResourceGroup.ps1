$result = New-AzureRmResourceGroupDeployment -ResourceGroupName "aatifdtlrg207912" -TemplateFile "D:\AzureDeploy.json" -TemplateParameterObject $paramValues
$VMId = $result.outputs.Values.value
$VMComputeId = (Get-AzureRmResource -Id $VMId).Properties.ComputeId
$RGNameofVM = $VMComputeId.split("/") $RGNameofVM = $RGNameofVM[4]
$IP = (Get-AzureRmNetworkInterface -Name $VMName -ResourceGroupName $RGNameofVM ).IpConfigurations.PrivateIpAddress
