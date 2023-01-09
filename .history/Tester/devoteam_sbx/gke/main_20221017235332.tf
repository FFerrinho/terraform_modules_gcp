/* module "gke" {
    source = "/gke"
} */

locals {
  project = "gcloud-cd-playground-fferrinho"
  terraform_service_account = "terraform@gcloud-cd-playground-fferrinho.iam.gserviceaccount.com"
}

module "bucket" {
    source = "../../../terraform_environment/bucket"

    bucket_name     = "test"
  bucket_location = "europe-west1"
  bucket_project  = local.project
  bucket_labels = {
    "creator" = "devoteam"
    "tool"    = "terraform"
    "backend" = "local"
  }
}
