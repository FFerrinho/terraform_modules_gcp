output "main_google_billing_account" {
  description = "The principal billing account for the organization."
  value       = data.google_billing_account.main.name
}

output "billing_subaccount" {
  description = "The name for the created billing subaccount."
  value       = google_billing_subaccount.billing.name
}
