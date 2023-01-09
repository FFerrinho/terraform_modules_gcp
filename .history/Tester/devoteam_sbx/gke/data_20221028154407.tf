data "google_service_account" "terraform" {
  account_id = local.terraform_service_account
}

data "google_service_account_access_token" "terraform" {
  provider               = google.impersonation
  target_service_account = local.terraform_service_account
  scopes                 = ["userinfo-email", "cloud-platform"]
  lifetime               = "3600s"
}
