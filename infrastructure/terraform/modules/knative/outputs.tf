output "knative_namespace" {
  description = "Knative serving namespace"
  value       = var.namespace
}

output "kourier_namespace" {
  description = "Kourier ingress namespace"
  value       = var.kourier_namespace
}

output "ingress_class" {
  description = "Knative ingress class"
  value       = "kourier"
}
