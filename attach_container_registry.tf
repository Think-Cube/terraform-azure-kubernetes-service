resource "azurerm_role_assignment" "main" {
  count = "${var.enable_attach_acr}" ? 1 : 0

  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.main.kubelet_identity[0].object_id

  depends_on = [azurerm_kubernetes_cluster.main]
}
