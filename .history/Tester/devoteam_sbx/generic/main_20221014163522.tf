module "tf_state" {
  source = "../../../terraform_backend"

  bucket_name     = "tf-state"
  bucket_location = "europe-west1"
  bucket_project  = "gcloud-cd-playground-fferrinho"
  bucket_labels = {
    "creator" = "devoteam"
    "tool"    = "terraform"
  }
}
