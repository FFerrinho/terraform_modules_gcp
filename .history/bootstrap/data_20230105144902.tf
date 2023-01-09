data "google_organization" "organization" {
  domain = var.organization_domain
}

data "google_active_folder" "folder" {
  display_name = var.folder_name
}

data "google_billing_account" "billing" {
  display_name = var.billing_account_name
  open         = true
}
