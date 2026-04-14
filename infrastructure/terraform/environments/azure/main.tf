module "aks_virtual_nodes" {
  source = "../../modules/aks-virtual-nodes"

  cluster_name        = var.cluster_name
  environment         = var.environment
  resource_group_name = var.resource_group_name
  location            = var.location
  kubernetes_version  = var.kubernetes_version
  subscription_id     = var.subscription_id
  dns_prefix          = "ots-aks"
}

module "managed_mysql" {
  source = "../../modules/managed-mysql"

  cloud_provider      = "azure"
  environment         = var.environment
  instance_name       = "ots-mysql-${var.environment}"
  db_password         = var.db_password
  resource_group_name = var.resource_group_name
  azure_location      = var.location

  depends_on = [module.aks_virtual_nodes]
}

module "rabbitmq" {
  source = "../../modules/rabbitmq"

  namespace         = "akhil-test"
  environment       = var.environment
  rabbitmq_password = var.rabbitmq_password

  depends_on = [module.aks_virtual_nodes]
}

module "minio" {
  source = "../../modules/minio"

  namespace           = "akhil-test"
  environment         = var.environment
  minio_root_password = var.minio_password

  depends_on = [module.aks_virtual_nodes]
}

module "infisical" {
  source = "../../modules/infisical"

  namespace                   = "akhil-test"
  environment                 = var.environment
  infisical_db_connection_uri = var.infisical_db_uri
  encryption_key              = var.infisical_encryption_key
  auth_secret                 = var.infisical_auth_secret

  depends_on = [module.aks_virtual_nodes]
}

module "knative" {
  source = "../../modules/knative"

  environment = var.environment

  depends_on = [module.aks_virtual_nodes]
}
