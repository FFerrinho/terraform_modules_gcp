provider "google" {
  # Configuration options
}


module "tf_state" {
  source = "../"

  bucket_name     = "tf-state"
  bucket_location = "europe-west1"
  bucket_project  = "tb-shared-terraform"
}
