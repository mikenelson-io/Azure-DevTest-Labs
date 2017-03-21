# Delete all the VMs in a lab

# Values to change
$subscriptionId = "<Enter Azure subscription ID here>"
$labResourceGroup = "<Enter lab's resource group here>"
$labName = "<Enter lab name here>"

# Login to your Azure account
Login-AzureRmAccount

# Select the Azure subscription that contains the lab. This step is optional
# if you have only one subscription.
Select-AzureRmSubscription -SubscriptionId $subscriptionId

# Get the lab that contains the VMs to delete.
$lab = Get-AzureRmResource -ResourceId ('subscriptions/' + $subscriptionId + '/resourceGroups/' + $labResourceGroup + '/providers/Microsoft.DevTestLab/labs/' + $labName)

# Get the VMs from that lab.
$labVMs = Get-AzureRmResource | Where-Object {
          $_.ResourceType -eq 'microsoft.devtestlab/labs/virtualmachines' -and
          $_.ResourceName -like "$($lab.ResourceName)/*"}

# Delete the VMs.
foreach($labVM in $labVMs)
{
    Remove-AzureRmResource -ResourceId $labVM.ResourceId -Force
}
