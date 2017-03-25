$subId = [Subscription Id]
$labUid = [lab’s unique identifier]
 
Select-AzureRmSubscription -SubscriptionId $subId | out-null
 
$lab = Find-AzureRmResource -ResourceType "Microsoft.DevTestLab/labs" -ExpandProperties | Where-Object {$_.Properties.UniqueIdentifier -eq $labUid}
$labName = $lab.Name
$labResourceGroupName = $lab.ResourceGroupName
