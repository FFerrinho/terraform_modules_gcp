output "tf_bucket_name" {
  description = "The name for the bucket to use as a Terraform backend."
  value = module.tf_state.tf_bucket_name
}

output "sa_email" {
  description = "The e-mail for the service account."
  value = module.tf_service.service_account_email
}
