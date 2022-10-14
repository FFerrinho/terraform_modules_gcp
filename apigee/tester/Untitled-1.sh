#!/bin/bash
PROJECT_ID="YOUR_PROJECT"
RUNTIME_LOCATION="europe-west1"
ANALYTICS_REGION="europe-west1"
RANGE_NAME="apigee-range"
NETWORK_NAME="apigee-vpc"
AUTH="Authorization: Bearer $(gcloud auth print-access-token)"
ENVIRONMENT_NAME=("eval")

# Enable the Apigee API
gcloud services enable apigee.googleapis.com --project=$PROJECT_ID

# Create VPC
gcloud compute networks create $NETWORK_NAME --subnet-mode=auto --bgp-routing-mode=regional --mtu=1460
# Network to peer with Apigee VPC (needs to be a /22)
gcloud compute addresses create $RANGE_NAME --global --prefix-length=22 --description="Peering range for Apigee services" --network=$NETWORK_NAME --purpose=VPC_PEERING --project=$PROJECT_ID
#gcloud compute addresses create $RANGE_NAME --global --prefix-length=22 --description="Peering range for Apigee services" --network='vpc-europe-west1' --purpose=VPC_PEERING --project=$PROJECT_ID
# Apigee troubleshooting network
gcloud compute addresses create google-managed-services-support-1 --global --prefix-length=28 --description="Peering range for supporting Apigee services" --network=$NETWORK_NAME --purpose=VPC_PEERING --project=$PROJECT_ID
# Peering the network
gcloud services vpc-peerings connect --service=servicenetworking.googleapis.com --network=$NETWORK_NAME --ranges=$RANGE_NAME,google-managed-services-support-1 --project=$PROJECT_ID

#Apigee organization
gcloud alpha apigee organizations provision --runtime-location=$RUNTIME_LOCATION --analytics-region=$ANALYTICS_REGION --authorized-network=$NETWORK_NAME --project=$PROJECT_ID

# Obtain the IP for the API Proxy
# gcloud compute addresses describe $RANGE_NAME --format="get(address)" --global --project=$PROJECT_ID

# Test curl
curl -i -H "$AUTH" "https://apigee.googleapis.com/v1/organizations/$PROJECT_ID/environments/eval/apis/hello-world/revisions/1/deployments"

# Create environments (not possible on EVAL org)
for env in $ENVIRONMENT_NAME; do
    curl "https://apigee.googleapis.com/v1/organizations/$PROJECT_ID/environments" -H "$AUTH" -X POST -H "Content-Type:application/json" -d '{"name":"'"$env"'"}'
done

# List the environments to check if creation was successful
curl -i -H "$AUTH" "https://apigee.googleapis.com/v1/organizations/$PROJECT_ID/environments"
