resource "google_billing_subaccount" "billing" {
  for_each               = var.create_billing_subaccount
  display_name           = var.billing_subaccount_name
  master_billing_account = data.google_billing_account.main.id
}

