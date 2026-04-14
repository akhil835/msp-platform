resource "helm_release" "infisical" {
  name             = var.release_name
  namespace        = var.namespace
  create_namespace = true
  repository       = "https://dl.cloudsmith.io/public/infisical/helm-charts/helm/charts/"
  chart            = "infisical"
  version          = var.chart_version

  set {
    name  = "infisical.autoDatabaseSchemaMigration"
    value = "true"
  }

  set_sensitive {
    name  = "infisical.backendEnvironmentVariables.DB_CONNECTION_URI"
    value = var.infisical_db_connection_uri
  }

  set_sensitive {
    name  = "infisical.backendEnvironmentVariables.ENCRYPTION_KEY"
    value = var.encryption_key
  }

  set_sensitive {
    name  = "infisical.backendEnvironmentVariables.AUTH_SECRET"
    value = var.auth_secret
  }

  # No persistent volumes
  set {
    name  = "mongodb.persistence.enabled"
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
