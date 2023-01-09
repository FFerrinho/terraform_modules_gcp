provider "google" {
 alias = "impersonation"
 scopes = [
   "https://www.googleapis.com/auth/cloud-platform",
   "https://www.googleapis.com/auth/userinfo.email",
 ]
}

provider "google" {
 project 		= var.project
 access_token	= data.google_service_account_access_token.default.access_token
 request_timeout 	= "60s"
}

terraform {
 backend "gcs" {
   bucket                      = "GCS_BUCKET_NAME"
   prefix                      = "OPTIONAL_PREFIX" 
   impersonate_service_account = "YOUR_SERVICE_ACCOUNT@YOUR_PROJECT.iam.gserviceaccount.com"
 }
}
