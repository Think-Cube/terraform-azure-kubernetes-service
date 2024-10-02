###########################
# Common vars
###########################
variable "environment" {
  description = "Defines the environment for the backend container (e.g., dev, stage, prod)."
  type        = string
  default     = "dev"
}

variable "default_tags" {
  description = "A map of default tags to apply to all resources for organization and tracking."
  type        = map(any)
  default     = null
}

variable "region" {
  description = "Specifies the region where the resources will be deployed (e.g., weu, us-east)."
  type        = string
  default     = "weu"
}
###########################
# Resource groups variables
###########################

variable "resource_group_location" {
  description = "Specifies the Azure region where the resource group will be created. Changing this will recreate the resource group."
  default     = "West Europe"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group to be created in Azure."
  type        = string
}
###########################
# Azure Kubernetes Service vars
###########################
variable "cluster_name" {
  description = "Specifies the name of the Managed Kubernetes Cluster to create. Changing this will result in the creation of a new cluster."
  type        = string
}

variable "use_service_principal" {
  description = "Indicates whether to use a service principal (true) or a managed identity (false) for authentication."
  type        = bool
  default     = true
}

variable "client_id" {
  description = "The Client ID associated with the Service Principal. This is required when using a service principal for authentication."
  type        = string
  default     = null
}

variable "client_secret" {
  description = "The Client Secret associated with the Service Principal. This is required when using a service principal for authentication."
  type        = string
  default     = null
}

variable "admin_username" {
  description = "The administrator username for the cluster. Changing this will result in the creation of a new cluster."
  type        = string
  default     = "azureadmin"
}
variable "agents_size" {
  description = "Specifies the size of the virtual machine for the agent nodes, such as Standard_DS2_v2. Changing this will result in the creation of new agent nodes."
  type        = string
  default     = "Standard_B2s"
}

variable "name_log_analytics_workspace" {
  description = "Specifies the name of the Log Analytics Workspace to be created or used."
  type        = string
  default     = null
}

variable "agents_count" {
  description = "The initial number of nodes to be included in the node pool. This value must be between 1 and 1000, and within the specified min_count and max_count."
  type        = number
  default     = 1
}

variable "public_ssh_key" {
  description = "The public SSH key used for accessing the cluster. Changing this will result in the creation of new access configurations."
  type        = string
  default     = null
}

variable "solution_name" {
  description = "Specifies the name of the solution to be deployed. Changing this will result in the creation of new configurations."
  type        = string
  default     = "ContainerInsights"
}

variable "aks_version" {
  description = "Specifies the version of Kubernetes to be used when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time, but it will not auto-upgrade."
  type        = string
  default     = "1.22.7"
}

variable "private_cluster_enabled" {
  description = "Determines whether the Kubernetes cluster's API server should be accessible only via internal IP addresses. This setting provides a private IP address for the Kubernetes API within the virtual network. Defaults to false. Changing this will result in the creation of a new cluster."
  type        = bool
  default     = false
}

variable "rbac" {
  description = "Indicates whether Role-Based Access Control (RBAC) should be enabled for the Kubernetes cluster. Defaults to true. Changing this will result in the creation of a new cluster."
  type        = bool
  default     = true
}
variable "agents_name" {
  description = "Specifies the name for the default Kubernetes Node Pool. Changing this will result in the creation of a new node pool."
  type        = string
  default     = "nodepool"
}

variable "os_disk_size_gb" {
  description = "Specifies the size of the OS disk for each agent in the node pool, measured in gigabytes. Changing this will result in the creation of new agent nodes."
  type        = number
  default     = 120
}

variable "subnet_name" {
  description = "The name of the subnet to be used for the Kubernetes cluster."
  type        = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network to be associated with the Kubernetes cluster."
  type        = string
}

variable "vnet_rg_name" {
  description = "Specifies the Resource Group in which the Virtual Network will reside."
  type        = string
}

variable "network_plugin" {
  description = "Specifies the network plugin to be used for networking within the cluster. Supported values include azure, kubenet, and none. Changing this will result in the creation of a new cluster."
  type        = string
  default     = "kubenet"
}

variable "network_policy" {
  description = "Defines the network policy to be used with Azure CNI. Network policies control traffic flow between pods. Supported values include calico and azure. Changing this will result in the creation of a new cluster."
  type        = string
  default     = null
}

variable "service_cidr" {
  description = "Specifies the network range for Kubernetes services. Changing this will result in the creation of a new cluster."
  type        = string
  default     = "172.16.2.0/24"
}

variable "dns_service_ip" {
  description = "The IP address within the Kubernetes service address range designated for service discovery (kube-dns). Changing this will result in the creation of a new cluster."
  type        = string
  default     = "172.16.2.11"
}
variable "load_balancer_sku" {
  description = "Specifies the SKU of the Load Balancer for the Kubernetes Cluster. Possible values are Basic and Standard, with a default of Standard."
  type        = string
  default     = "standard"
}

variable "outbound_type" {
  description = "Defines the outbound (egress) routing method for the Kubernetes Cluster. Possible values include loadBalancer, userDefinedRouting, managedNATGateway, and userAssignedNATGateway, with a default of loadBalancer."
  type        = string
  default     = "loadBalancer"
}

variable "max_pods" {
  description = "Indicates the maximum number of pods that can run on each agent. Changing this will result in the creation of new agent nodes."
  type        = number
  default     = 60
}

variable "aks_sku_tier" {
  description = "Specifies the SKU Tier for the Kubernetes Cluster. Possible values are Free and Paid (which includes the Uptime SLA), with a default of Free."
  type        = string
  default     = "Free"
}

variable "enable_attach_acr" {
  description = "Enables ACR (Azure Container Registry) Pull attach. Requires acr_id to be defined."
  type        = bool
  default     = false
}

variable "acr_id" {
  description = "Specifies the ACR ID to allow pull access from the Azure Container Registry using the Service Principal or Managed Identity."
  type        = string
  default     = null
}

variable "azure_policy_enabled" {
  description = "Enables Azure Policy for the AKS cluster."
  type        = bool
  default     = false
}

variable "enable_pod_security_policy" {
  description = "Enables Pod Security Policy for the AKS cluster."
  type        = bool
  default     = false
}

variable "http_application_routing_enabled" {
  description = "Enables HTTP Application Routing for the AKS cluster."
  type        = bool
  default     = false
}

variable "local_account_disabled" {
  description = "Disables local accounts within the AKS cluster."
  type        = bool
  default     = false
}
variable "auto_scaler_balance_similar_node_groups" {
  description = "Enables balancing of similar node groups within the auto-scaler profile."
  type        = bool
  default     = false
}

variable "auto_scaler_max_graceful_termination_sec" {
  description = "Specifies the maximum duration for graceful termination of nodes within the auto-scaler profile, measured in seconds."
  type        = number
  default     = 600
}

variable "auto_scaler_scale_down_delay_after_add" {
  description = "Defines the delay before scaling down after adding nodes in the auto-scaler profile, specified in duration (e.g., 10m for 10 minutes)."
  type        = string
  default     = "10m"
}

variable "auto_scaler_scale_down_utilization_threshold" {
  description = "Sets the utilization threshold for scaling down nodes within the auto-scaler profile. If the average utilization of a node pool falls below this threshold, scaling down may occur."
  type        = number
  default     = 0.5
}

variable "auto_scaler_scan_interval" {
  description = "Indicates the interval at which the auto-scaler scans the node pools, specified in duration (e.g., 10s for 10 seconds)."
  type        = string
  default     = "10s"
}

variable "dns_prefix_name" {
  description = "Specifies the DNS prefix when creating the managed cluster. Must start and end with a letter or number, contain only letters, numbers, and hyphens, and be between 1 and 54 characters in length. Changing this will result in the creation of a new resource."
  type        = string
  default     = ""
}

variable "enable_auto_scaling" {
  description = "Enables auto-scaling for the default node pool of the Kubernetes cluster."
  type        = bool
  default     = false
}

variable "auto_scaling_min_count" {
  description = "Specifies the minimum number of nodes for auto-scaling in the Kubernetes cluster."
  type        = number
  default     = 1
}

variable "auto_scaling_max_count" {
  description = "Specifies the maximum number of nodes for auto-scaling in the Kubernetes cluster."
  type        = number
  default     = 3
}

variable "image_cleaner_enabled" {
  description = "Enables the image cleaner feature within the AKS cluster to help manage and clean up unused images."
  type        = bool
  default     = false
}

variable "image_cleaner_interval_hours" {
  description = "Defines the interval, in hours, for the image cleaner to run within the AKS cluster."
  type        = number
  default     = 24
}

variable "enable_oms_agent" {
  description = "Enables the OMS (Operations Management Suite) agent within the AKS cluster for monitoring and management."
  type        = bool
  default     = false
}

variable "enable_microsoft_defender" {
  description = "Enables Microsoft Defender within the AKS cluster for enhanced security and threat protection."
  type        = bool
  default     = false
}
