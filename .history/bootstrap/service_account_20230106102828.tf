resource "google_service_account" "terraform" {
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
  description  = var.service_account_description
  disabled     = var.service_account_disabled
  project      = google_project.project.id
}

resource "google_service_account_iam_binding" "terraform" {
  for_each           = var.sa_member_roles
  service_account_id = google_service_account.terraform.id
  members            = formatlist("user:%s", var.sa_token_creators)
  role               = each.value
}
