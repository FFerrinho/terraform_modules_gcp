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
  value = google_service_account.terraform.email
}
