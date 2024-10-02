#tfsec:ignore:azure-container-logging
resource "azurerm_kubernetes_cluster" "main" {
  name                = "${var.environment}-${var.cluster_name}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix_name
  kubernetes_version  = var.aks_version
  #tfsec:ignore:azure-container-limit-authorized-ips
  private_cluster_enabled           = var.private_cluster_enabled
  sku_tier                          = var.aks_sku_tier
  role_based_access_control_enabled = var.rbac
  azure_policy_enabled              = var.azure_policy_enabled
  enable_pod_security_policy        = var.enable_pod_security_policy
  http_application_routing_enabled  = var.http_application_routing_enabled
  local_account_disabled            = var.local_account_disabled
  image_cleaner_enabled             = var.image_cleaner_enabled
  image_cleaner_interval_hours      = var.image_cleaner_interval_hours

  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      key_data = var.public_ssh_key
    }
  }

  default_node_pool {
    name            = var.agents_name
    node_count      = var.agents_count
    vm_size         = var.agents_size
    os_disk_size_gb = var.os_disk_size_gb
    max_pods        = var.max_pods
    vnet_subnet_id  = data.azurerm_subnet.subnet.id

    enable_auto_scaling = var.enable_auto_scaling

    # Settings for auto-scaling if enabled
    min_count = var.enable_auto_scaling ? var.auto_scaling_min_count : null
    max_count = var.enable_auto_scaling ? var.auto_scaling_max_count : null
  }

  network_profile {
    network_plugin    = var.network_plugin # Values: kubenet, azure
    network_policy    = var.network_policy # Values: calico, azure, We can use only if network_plugin is set to azure
    service_cidr      = var.service_cidr
    dns_service_ip    = var.dns_service_ip
    load_balancer_sku = var.load_balancer_sku # Values: basic, standard
    outbound_type     = var.outbound_type     # Values: loadBalancer and userDefinedRouting. Defaults to loadBalancer. We can use only if network_plugin is set to azure
  }

  dynamic "service_principal" {
    for_each = var.use_service_principal == true ? [1] : []
    content {
      client_id     = var.client_id
      client_secret = var.client_secret
    }
  }

  dynamic "identity" {
    for_each = var.use_service_principal == false ? [1] : []
    content {
      type = "SystemAssigned"
    }
  }

  dynamic "oms_agent" {
    for_each = var.enable_oms_agent ? [1] : []
    content {
      log_analytics_workspace_id = data.azurerm_log_analytics_workspace.main.id
    }
  }

  dynamic "microsoft_defender" {
    for_each = var.enable_microsoft_defender ? [1] : []
    content {
      log_analytics_workspace_id = data.azurerm_log_analytics_workspace.main.id
    }
  }

  auto_scaler_profile {
    balance_similar_node_groups      = var.auto_scaler_balance_similar_node_groups
    max_graceful_termination_sec     = var.auto_scaler_max_graceful_termination_sec
    scale_down_delay_after_add       = var.auto_scaler_scale_down_delay_after_add
    scale_down_utilization_threshold = var.auto_scaler_scale_down_utilization_threshold
    scan_interval                    = var.auto_scaler_scan_interval
  }
  tags       = var.default_tags
  depends_on = [data.azurerm_log_analytics_workspace.main]
}
