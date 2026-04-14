terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "ots-terraform-state-aws"
    key            = "environments/aws/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "ots-terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      project = "ots-integration"
      env     = var.environment
    }
  }
}

provider "helm" {
  kubernetes {
    host                   = module.eks_fargate.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks_fargate.cluster_ca_certificate)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", module.eks_fargate.cluster_name]
      command     = "aws"
    }
  }
}

provider "kubernetes" {
  host                   = module.eks_fargate.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks_fargate.cluster_ca_certificate)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", module.eks_fargate.cluster_name]
    command     = "aws"
  }
}
