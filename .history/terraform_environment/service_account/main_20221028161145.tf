resource "google_service_account" "terraform" {
  for_each     = toset(var.create_service_account ? ["sa"] : [])
  account_id   = var.account_name
  display_name = var.display_name
  description  = var.description
  disabled     = var.disable_service_account
  project      = var.project
}

data "google_service_account" "terraform" {
  account_id = "tf-sa-713@${var.project}.iam.gserviceaccount.com"
}

resource "google_project_iam_binding" "sa" {
  for_each = var.sa_permissions
  project  = var.project
  role     = each.value

  members = formatlist("serviceAccount:%s", data.google_service_account.terraform.email)
}

resource "google_service_account_iam_binding" "sa_token_creator" {
  service_account_id = data.google_service_account.terraform.name
  role               = "roles/iam.serviceAccountTokenCreator"

  members = formatlist("user:%s", var.sa_token_creators)
}

resource "google_service_account_iam_binding" "sa_user" {
  service_account_id = data.google_service_account.terraform.name
  role               = "roles/iam.serviceAccountUser"

  members = formatlist("user:%s", var.sa_token_creators)
}

