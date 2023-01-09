resource "google_service_account" "terraform" {
  account_id   = var.account_name
  display_name = var.display_name
  description  = var.description
  disabled     = var.disable_service_account
  project      = var.project
}
