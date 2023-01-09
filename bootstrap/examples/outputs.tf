output "project_name" {
  description = "The name for the project that was created."
  value = module.bootstrap.project_name
}

output "service_account" {
  description = "The service account created for IaC automation."
  value = module.bootstrap.service_account_email
}

output "service_account_users" {
  description = "The users with service account impersonation permissions."
  value = module.bootstrap.service_account_user
}

output "bucket" {
  description = "The bucket created to store the tfstate files."
  value = module.bootstrap.tf_bucket_name
}
