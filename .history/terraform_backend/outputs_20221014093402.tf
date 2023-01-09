output "tf_bucket_name" {
  description = "The name for the bucket to use as a Terraform backend."
  value = google_storage_bucket.terraform.name
}

output "tf_bucket_self_link" {
  description = "The self link for the bucket to use as a Terraform backend."
  value = google_storage_bucket.terraform.self_link
}
