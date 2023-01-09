resource "google_service_account" "terraform" {
  account_id   = var.account_name
  display_name = var.display_name
  description  = var.description
  disabled     = var.disable_service_account
  project      = var.project
}

locals {
  sa_token_creators_mod = formatlist("user:%s", var.sa_token_creators)
}

resource "google_service_account_iam_binding" "token_creator" {
  service_account_id = google_service_account.terraform.name
  role               = "roles/iam.serviceAccountUser"

  members = [
    formatlist("user:%s", var.sa_token_creators)
  ]
}
