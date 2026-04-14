module "gke_autopilot" {
  source = "../../modules/gke-autopilot"

  cluster_name       = var.cluster_name
  environment        = var.environment
  project_id         = var.project_id
  region             = var.region
  kubernetes_version = var.kubernetes_version
}

module "managed_mysql" {
  source = "../../modules/managed-mysql"

  cloud_provider = "gcp"
  environment    = var.environment
  instance_name  = "ots-mysql-${var.environment}"
  db_password    = var.db_password
  project_id     = var.project_id
  gcp_region     = var.region
  gcp_network    = var.gcp_network

  depends_on = [module.gke_autopilot]
}

module "rabbitmq" {
  source = "../../modules/rabbitmq"

  namespace         = "akhil-test"
  environment       = var.environment
  rabbitmq_password = var.rabbitmq_password

  depends_on = [module.gke_autopilot]
}

module "minio" {
  source = "../../modules/minio"

  namespace           = "akhil-test"
  environment         = var.environment
  minio_root_password = var.minio_password

  depends_on = [module.gke_autopilot]
}

module "infisical" {
  source = "../../modules/infisical"

  namespace                   = "akhil-test"
  environment                 = var.environment
  infisical_db_connection_uri = var.infisical_db_uri
  encryption_key              = var.infisical_encryption_key
  auth_secret                 = var.infisical_auth_secret

  depends_on = [module.gke_autopilot]
}

module "knative" {
  source = "../../modules/knative"

  environment = var.environment

  depends_on = [module.gke_autopilot]
}
