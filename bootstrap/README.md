# Creating a new Landing Zone on Google Cloud Platform

## Assumptions

For this guide we're assuming that some steps have already been followed, like creating the organization, billing and deciding the structure (folders, projects, shared resources, etc.). So we're focusing on steps like preparing for IaC (with Terraform) and ensuring the base services for project creation.

## Objective

The intent of this module is to be one of the initial steps on the Google Cloud setup. It will create the initial project to house the service account and bucket for Terraform state, eventually create a folder (if deemed necessary) and add the service account with ```roles/editor``` (per default, can be changed) at the organization or folder level. This is expected to be a one time action, and further cloud management operations should use different modules and store the state in the bucket provided (or their own buckets, according to the organization definitions).

Nevertheless, this module allows the following options:

1. Create the project at the organization level;
2. Create the project at a folder level;
3. Create a new folder and create the project bellow it;
4. Create a billing subaccount and use that for the project, instead of an already existing account;
5. Add the service account at the organization or folder level, as best suited for the organization in order to allow permissions inheritance;
6. Add users to the service account so impersonation can be used to secure IaC operations.

It is not expected to manage things like organization policies , IAM and other definitions that are may be expected to be maintained or changed throughout the lifetime of the organization.

## Required resources

In order to have a proper bootstrap and prepare the environment for use, the following actions and resources are necessary:

1. Billing account
2. A user with at least the following permissions:
    1. ```roles/editor``` at the organization level;
    2. ```roles/billing.user``` over the billing account;
    3. ```roles/billing.projectManager``` over the billing account;
    4. If it's decided that a subaccount will be created for the project, the permissions ```roles/billing.creator``` is also required.

## Using the module

A quick example of the module use is the following:

``` bash
module "bootstrap" {
  source = [path to module]

  organization_domain          = [company_domain]
  billing_account_name         = [billing_account_display_name]
  billing_account_id           = [billing_account_id]
  project_display_name         = [project_display_name]
  folder_name                  = [folder_name]
  service_account_display_name = [service_account_display_name]
  service_account_description  = [service_account_description]
  sa_users                     = [service_account_impersonation_users]
  bucket_name                  = [bucket_name_terraform_state]
  bucket_location              = [bucket_location]
}
```

There are the following possible inputs for this module (with eventual default values):

| Input | Description | Type | Required | Default Value | Example Input |
|-|-|-|-|-|-|
| organization_domain | Used to retrieve the organization ID |string | ✅ | n/a | "acme.org" |
| create_folder | Toggle to enable the folder creation. | bool | ❌ |false | n/a | |
| folder_name | The name for the folder, where the project will be created | string | ✅ | n/a | "uber_folder" |
| billing_account_id | Used to retrieve the billing account information | string | ✅ | n/a | "B1ED42-C568E7-5BC993-3EF7F4" |
| billing_account_name | Used to retrieve the billing account information | string | ❌ | n/a | "grant_all_the_funds" |
| create_billing_subaccount | Toggle to enable the creation of a billing subaccount for the project | bool | ❌ | false | false |
| billing_subaccount_name | The display name for the billing subaccount | string | ❌ | n/a | "bottomless_pit" |
| labels | Labels to attach to GCP resources | map(string) | ❌ | n/a | { managed = "Terraform \ purpose = "automation"} |
| auto_create_network | If the default VPC with multiple subnets is to be created | bool | ❌ | false | n/a |
| project_display_name | The display name for the project | string | ✅ | n/a | "awesome project" |
| service_account_display_name | The display name for the service account | string | ✅ | n/a | "automate the world" |
| service_account_description | The description for the service account | string | ✅ | n/a | "some random description" |
| sa_member_roles | The roles to grant users in order to allow service account impersonation | et(string) | ❌ | ["roles/iam.serviceAccountUser", "roles/iam.serviceAccountTokenCreator"] | n/a |
| sa_users | A list of users that'll be allowed to impersonate the service account | set(string) | ✅ | n/a | ["someone@bestcompany.biz"] |
| bucket_name | The name for the bucket where the Terraform state will be stored | string | ✅ | "tf-state" | n/a |
| bucket_location | The location for the bucket | string | ✅ | n/a | "europe-west1" |
| enable_bucket_force_destroy | If the bucket can be destroyed with contents | bool | ❌ | true | n/a |
| bucket_storage_class | The storage class for the bucket | string | ❌ | "STANDARD" | n/a |
| enable_bucket_versioning | If versioning is enabled on the bucket | bool | ❌ | true | n/a |
| enable_bucket_uniform_access | If uniform access is enabled on the bucket | bool | ❌ | true | n/a |

Additionally, the module exports the following outputs:

| Output | Description |
|-|-|
| folder_name | The name of the folder, if one was created |
| project_name | The name of the project that was created |
| project_id | The ID of the project that was created |
| project_billing_account | The billing account associated with the project |
| service_account_email | The e-mail of the service account |
| service_account_user | The users with permissions to impersonate the service account |
| tf_bucket_name | The name of the bucket for storing the Terraform state |
| tf_bucket_self_link | The self link for the bucket |

### Module options

There are some lines of code commented in some Terraform files, since there are multiple ways to approach the bootstrap process. These are there so we can 'enable' or change the approach for each organization.

#### project.tf

- Folder

It is possible to create a new folder to host the project, or just use an existing one. If no value for the var.folder.name variable is provided, the project will be created at the organization level.
Note that the Service Account assumes that a folder was created, so see bellow for the necessary changes otherwise.

- Billing

It is possible to create a billing subaccount. For this uncomment the respective lines ont eh project.tf file. The lines in question have comments with insructions themselves, so should be easy to identify which are necessary.

#### service_account.tf

- Organization

If the Service account is expected to have permissions at the organization level, please edit the file to uncomment the required lines. These should be commented with instructions also.

- Folder

If it is defined that the service account needs permissions at the organization level and not at the folder level (redundant since it'll inherit from the organization), please comment the resource for the folder IAM.

### To-Do

- Explore ways to have the module decide if the service account is to have permissions at organization or folder level and implement without needing to comment/uncomment code.
