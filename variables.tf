variable "environment" {
  description = "The environment used for the backend container name key (e.g., 'dev', 'test', 'prod')."
  type        = string
  default     = "dev"
}

variable "default_tags" {
  description = "A mapping of tags to assign to the resources for organization and management purposes."
  type        = map(any)
  default     = null
}

variable "region" {
  description = "The region in which the resources will be deployed."
  type        = string
  default     = "weu"
}

variable "resource_group_location" {
  description = "The location or region where the virtual network is created. Changing this will recreate the resource."
  default     = "West Europe"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the virtual network will be created."
  type        = string
}

variable "cluster_name" {
  description = "The name of the Managed Kubernetes Cluster to create. Changing this will recreate the resource."
  type        = string
}

variable "use_service_principal" {
  description = "Set to true to use a service principal for authentication, or false to use a managed identity."
  type        = bool
  default     = true
}

variable "client_id" {
  description = "The Client ID associated with the Service Principal."
  type        = string
  default     = null
}

variable "client_secret" {
  description = "The Client Secret associated with the Service Principal."
  type        = string
  default     = null
}

variable "admin_username" {
  description = "The admin username for the Kubernetes cluster. Changing this will recreate the resource."
  type        = string
  default     = "azureadmin"
}

variable "agents_size" {
  description = "The size of the Virtual Machine instances in the node pool (e.g., 'Standard_DS2_v2'). Changing this will recreate the resource."
  type        = string
  default     = "Standard_B2s"
}

variable "name_log_analytics_workspace" {
  description = "The name of the Log Analytics Workspace to be created."
  type        = string
  default     = null
}

variable "agents_count" {
  description = "The initial number of nodes in the node pool. The value must be between 1 and 1000, and within the min_count and max_count range."
  type        = number
  default     = 1
}

variable "public_ssh_key" {
  description = "The public SSH key used to access the Kubernetes cluster. Changing this will recreate the resource."
  type        = string
  default     = null
}

variable "solution_name" {
  description = "The name of the solution to be deployed. Changing this will recreate the resource."
  type        = string
  default     = "ContainerInsights"
}

variable "aks_version" {
  description = "The version of Kubernetes to use when creating the AKS managed cluster. If not specified, the latest recommended version will be used, but it won't auto-upgrade."
  type        = string
  default     = "1.30.3"
}

variable "private_cluster_enabled" {
  description = "Indicates whether the Kubernetes API server should be exposed only on internal IP addresses, providing a private IP for the Kubernetes API within the Virtual Network. Defaults to false. Changing this will recreate the resource."
  type        = bool
  default     = false
}

variable "rbac" {
  description = "Specifies whether Role-Based Access Control (RBAC) should be enabled for the Kubernetes Cluster. Defaults to true. Changing this will recreate the resource."
  type        = bool
  default     = true
}

variable "agents_name" {
  description = "The name of the default Kubernetes Node Pool. Changing this will recreate the resource."
  type        = string
  default     = "nodepool"
}

variable "os_disk_size_gb" {
  description = "The size (in GB) of the OS disk for each agent in the Node Pool. Changing this will recreate the resource."
  type        = number
  default     = 120
}

variable "subnet_name" {
  description = "The name of the subnet where the Kubernetes cluster will be deployed."
  type        = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network for the Kubernetes cluster."
  type        = string
}

variable "vnet_rg_name" {
  description = "The name of the Resource Group that contains the Virtual Network."
  type        = string
}

variable "network_plugin" {
  description = "The network plugin to use for networking within the cluster. Supported values are 'azure', 'kubenet', and 'none'. Changing this will recreate the resource."
  type        = string
  default     = "kubenet"
}

variable "network_policy" {
  description = "The network policy to use with Azure CNI. Network policies control traffic flow between pods. Supported values are 'calico' and 'azure'. Changing this will recreate the resource."
  type        = string
  default     = null
}

variable "service_cidr" {
  description = "The network range used for Kubernetes services. Changing this will recreate the resource."
  type        = string
  default     = "172.16.2.0/24"
}

variable "dns_service_ip" {
  description = "The IP address within the Kubernetes service address range for cluster service discovery (kube-dns). Changing this will recreate the resource."
  type        = string
  default     = "172.16.2.11"
}

variable "load_balancer_sku" {
  description = "The SKU for the Load Balancer used by the Kubernetes Cluster. Supported values are 'Basic' and 'Standard'. Defaults to 'Standard'."
  type        = string
  default     = "standard"
}

variable "outbound_type" {
  description = "The outbound (egress) routing method for the Kubernetes Cluster. Supported values are 'loadBalancer', 'userDefinedRouting', 'managedNATGateway', and 'userAssignedNATGateway'. Defaults to 'loadBalancer'."
  type        = string
  default     = "loadBalancer"
}

variable "max_pods" {
  description = "The maximum number of pods that can run on each agent. Changing this will recreate the resource."
  type        = number
  default     = 60
}

variable "aks_sku_tier" {
  description = "The SKU tier for the Kubernetes Cluster. Possible values are 'Free' and 'Paid' (includes uptime SLA). Defaults to 'Free'."
  type        = string
  default     = "Free"
}

variable "enable_attach_acr" {
  description = "Enable Azure Container Registry (ACR) Pull attach. Requires the 'acr_id' variable to be defined."
  type        = bool
  default     = false
}

variable "acr_id" {
  description = "The ID of the Azure Container Registry to allow ACR Pull from the Service Principal or Managed Identity."
  type        = string
  default     = null
}

variable "azure_policy_enabled" {
  description = "Enable Azure Policy for the AKS cluster."
  type        = bool
  default     = false
}

variable "http_application_routing_enabled" {
  description = "Enable HTTP Application Routing in the AKS cluster."
  type        = bool
  default     = false
}

variable "local_account_disabled" {
  description = "Disable local accounts in the AKS cluster."
  type        = bool
  default     = false
}

variable "auto_scaler_balance_similar_node_groups" {
  description = "Balance similar node groups in the auto-scaler profile."
  type        = bool
  default     = false
}

variable "auto_scaler_max_graceful_termination_sec" {
  description = "Maximum number of seconds for graceful termination in the auto-scaler profile."
  type        = number
  default     = 600
}

variable "auto_scaler_scale_down_delay_after_add" {
  description = "Scale-down delay after node addition in the auto-scaler profile."
  type        = string
  default     = "10m"
}

variable "auto_scaler_scale_down_utilization_threshold" {
  description = "Utilization threshold for scaling down in the auto-scaler profile."
  type        = number
  default     = 0.5
}

variable "auto_scaler_scan_interval" {
  description = "Scan interval for the auto-scaler profile."
  type        = string
  default     = "10s"
}

variable "auto_scaler_skip_nodes_with_local_storage" {
  description = "Skip nodes with local storage when scaling down."
  type        = bool
  default     = false
}

variable "dns_prefix_name" {
  description = "DNS prefix specified when creating the managed cluster. Must begin and end with a letter or number, contain only letters, numbers, and hyphens, and be between 1 and 54 characters long. Changing this will recreate the resource."
  type        = string
  default     = ""
}

variable "enable_auto_scaling" {
  description = "Enable auto-scaling for the default node pool."
  type        = bool
  default     = false
}

variable "auto_scaling_min_count" {
  description = "The minimum number of nodes for auto-scaling."
  type        = number
  default     = 1
}

variable "auto_scaling_max_count" {
  description = "The maximum number of nodes for auto-scaling."
  type        = number
  default     = 3
}

variable "image_cleaner_enabled" {
  description = "Enable the image cleaner in the AKS cluster."
  type        = bool
  default     = false
}

variable "image_cleaner_interval_hours" {
  description = "The interval in hours for the image cleaner to run in the AKS cluster."
  type        = number
  default     = 24
}

variable "enable_oms_agent" {
  description = "Enable the OMS (Operations Management Suite) agent in the AKS cluster."
  type        = bool
  default     = false
}

variable "enable_microsoft_defender" {
  description = "Enable Microsoft Defender in the AKS cluster for security scanning and protection."
  type        = bool
  default     = false
}

variable "enable_ingress_application_gateway" {
  description = "Whether to enable the ingress application gateway for traffic routing to the cluster."
  type        = bool
  default     = false
}

variable "ingress_gateway_id" {
  description = "Optional: The ID of the Application Gateway to integrate with the ingress controller."
  type        = string
  default     = null
}

variable "ingress_gateway_name" {
  description = "Optional: The name of the Application Gateway to be used or created for ingress traffic."
  type        = string
  default     = null
}

variable "ingress_gateway_subnet_id" {
  description = "Optional: The ID of the subnet where the Application Gateway will be deployed."
  type        = string
  default     = null
}

variable "ingress_gateway_subnet_cidr" {
  description = "Optional: The CIDR block for the subnet where the Application Gateway will be deployed."
  type        = string
  default     = null
}

variable "msi_auth_for_monitoring_enabled" {
  description = "Enable Managed Service Identity (MSI) authentication for monitoring in the OMS agent."
  type        = bool
  default     = false
}

variable "node_os_upgrade_channel" {
  description = "The upgrade channel for the OS image of Kubernetes cluster nodes. Valid options are 'Unmanaged', 'SecurityPatch', 'NodeImage', and 'None'. Defaults to 'None'."
  type        = string
  default     = "None"
}

variable "automatic_upgrade_channel" {
  description = "The upgrade channel for the Kubernetes cluster. Valid options are 'patch', 'rapid', 'node-image', and 'stable'. Omitting this sets the value to 'none'."
  type        = string
  default     = "none"
}

variable "upgrade_settings_drain_timeout_in_minutes" {
  description = "The number of minutes to wait for eviction of pods and graceful termination per node during an upgrade."
  type        = number
  default     = null
}

variable "upgrade_settings_node_soak_duration_in_minutes" {
  description = "The amount of time in minutes to wait after draining a node before re-imaging it and moving on to the next node during an upgrade."
  type        = number
  default     = null
}

variable "upgrade_settings_max_surge" {
  description = "The maximum number or percentage of nodes to be added to the Node Pool size during an upgrade."
  type        = string
  default     = null
}

variable "enable_upgrade_settings" {
  description = "Enable or disable upgrade settings for the default node pool during an AKS upgrade."
  type        = bool
  default     = false
}

variable "enable_workload_autoscaler_profile" {
  description = "Specifies whether the workload autoscaler profile block should be enabled in the AKS cluster."
  type        = bool
  default     = false
}

variable "workload_autoscaler_keda_enabled" {
  description = "Specifies whether the KEDA (Kubernetes Event-driven Autoscaling) Autoscaler can be used for workloads in the AKS cluster."
  type        = bool
  default     = false
}

variable "workload_autoscaler_vpa_enabled" {
  description = "Specifies whether the Vertical Pod Autoscaler (VPA) should be enabled for automatically adjusting the resources of running pods."
  type        = bool
  default     = false
}
