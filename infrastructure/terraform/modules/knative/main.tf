# Knative Serving via Helm
resource "helm_release" "knative_operator" {
  name             = var.release_name
  namespace        = var.namespace
  create_namespace = true
  repository       = "https://charts.knative.dev"
  chart            = "knative-operator"
  version          = var.chart_version

  set {
    name  = "commonLabels.project"
    value = "ots-integration"
  }

  set {
    name  = "commonLabels.env"
    value = var.environment
  }
}

# Kourier Ingress for Knative (as required by acceptance criteria)
resource "helm_release" "kourier" {
  name             = var.kourier_release_name
  namespace        = var.kourier_namespace
  create_namespace = true
  repository       = "https://charts.konghq.com"
  chart            = "kong"
  version          = var.kourier_chart_version

  set {
    name  = "proxy.enabled"
    value = "true"
  }

  set {
    name  = "commonLabels.project"
    value = "ots-integration"
  }

  set {
    name  = "commonLabels.env"
    value = var.environment
  }

  depends_on = [helm_release.knative_operator]
}
