output "service_account_id" {
  description = "The ID for the service account."
  value = values(google_service_account.terraform)[*].account_id
}

output "service_account_email" {
    description = "The e-mail for the service account."
    value = values(google_service_account.terraform)[*].email
}

output "service_account_fqdn" {
  description = "The fully-qualified for the service account."
  value = values(google_service_account.terraform)[*].name
}
