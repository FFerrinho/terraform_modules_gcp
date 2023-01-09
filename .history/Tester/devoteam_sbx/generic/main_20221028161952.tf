locals {
  project = "gcloud-cd-playground-fferrinho"
}

module "tf_state" {
  source = "../../../terraform_environment/bucket"

  bucket_name     = "tf-state"
  bucket_location = "europe-west1"
  bucket_project  = local.project
  bucket_labels = {
    "creator" = "devoteam"
    "tool"    = "terraform"
    "backend" = "local"
  }
}

module "tf_service" {
  source = "../../../terraform_environment/service_account"

  create_service_account = true
  account_name = "terraform"
  display_name = "SA for Terraform automation."
  sa_permissions = [ "roles/editor", "roles/storage.objectAdmin"]
  project = local.project
  sa_token_creators = ["francisco.ferrinho@devoteam.com"]
}
