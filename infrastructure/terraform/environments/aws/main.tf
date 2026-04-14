module "eks_fargate" {
  source = "../../modules/eks-fargate"

  cluster_name       = var.cluster_name
  environment        = var.environment
  region             = var.region
  kubernetes_version = var.kubernetes_version
  account_id         = var.account_id

  fargate_profiles = [
    { profile_name = "default",     namespace = "default" },
    { profile_name = "kube-system", namespace = "kube-system" },
    { profile_name = "akhil-test",  namespace = "akhil-test" }
  ]
}

module "managed_mysql" {
  source = "../../modules/managed-mysql"

  cloud_provider = "aws"
  environment    = var.environment
  instance_name  = "ots-mysql-${var.environment}"
  db_password    = var.db_password
  subnet_ids     = module.eks_fargate.private_subnet_ids
  vpc_id         = module.eks_fargate.vpc_id

  depends_on = [module.eks_fargate]
}

module "rabbitmq" {
  source = "../../modules/rabbitmq"

  namespace         = "akhil-test"
  environment       = var.environment
  rabbitmq_password = var.rabbitmq_password

  depends_on = [module.eks_fargate]
}

module "minio" {
  source = "../../modules/minio"

  namespace           = "akhil-test"
  environment         = var.environment
  minio_root_password = var.minio_password

  depends_on = [module.eks_fargate]
}

module "infisical" {
  source = "../../modules/infisical"

  namespace                   = "akhil-test"
  environment                 = var.environment
  infisical_db_connection_uri = var.infisical_db_uri
  encryption_key              = var.infisical_encryption_key
  auth_secret                 = var.infisical_auth_secret

  depends_on = [module.eks_fargate]
}

module "knative" {
  source = "../../modules/knative"

  environment = var.environment

  depends_on = [module.eks_fargate]
}
