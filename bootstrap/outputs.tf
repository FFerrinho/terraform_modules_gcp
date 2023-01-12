output "folder_name" {
  description = "The name for the Google folder under which Terraform services will be setup."
  value       = google_folder.main[*].name
}

output "project_name" {
  description = "The name for the Google project under which Terraform services will be setup."
  value       = google_project.main.name
}

output "project_id" {
  description = "The ID for the Google project under which Terraform services will be setup."
  value       = google_project.main.project_id
}

output "project_billing_account" {
  description = "The billing account associated with the Terraform services project."
  value       = google_project.main.billing_account
}

output "service_account_email" {
  description = "The service account e-mail."
  value       = google_service_account.main.email
}

output "service_account_user" {
  description = "The users with SA user and token creator permissions."
  value       = [for members in google_service_account_iam_binding.main : members]
}

output "tf_bucket_name" {
  description = "The name for the bucket to use as a Terraform backend."
  value       = google_storage_bucket.main.name
}

output "tf_bucket_self_link" {
  description = "The self link for the bucket to use as a Terraform backend."
  value       = google_storage_bucket.main.self_link
}
