output "main_google_billing_account" {
  description = "The principal billing account for the organization."
  value = data.google_billing_account.main.name
}
