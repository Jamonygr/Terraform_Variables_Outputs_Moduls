#This is the Main configuration for the Storage Account Module 



#agaom the Provider for Terraform to know (azure)
terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      
    }
  }
}

#This resource block is for the name of the storage account . The storage account name should be unique and have only low cases withou special characters 
resource "random_string" "random" {
  length  = 6
  special = false
  upper   = false
}




#This resource block for creating the storage account 

resource "azurerm_storage_account" "example" {
  name                     = "${lower(var.base_name)}${random_string.random.result}" #here we defined the Variable for the storage name and the second part is a random string (resouce type )
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}