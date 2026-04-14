resource "helm_release" "minio" {
  name             = var.release_name
  namespace        = var.namespace
  create_namespace = true
  repository       = "https://charts.min.io/"
  chart            = "minio"
  version          = var.chart_version

  set {
    name  = "rootUser"
    value = var.minio_root_user
  }

  set {
    name  = "rootPassword"
    value = var.minio_root_password
  }

  set {
    name  = "replicas"
    value = var.replica_count
  }

  # No persistent volumes
  set {
    name  = "persistence.enabled"
    value = "false"
  }

  set {
    name  = "mode"
    value = "standalone"
  }

  set {
    name  = "commonLabels.project"
    value = "ots-integration"
  }

  set {
    name  = "commonLabels.env"
    value = var.environment
  }

  dynamic "set" {
    for_each = var.buckets
    content {
      name  = "buckets[${set.key}].name"
      value = set.value
    }
  }
}
