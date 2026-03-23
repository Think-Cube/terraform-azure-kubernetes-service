## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.62.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.62.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.62.0/docs/resources/kubernetes_cluster) | resource |
| [azurerm_role_assignment.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.62.0/docs/resources/role_assignment) | resource |
| [azurerm_log_analytics_workspace.main](https://registry.terraform.io/providers/hashicorp/azurerm/4.62.0/docs/data-sources/log_analytics_workspace) | data source |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/4.62.0/docs/data-sources/resource_group) | data source |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/4.62.0/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_id"></a> [acr\_id](#input\_acr\_id) | The ID of the Azure Container Registry to allow ACR Pull from the Service Principal or Managed Identity. | `string` | `null` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The admin username for the Kubernetes cluster. Changing this will recreate the resource. | `string` | `"azureadmin"` | no |
| <a name="input_agents_count"></a> [agents\_count](#input\_agents\_count) | The initial number of nodes in the node pool. The value must be between 1 and 1000, and within the min\_count and max\_count range. | `number` | `1` | no |
| <a name="input_agents_name"></a> [agents\_name](#input\_agents\_name) | The name of the default Kubernetes Node Pool. Changing this will recreate the resource. | `string` | `"nodepool"` | no |
| <a name="input_agents_size"></a> [agents\_size](#input\_agents\_size) | The size of the Virtual Machine instances in the node pool (e.g., 'Standard\_DS2\_v2'). Changing this will recreate the resource. | `string` | `"Standard_B2s"` | no |
| <a name="input_aks_sku_tier"></a> [aks\_sku\_tier](#input\_aks\_sku\_tier) | The SKU tier for the Kubernetes Cluster. Possible values are 'Free' and 'Paid' (includes uptime SLA). Defaults to 'Free'. | `string` | `"Free"` | no |
| <a name="input_aks_version"></a> [aks\_version](#input\_aks\_version) | The version of Kubernetes to use when creating the AKS managed cluster. If not specified, the latest recommended version will be used, but it won't auto-upgrade. | `string` | `"1.30.3"` | no |
| <a name="input_auto_scaler_balance_similar_node_groups"></a> [auto\_scaler\_balance\_similar\_node\_groups](#input\_auto\_scaler\_balance\_similar\_node\_groups) | Balance similar node groups in the auto-scaler profile. | `bool` | `false` | no |
| <a name="input_auto_scaler_max_graceful_termination_sec"></a> [auto\_scaler\_max\_graceful\_termination\_sec](#input\_auto\_scaler\_max\_graceful\_termination\_sec) | Maximum number of seconds for graceful termination in the auto-scaler profile. | `number` | `600` | no |
| <a name="input_auto_scaler_scale_down_delay_after_add"></a> [auto\_scaler\_scale\_down\_delay\_after\_add](#input\_auto\_scaler\_scale\_down\_delay\_after\_add) | Scale-down delay after node addition in the auto-scaler profile. | `string` | `"10m"` | no |
| <a name="input_auto_scaler_scale_down_utilization_threshold"></a> [auto\_scaler\_scale\_down\_utilization\_threshold](#input\_auto\_scaler\_scale\_down\_utilization\_threshold) | Utilization threshold for scaling down in the auto-scaler profile. | `number` | `0.5` | no |
| <a name="input_auto_scaler_scan_interval"></a> [auto\_scaler\_scan\_interval](#input\_auto\_scaler\_scan\_interval) | Scan interval for the auto-scaler profile. | `string` | `"10s"` | no |
| <a name="input_auto_scaler_skip_nodes_with_local_storage"></a> [auto\_scaler\_skip\_nodes\_with\_local\_storage](#input\_auto\_scaler\_skip\_nodes\_with\_local\_storage) | Skip nodes with local storage when scaling down. | `bool` | `false` | no |
| <a name="input_auto_scaling_max_count"></a> [auto\_scaling\_max\_count](#input\_auto\_scaling\_max\_count) | The maximum number of nodes for auto-scaling. | `number` | `3` | no |
| <a name="input_auto_scaling_min_count"></a> [auto\_scaling\_min\_count](#input\_auto\_scaling\_min\_count) | The minimum number of nodes for auto-scaling. | `number` | `1` | no |
| <a name="input_automatic_upgrade_channel"></a> [automatic\_upgrade\_channel](#input\_automatic\_upgrade\_channel) | The upgrade channel for the Kubernetes cluster. Valid options are 'patch', 'rapid', 'node-image', and 'stable'. Omitting this sets the value to 'none'. | `string` | `"none"` | no |
| <a name="input_azure_policy_enabled"></a> [azure\_policy\_enabled](#input\_azure\_policy\_enabled) | Enable Azure Policy for the AKS cluster. | `bool` | `false` | no |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The Client ID associated with the Service Principal. | `string` | `null` | no |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | The Client Secret associated with the Service Principal. | `string` | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the Managed Kubernetes Cluster to create. Changing this will recreate the resource. | `string` | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A mapping of tags to assign to the resources for organization and management purposes. | `map(any)` | `null` | no |
| <a name="input_dns_prefix_name"></a> [dns\_prefix\_name](#input\_dns\_prefix\_name) | DNS prefix specified when creating the managed cluster. Must begin and end with a letter or number, contain only letters, numbers, and hyphens, and be between 1 and 54 characters long. Changing this will recreate the resource. | `string` | `""` | no |
| <a name="input_dns_service_ip"></a> [dns\_service\_ip](#input\_dns\_service\_ip) | The IP address within the Kubernetes service address range for cluster service discovery (kube-dns). Changing this will recreate the resource. | `string` | `"172.16.2.11"` | no |
| <a name="input_enable_attach_acr"></a> [enable\_attach\_acr](#input\_enable\_attach\_acr) | Enable Azure Container Registry (ACR) Pull attach. Requires the 'acr\_id' variable to be defined. | `bool` | `false` | no |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Enable auto-scaling for the default node pool. | `bool` | `false` | no |
| <a name="input_enable_ingress_application_gateway"></a> [enable\_ingress\_application\_gateway](#input\_enable\_ingress\_application\_gateway) | Whether to enable the ingress application gateway for traffic routing to the cluster. | `bool` | `false` | no |
| <a name="input_enable_microsoft_defender"></a> [enable\_microsoft\_defender](#input\_enable\_microsoft\_defender) | Enable Microsoft Defender in the AKS cluster for security scanning and protection. | `bool` | `false` | no |
| <a name="input_enable_oms_agent"></a> [enable\_oms\_agent](#input\_enable\_oms\_agent) | Enable the OMS (Operations Management Suite) agent in the AKS cluster. | `bool` | `false` | no |
| <a name="input_enable_upgrade_settings"></a> [enable\_upgrade\_settings](#input\_enable\_upgrade\_settings) | Enable or disable upgrade settings for the default node pool during an AKS upgrade. | `bool` | `false` | no |
| <a name="input_enable_workload_autoscaler_profile"></a> [enable\_workload\_autoscaler\_profile](#input\_enable\_workload\_autoscaler\_profile) | Specifies whether the workload autoscaler profile block should be enabled in the AKS cluster. | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment used for the backend container name key (e.g., 'dev', 'test', 'prod'). | `string` | `"dev"` | no |
| <a name="input_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#input\_http\_application\_routing\_enabled) | Enable HTTP Application Routing in the AKS cluster. | `bool` | `false` | no |
| <a name="input_image_cleaner_enabled"></a> [image\_cleaner\_enabled](#input\_image\_cleaner\_enabled) | Enable the image cleaner in the AKS cluster. | `bool` | `false` | no |
| <a name="input_image_cleaner_interval_hours"></a> [image\_cleaner\_interval\_hours](#input\_image\_cleaner\_interval\_hours) | The interval in hours for the image cleaner to run in the AKS cluster. | `number` | `24` | no |
| <a name="input_ingress_gateway_id"></a> [ingress\_gateway\_id](#input\_ingress\_gateway\_id) | Optional: The ID of the Application Gateway to integrate with the ingress controller. | `string` | `null` | no |
| <a name="input_ingress_gateway_name"></a> [ingress\_gateway\_name](#input\_ingress\_gateway\_name) | Optional: The name of the Application Gateway to be used or created for ingress traffic. | `string` | `null` | no |
| <a name="input_ingress_gateway_subnet_cidr"></a> [ingress\_gateway\_subnet\_cidr](#input\_ingress\_gateway\_subnet\_cidr) | Optional: The CIDR block for the subnet where the Application Gateway will be deployed. | `string` | `null` | no |
| <a name="input_ingress_gateway_subnet_id"></a> [ingress\_gateway\_subnet\_id](#input\_ingress\_gateway\_subnet\_id) | Optional: The ID of the subnet where the Application Gateway will be deployed. | `string` | `null` | no |
| <a name="input_load_balancer_sku"></a> [load\_balancer\_sku](#input\_load\_balancer\_sku) | The SKU for the Load Balancer used by the Kubernetes Cluster. Supported values are 'Basic' and 'Standard'. Defaults to 'Standard'. | `string` | `"standard"` | no |
| <a name="input_local_account_disabled"></a> [local\_account\_disabled](#input\_local\_account\_disabled) | Disable local accounts in the AKS cluster. | `bool` | `false` | no |
| <a name="input_max_pods"></a> [max\_pods](#input\_max\_pods) | The maximum number of pods that can run on each agent. Changing this will recreate the resource. | `number` | `60` | no |
| <a name="input_msi_auth_for_monitoring_enabled"></a> [msi\_auth\_for\_monitoring\_enabled](#input\_msi\_auth\_for\_monitoring\_enabled) | Enable Managed Service Identity (MSI) authentication for monitoring in the OMS agent. | `bool` | `false` | no |
| <a name="input_name_log_analytics_workspace"></a> [name\_log\_analytics\_workspace](#input\_name\_log\_analytics\_workspace) | The name of the Log Analytics Workspace to be created. | `string` | `null` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | The network plugin to use for networking within the cluster. Supported values are 'azure', 'kubenet', and 'none'. Changing this will recreate the resource. | `string` | `"kubenet"` | no |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | The network policy to use with Azure CNI. Network policies control traffic flow between pods. Supported values are 'calico' and 'azure'. Changing this will recreate the resource. | `string` | `null` | no |
| <a name="input_node_os_upgrade_channel"></a> [node\_os\_upgrade\_channel](#input\_node\_os\_upgrade\_channel) | The upgrade channel for the OS image of Kubernetes cluster nodes. Valid options are 'Unmanaged', 'SecurityPatch', 'NodeImage', and 'None'. Defaults to 'None'. | `string` | `"None"` | no |
| <a name="input_os_disk_size_gb"></a> [os\_disk\_size\_gb](#input\_os\_disk\_size\_gb) | The size (in GB) of the OS disk for each agent in the Node Pool. Changing this will recreate the resource. | `number` | `120` | no |
| <a name="input_outbound_type"></a> [outbound\_type](#input\_outbound\_type) | The outbound (egress) routing method for the Kubernetes Cluster. Supported values are 'loadBalancer', 'userDefinedRouting', 'managedNATGateway', and 'userAssignedNATGateway'. Defaults to 'loadBalancer'. | `string` | `"loadBalancer"` | no |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | Indicates whether the Kubernetes API server should be exposed only on internal IP addresses, providing a private IP for the Kubernetes API within the Virtual Network. Defaults to false. Changing this will recreate the resource. | `bool` | `false` | no |
| <a name="input_public_ssh_key"></a> [public\_ssh\_key](#input\_public\_ssh\_key) | The public SSH key used to access the Kubernetes cluster. Changing this will recreate the resource. | `string` | `null` | no |
| <a name="input_rbac"></a> [rbac](#input\_rbac) | Specifies whether Role-Based Access Control (RBAC) should be enabled for the Kubernetes Cluster. Defaults to true. Changing this will recreate the resource. | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | The region in which the resources will be deployed. | `string` | `"weu"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location or region where the virtual network is created. Changing this will recreate the resource. | `string` | `"West Europe"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the virtual network will be created. | `string` | n/a | yes |
| <a name="input_service_cidr"></a> [service\_cidr](#input\_service\_cidr) | The network range used for Kubernetes services. Changing this will recreate the resource. | `string` | `"172.16.2.0/24"` | no |
| <a name="input_solution_name"></a> [solution\_name](#input\_solution\_name) | The name of the solution to be deployed. Changing this will recreate the resource. | `string` | `"ContainerInsights"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | The name of the subnet where the Kubernetes cluster will be deployed. | `string` | n/a | yes |
| <a name="input_upgrade_settings_drain_timeout_in_minutes"></a> [upgrade\_settings\_drain\_timeout\_in\_minutes](#input\_upgrade\_settings\_drain\_timeout\_in\_minutes) | The number of minutes to wait for eviction of pods and graceful termination per node during an upgrade. | `number` | `null` | no |
| <a name="input_upgrade_settings_max_surge"></a> [upgrade\_settings\_max\_surge](#input\_upgrade\_settings\_max\_surge) | The maximum number or percentage of nodes to be added to the Node Pool size during an upgrade. | `string` | `null` | no |
| <a name="input_upgrade_settings_node_soak_duration_in_minutes"></a> [upgrade\_settings\_node\_soak\_duration\_in\_minutes](#input\_upgrade\_settings\_node\_soak\_duration\_in\_minutes) | The amount of time in minutes to wait after draining a node before re-imaging it and moving on to the next node during an upgrade. | `number` | `null` | no |
| <a name="input_use_service_principal"></a> [use\_service\_principal](#input\_use\_service\_principal) | Set to true to use a service principal for authentication, or false to use a managed identity. | `bool` | `true` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name of the Virtual Network for the Kubernetes cluster. | `string` | n/a | yes |
| <a name="input_vnet_rg_name"></a> [vnet\_rg\_name](#input\_vnet\_rg\_name) | The name of the Resource Group that contains the Virtual Network. | `string` | n/a | yes |
| <a name="input_workload_autoscaler_keda_enabled"></a> [workload\_autoscaler\_keda\_enabled](#input\_workload\_autoscaler\_keda\_enabled) | Specifies whether the KEDA (Kubernetes Event-driven Autoscaling) Autoscaler can be used for workloads in the AKS cluster. | `bool` | `false` | no |
| <a name="input_workload_autoscaler_vpa_enabled"></a> [workload\_autoscaler\_vpa\_enabled](#input\_workload\_autoscaler\_vpa\_enabled) | Specifies whether the Vertical Pod Autoscaler (VPA) should be enabled for automatically adjusting the resources of running pods. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | The base64-encoded public certificate used by clients to authenticate to the Kubernetes cluster. |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | The base64-encoded private key used by clients to authenticate to the Kubernetes cluster. |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | The base64-encoded public Certificate Authority (CA) certificate used as the root of trust for the Kubernetes cluster. |
| <a name="output_cluster_password"></a> [cluster\_password](#output\_cluster\_password) | The password or token used for authentication to the Kubernetes cluster. |
| <a name="output_cluster_username"></a> [cluster\_username](#output\_cluster\_username) | The username used for authentication to the Kubernetes cluster. |
| <a name="output_host"></a> [host](#output\_host) | The host URL of the Kubernetes cluster server. |
| <a name="output_id"></a> [id](#output\_id) | The unique identifier (ID) of the Kubernetes Managed Cluster. |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | The raw kube\_config block for the Kubernetes cluster as defined below. |
