# This will retrieve the organization information.
data "google_organization" "main" {
  domain = var.organization_domain
}

# If the organization is still 'clean' this will allow creation of the initial folder.
resource "google_folder" "main" {
  count        = var.create_folder ? 1 : 0
  display_name = var.folder_name
  parent       = data.google_organization.main.name
}

# In case the folder was created outside of this code, this will retrieve the folder information.
data "google_active_folder" "main" {
  display_name = var.folder_name
  parent       = data.google_organization.main.name
  
  depends_on = [
    google_folder.main
  ]
}

# This will retrieve the data for the billing account. Presently untested as current privileges don't allow to retrieve this data.
/* data "google_billing_account" "main" {
  billing_account = join("/", ["billingAccounts", var.billing_account_id])
  #display_name = var.billing_account_name
  open = true
} */

# This will allow creation of a billing subaccount, in case there is the need. Not tested due to the same permissions issue.
/* resource "google_billing_subaccount" "main" {
  count = var.create_billing_subaccount ? 1 : 0
  display_name           = var.billing_subaccount_name
  master_billing_account = data.google_billing_account.main.id
} */

# This will create the project and associate the billing account.
# The commented field for the villing_account can be reenabled after having permissions to test the code above, for the billing.
resource "google_project" "main" {
  name       = var.project_display_name
  project_id = join("-", [replace(var.project_display_name, " ", "-"), random_id.random.dec])
  org_id     = var.folder_name == "" ? data.google_organization.main.id : null
  folder_id  = var.folder_name != "" ? local.folder_id : null
  billing_account = var.billing_account_id # If the line bellow is enabled (and working, see above), this line can be removed.
  #billing_account = var.billing_subaccount_name != "" ? data.google_billing_account.main.id : google_billing_subaccount.main[*].id

  labels = merge(
    var.labels,
    {
      managed = "terraform"
      purpose = "automation"
    }
  )

  auto_create_network = var.auto_create_network
}
