# GCP Environment Configuration
# Replace placeholder values before applying

environment        = "dev"
project_id         = "<REPLACE_WITH_GCP_PROJECT_ID>"
region             = "us-central1"
cluster_name       = "ots-gke-dev"
kubernetes_version = "1.32"
gcp_network        = ""

# Sensitive values â€” inject via environment variables or secrets manager
# db_password              = "<REPLACE_ME>"
# rabbitmq_password        = "<REPLACE_ME>"
# minio_password           = "<REPLACE_ME>"
# infisical_db_uri         = "<REPLACE_ME>"
# infisical_encryption_key = "<REPLACE_ME>"
# infisical_auth_secret    = "<REPLACE_ME>"
