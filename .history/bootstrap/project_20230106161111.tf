data "google_organization" "organization" {
  domain = var.organization_domain
}

resource "google_folder" "folder" {
  count = var.create_folder ? 1 :0
  display_name = var.folder_name
  parent       = data.google_organization.organization.name
}

data "google_active_folder" "folder" {
  display_name = var.folder_name
  parent       = data.google_organization.organization.name
}

/* data "google_billing_account" "billing" {
  display_name = var.billing_account_name
  open         = true
} */

/* resource "google_billing_subaccount" "billing" {
  count = var.create_billing_subaccount ? 1 : 0
  display_name           = var.billing_subaccount_name
  master_billing_account = data.google_billing_account.billing.id
} */

resource "google_project" "project" {
  name            = var.project_display_name
  project_id      = join("-", [replace(var.project_display_name, " ", "-"), random_uuid.uuid.result])
  folder_id       = data.google_active_folder.folder.id
  #billing_account = var.billing_subaccount_name != "" ? data.google_billing_account.billing.id : google_billing_subaccount.billing[*].id

  labels = merge(
    var.labels,
    {
      managed = "terraform"
      purpose = "automation"
    }
  )

  auto_create_network = var.auto_create_network
}
