output "tf_bucket_name" {
  description = "The name for the bucket to use as a Terraform backend."
  value = module.tf_state.tf_bucket_name
}

output "tf_bucket_self_link" {
  description = "The self_link for the bucket to use as a Terraform backend."
  value = module.tf_state.tf_bucket_self_link
}
