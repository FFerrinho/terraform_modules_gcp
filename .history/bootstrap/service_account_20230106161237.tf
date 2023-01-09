resource "google_service_account" "terraform" {
  account_id   = replace(var.service_account_display_name, " ", "-")
  display_name = var.service_account_display_name
  description  = var.service_account_description
  disabled     = var.service_account_disabled
  project      = google_project.project.id

  lifecycle {
    postcondition {
      condition     = can(regex("^[a-zA-Z]([a-zA-Z0-9-]*[a-zA-Z0-9])?(\\.[a-zA-Z]([a-zA-Z0-9-]*[a-zA-Z0-9])?)*$", self.account_id))
      error_message = "The service account can only contains the characters comprehended in [a-z]([-a-z0-9]*[a-z0-9])."
    }
  }
}

resource "google_organization_iam_member" "terraform" {
  member = join(":", ["serviceAccount", google_service_account.terraform.email])
  role   = "roles/editor"
  org_id = data.google_organization.organization.id
}

resource "google_service_account_iam_binding" "terraform" {
  for_each           = var.sa_member_roles
  service_account_id = google_service_account.terraform.id
  members            = formatlist("user:%s", var.sa_users)
  role               = each.value
}
