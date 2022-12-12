module "tf_state" {
  source = "../bucket"

  bucket_name     = "YOUR_BUCKET_NAME"
  bucket_location = "YOUR_ZONE"
  bucket_project  = "YOUR_PROJECT"
  bucket_labels = {
    "creator" = "devoteam"
    "tool"    = "terraform"
  }
}

module "tf_service" {
  source = "../service_account"

  account_name = "terraform"
  display_name = "SA for Terraform automation."
  project = local.project
  sa_token_creators = ["YOUR_USER_EMAIL"]
}
