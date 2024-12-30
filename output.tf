output "id" {
  description = "The unique identifier (ID) of the Kubernetes Managed Cluster."
  value       = azurerm_kubernetes_cluster.main.id
  sensitive   = true
}

output "client_key" {
  description = "The base64-encoded private key used by clients to authenticate to the Kubernetes cluster."
  value       = azurerm_kubernetes_cluster.main.kube_config.0.client_key
  sensitive   = true
}

output "client_certificate" {
  description = "The base64-encoded public certificate used by clients to authenticate to the Kubernetes cluster."
  value       = azurerm_kubernetes_cluster.main.kube_config.0.client_certificate
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "The base64-encoded public Certificate Authority (CA) certificate used as the root of trust for the Kubernetes cluster."
  value       = azurerm_kubernetes_cluster.main.kube_config.0.cluster_ca_certificate
  sensitive   = true
}

output "cluster_username" {
  description = "The username used for authentication to the Kubernetes cluster."
  value       = azurerm_kubernetes_cluster.main.kube_config.0.username
  sensitive   = false
}

output "cluster_password" {
  description = "The password or token used for authentication to the Kubernetes cluster."
  value       = azurerm_kubernetes_cluster.main.kube_config.0.password
  sensitive   = true
}

output "kube_config" {
  description = "The raw kube_config block for the Kubernetes cluster as defined below."
  value       = azurerm_kubernetes_cluster.main.kube_config_raw
  sensitive   = true
}

output "host" {
  description = "The host URL of the Kubernetes cluster server."
  value       = azurerm_kubernetes_cluster.main.kube_config.0.host
  sensitive   = false
}
