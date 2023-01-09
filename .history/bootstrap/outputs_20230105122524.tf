output "folder_name" {
  description = "The name for the Google folder under which Terraform services will be setup."
  value = google_folder.folder.display_name
}

output "billing_account_name" {
  description = "The principal billing account for the organization."
  value       = data.google_billing_account.main.name
}

output "billing_account_id" {
  description = "The ID for the principal billing account for the organization."
  value = data.google_billing_account.main.id
}

output "billing_subaccount_name" {
  description = "The name for the created billing subaccount."
  value       = google_billing_subaccount.billing.name
}

output "billing_subaccount_id" {
    description = "The ID for the billing subaccount."
    value = google_billing_subaccount.billing.id
}
