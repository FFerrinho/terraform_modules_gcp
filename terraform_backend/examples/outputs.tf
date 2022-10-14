output "tf_bucket_name" {
  description = "The name for the bucket to use as a Terraform backend."
  value = module.tf_state.tf_bucket_name
}
