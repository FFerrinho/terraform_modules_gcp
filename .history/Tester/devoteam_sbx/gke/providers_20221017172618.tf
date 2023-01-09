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
