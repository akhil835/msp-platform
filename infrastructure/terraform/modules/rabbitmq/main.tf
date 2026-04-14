resource "helm_release" "rabbitmq" {
  name             = var.release_name
  namespace        = var.namespace
  create_namespace = true
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "rabbitmq"
  version          = var.chart_version

  set {
    name  = "auth.username"
    value = var.rabbitmq_username
  }

  set {
    name  = "auth.password"
    value = var.rabbitmq_password
  }

  set {
    name  = "replicaCount"
    value = var.replica_count
  }

  # No persistent volumes - use ephemeral storage
  set {
    name  = "persistence.enabled"
    value = "false"
  }

  set {
    name  = "commonLabels.project"
    value = "ots-integration"
  }

  set {
    name  = "commonLabels.env"
    value = var.environment
  }
}
