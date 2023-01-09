output "main_billing_account_name" {
  description = "The principal billing account for the organization."
  value       = data.google_billing_account.main.name
}

output "name" {
  description = "The ID for the principal billing account for the organization."
  value = data.google_billing_account.main.id
}

output "billing_subaccount_name" {
  description = "The name for the created billing subaccount."
  value       = google_billing_subaccount.billing.name
}
