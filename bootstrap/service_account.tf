# This will create the service account to use with IaC automation.
resource "google_service_account" "main" {
  account_id   = replace(var.service_account_display_name, " ", "-")
  display_name = var.service_account_display_name
  description  = var.service_account_description
  disabled     = var.service_account_disabled
  project      = google_project.main.project_id

  lifecycle {
    postcondition {
      condition     = can(regex("^[a-zA-Z]([a-zA-Z0-9-]*[a-zA-Z0-9])?(\\.[a-zA-Z]([a-zA-Z0-9-]*[a-zA-Z0-9])?)*$", self.account_id))
      error_message = "The service account can only contains the characters comprehended in [a-z]([-a-z0-9]*[a-z0-9])."
    }
  }
}

# Use this in case the SA is to be granted permissions at the organization level
/* resource "google_organization_iam_member" "main" {
  member = join(":", ["serviceAccount", google_service_account.terraform.email])
  role   = "roles/editor"
  org_id = data.google_organization.main.id
} */

# This will grant the service account the necessary permissions at the folder level. Assuming the folder is the topmost folder in the organization, permissions will be inherited.
# If the field above is enabled, this one can be commented, since it's redundant to have the permissions at organization and folder level.
resource "google_folder_iam_member" "main" {
  member = join(":", ["serviceAccount", google_service_account.main.email])
  role   = "roles/editor"
  folder = data.google_active_folder.main.id
}

# This will grant individual users (or service accounts) permissions to impersonate the SA created in this bootstrap execution.
resource "google_service_account_iam_binding" "main" {
  for_each           = var.sa_member_roles
  service_account_id = google_service_account.main.id
  members            = formatlist("user:%s", var.sa_users)
  role               = each.value
}
