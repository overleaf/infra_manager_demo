# Infrastructure Manager

Demo Terraform config for Google's new [Infrastructure Manager](https://cloud.google.com/infrastructure-manager/docs).

This repo needs to be public, as it appears Infrastructure Manager doesn't currently support auth to private GitHub repos.

```
export PROJECT_ID=...
export ACCOUNT_ID=...
gcloud projects create $PROJECT_ID  --folder=119554642474
gcloud billing projects link $PROJECT_ID --billing-account=$ACCOUNT_ID
gcloud --project  $PROJECT_ID services enable config.googleapis.com

gcloud --project  $PROJECT_ID iam service-accounts create sva-infra-manager
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:sva-infra-manager@$PROJECT_ID.iam.gserviceaccount.com" --role=roles/config.agent
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:sva-infra-manager@$PROJECT_ID.iam.gserviceaccount.com" --role=roles/owner

gcloud alpha --project $PROJECT_ID infra-manager deployments apply gce-instance --git-source-repo=https://github.com/overleaf/infra_manager_demo.git --git-source-directory=gce_instance --location=us-central1 --service-account=projects/$PROJECT_ID/serviceAccounts/sva-infra-manager@$PROJECT_ID.iam.gserviceaccount.com --input-values=project_id=$PROJECT_ID

gcloud alpha --project $PROJECT_ID infra-manager deployments delete gce-instance --location=us-central1
```