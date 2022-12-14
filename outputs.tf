#the Outputs you see after finishing with the deploying . its importen that each module has to have own Outputs so you can push it to the main output 


output "StorageAccountName" {
  value = module.StorageAccount.stg_act_name_out
}

output "Recourcegroupname" {
  value = module.ResourceGroup.rg_name_out
}
output "Location" {
  value = module.ResourceGroup.rg_Location
}