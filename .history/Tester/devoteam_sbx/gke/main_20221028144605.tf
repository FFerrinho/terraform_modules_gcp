/* module "gke" {
    source = "/gke"
} */

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
