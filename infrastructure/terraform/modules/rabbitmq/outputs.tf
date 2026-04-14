output "service_name" {
  description = "RabbitMQ service name"
  value       = "${var.release_name}-rabbitmq"
}

output "namespace" {
  description = "RabbitMQ namespace"
  value       = var.namespace
}

output "amqp_port" {
  description = "AMQP port"
  value       = 5672
}

output "management_port" {
  description = "Management UI port"
  value       = 15672
}
