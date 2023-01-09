output "service_account_id" {
  description = "The ID for the service account."
  value       = google_service_account.terraform[sa].account_id
}

output "service_account_email" {
    description = "The e-mail for the service account."
    value = google_service_account.terraform[sa].email
}

output "service_account_fqdn" {
  description = "The fully-qualified for the service account."
  value = google_service_account.terraform[sa].name
}
