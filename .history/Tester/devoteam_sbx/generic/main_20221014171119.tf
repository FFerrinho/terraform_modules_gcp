locals {
  project = "gcloud-cd-playground-fferrinho"
}

module "tf_state" {
  source = "../../../terraform_environment/bucket"

  bucket_name     = "tf-state"
  bucket_location = "europe-west1"
  bucket_project  = local.project
  enable_prevent_destroy = false
  bucket_labels = {
    "creator" = "devoteam"
    "tool"    = "terraform"
    "backend" = "local"
  }
}

module "tf_service" {
  source = "../../../terraform_environment/service_account"

  account_name = "terraform"
  project = local.project
}
