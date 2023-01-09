resource "google_billing_account" "main" {
    display_name = var.billing_account_name
    open = true
}
