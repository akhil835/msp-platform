# Azure Environment Configuration
# Replace placeholder values before applying

environment         = "dev"
subscription_id     = "xxxxxxxx"
location            = "eastus"
resource_group_name = "ots-rg-dev"
cluster_name        = "ots-aks-dev"
kubernetes_version  = "1.32"

# Sensitive values â€” inject via environment variables or secrets manager
# db_password              = "<REPLACE_ME>"
# rabbitmq_password        = "<REPLACE_ME>"
# minio_password           = "<REPLACE_ME>"
# infisical_db_uri         = "<REPLACE_ME>"
# infisical_encryption_key = "<REPLACE_ME>"
# infisical_auth_secret    = "<REPLACE_ME>"
