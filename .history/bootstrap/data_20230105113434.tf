data "google_billing_account" "main" {
    display_name = var.billing_account_name
    open = true
}

data "google_organization" "organization" {
  domain = var.organization_domain
}
