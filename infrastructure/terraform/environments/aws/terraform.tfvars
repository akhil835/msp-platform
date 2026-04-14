# AWS Environment Configuration
# Replace placeholder values before applying

environment        = "dev"
region             = "us-east-1"
cluster_name       = "ots-eks-dev"
account_id         = "258397330626"
kubernetes_version = "1.32"

# Sensitive values â€” inject via environment variables or secrets manager
# db_password              = "<REPLACE_ME>"
# rabbitmq_password        = "<REPLACE_ME>"
# minio_password           = "<REPLACE_ME>"
# infisical_db_uri         = "<REPLACE_ME>"
# infisical_encryption_key = "<REPLACE_ME>"
# infisical_auth_secret    = "<REPLACE_ME>"
