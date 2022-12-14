# In this example we are going to create 2 Modules to create a Resource Group and a Storage account . 
#This is a very  good Example to understand how Variables , Modules and Outputs are working 



# Provider Info so Terraform Can regonize the Cloud Provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"

    }
  }
}

provider "azurerm" {
  features {

  }
}
#Custom Created Module to create Resourcegroup
module "ResourceGroup" {
  source    = "./ResourceGroup"    #the Resourcegroup Module Location . In this example its on the Resourcegroup folder 
  base_name = "TerraformExample02" #name of the Resourcegroup
  location  = "West US"            #Location of the Resource 
}
#Custom Created Module to create Storageaccount

module "StorageAccount" {
  source              = "./StorageAccount" #the Storageaccount Module Location . In this example its on the Storageaccount folder 
  base_name           = "TerraformExample02"
  resource_group_name = module.ResourceGroup.rg_name_out 
  location            = "West US"                        #Location of the Resource 
}

