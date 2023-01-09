output "folder_name" {
  description = "The name for the Google folder under which Terraform services will be setup."
  value       = google_folder.folder[*].display_name
}

output "project_name" {
  description = "The name for the Google project under which Terraform services will be setup."
  value       = google_project.project.name
}

output "project_billing_account" {
  description = "The billing account associated with the Terraform services project."
  value       = google_project.project.billing_account
}

output "service_account_email" {
  description = "The service account e-mail."
  value       = google_service_account.terraform.email
}

output "service_account_user" {
  description = "The users with SA user and token creator permissions."
  value       = google_service_account_iam_binding.terraform[*].members
}

output "tf_bucket_name" {
  description = "The name for the bucket to use as a Terraform backend."
  value       = google_storage_bucket.terraform.name
}

output "tf_bucket_self_link" {
  description = "The self link for the bucket to use as a Terraform backend."
  value       = google_storage_bucket.terraform.self_link
}
