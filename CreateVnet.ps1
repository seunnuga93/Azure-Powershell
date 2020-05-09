#ResourceGroup

$rg = "NUGA-Network"
$location = "South Central US"

#VNET Name and Address Space

$VNETName = "NUGA-70533-VNET"
$VNETAddressSpace = "10.0.0.0/22"

#Subnet Names and Address Space

$subnetAName = "NUGA-Web"
$subnetAAddressPrefix = "10.0.0.0/24"
$subnetBName = "NUGA-App"
$subnetBAddressPrefix = "10.0.1.0/24"
$subnetCName = "NUGA-Data"
$subnetCAddressPrefix = "10.0.2.0/24"

#Create a resource group
New-AzResourceGroup -Name $rg -Location $location 

#Create Subnet
$subnet = New-AzVirtualNetworkSubnetConfig -Name $subnetAName -AddressPrefix $subnetAAddressPrefix

#Create VNET and include subnet configuration
$vnet = New-AzVirtualNetwork -Name $VNETName -ResourceGroupName $rg -Location $location -AddressPrefix $VNETAddressSpace -Subnet $subnet


#Add Additional Subnets
Add-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name $subnetBName -AddressPrefix $subnetBAddressPrefix
Add-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name $subnetCName -AddressPrefix $subnetCAddressPrefix

#Save the additional subnet configurations
Set-AzVirtualNetwork -VirtualNetwork $vnet  






