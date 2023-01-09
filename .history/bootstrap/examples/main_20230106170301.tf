module "bootstrap" {
  source = "../"

  organization_domain          = "boldbydevoteam.com"
  billing_account_name         = "01A9F8-23CBED-BB9173"
  project_display_name         = "bootstrap test project"
  folder_name                  = "Cloud Foundations"
  service_account_display_name = "terraform automation"
  service_account_description  = "Account used for Terraform IaC automation for infrastructure management."
  sa_users                     = ["francisco.ferrinho@devoteam.com"]
  bucket_name                  = "tf-state"
  bucket_location              = "europe-west1-b"
}
