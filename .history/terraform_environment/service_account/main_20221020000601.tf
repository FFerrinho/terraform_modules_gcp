resource "google_service_account" "terraform" {
  for_each = toset(var.create_service_account ? ["sa"] : [])
  account_id   = var.account_name
  display_name = var.display_name
  description  = var.description
  disabled     = var.disable_service_account
  project      = var.project
}

resource "google_project_iam_binding" "sa" {
  project = var.project
  role    = "roles/editor"

  members = formatlist("serviceAccount:%s", google_service_account.terraform.email)
}

resource "google_service_account_iam_binding" "sa_token_creator" {
  service_account_id = google_service_account.terraform.name
  role               = "roles/iam.serviceAccountTokenCreator"

  members = formatlist("user:%s", var.sa_token_creators)
}

resource "google_service_account_iam_binding" "sa_user" {
  service_account_id = google_service_account.terraform.name
  role               = "roles/iam.serviceAccountUser"

  members = formatlist("user:%s", var.sa_token_creators)
}
