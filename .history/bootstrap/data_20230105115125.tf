data "google_organization" "organization" {
  domain = var.organization_domain
}

data "google_folder" "folder" {
  folder = var.folder_id
  lookup_organization = true
}

data "google_billing_account" "main" {
    display_name = var.billing_account_name
    open = true
}
