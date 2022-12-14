
# Here is the Module of the Resource group 




resource "azurerm_resource_group" "example" {
  name     = "${var.base_name}RG" #We take the Variable for the name (Sting)and put Rg in the name 
  location = var.location
}