provider "google" {
  alias = "impersonation"
  scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/userinfo.email",
  ]
}

provider "google" {
  project         = local.deploy_project
  access_token    = data.google_service_account_access_token.terraform.access_token
  request_timeout = "60s"
}

terraform {
 backend "gcs" {
   bucket                      = "tf-state-260967835c6ff7cf"
   prefix                      = "tester-gke"
   impersonate_service_account = "terraform@gcloud-cd-playground-fferrinho.iam.gserviceaccount.com"
 }
}
