<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.100.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.100.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.100.0/docs/resources/kubernetes_cluster) | resource |
| [azurerm_role_assignment.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.100.0/docs/resources/role_assignment) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.100.0/docs/data-sources/resource_group) | data source |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.100.0/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_id"></a> [acr\_id](#input\_acr\_id) | Specifies the ACR ID to allow pull access from the Azure Container Registry using the Service Principal or Managed Identity. | `string` | `null` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The administrator username for the cluster. Changing this will result in the creation of a new cluster. | `string` | `"azureadmin"` | no |
| <a name="input_agents_count"></a> [agents\_count](#input\_agents\_count) | The initial number of nodes to be included in the node pool. This value must be between 1 and 1000, and within the specified min\_count and max\_count. | `number` | `1` | no |
| <a name="input_agents_name"></a> [agents\_name](#input\_agents\_name) | Specifies the name for the default Kubernetes Node Pool. Changing this will result in the creation of a new node pool. | `string` | `"nodepool"` | no |
| <a name="input_agents_size"></a> [agents\_size](#input\_agents\_size) | Specifies the size of the virtual machine for the agent nodes, such as Standard\_DS2\_v2. Changing this will result in the creation of new agent nodes. | `string` | `"Standard_B2s"` | no |
| <a name="input_aks_sku_tier"></a> [aks\_sku\_tier](#input\_aks\_sku\_tier) | Specifies the SKU Tier for the Kubernetes Cluster. Possible values are Free and Paid (which includes the Uptime SLA), with a default of Free. | `string` | `"Free"` | no |
| <a name="input_aks_version"></a> [aks\_version](#input\_aks\_version) | Specifies the version of Kubernetes to be used when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time, but it will not auto-upgrade. | `string` | `"1.22.7"` | no |
| <a name="input_auto_scaler_balance_similar_node_groups"></a> [auto\_scaler\_balance\_similar\_node\_groups](#input\_auto\_scaler\_balance\_similar\_node\_groups) | Enables balancing of similar node groups within the auto-scaler profile. | `bool` | `false` | no |
| <a name="input_auto_scaler_max_graceful_termination_sec"></a> [auto\_scaler\_max\_graceful\_termination\_sec](#input\_auto\_scaler\_max\_graceful\_termination\_sec) | Specifies the maximum duration for graceful termination of nodes within the auto-scaler profile, measured in seconds. | `number` | `600` | no |
| <a name="input_auto_scaler_scale_down_delay_after_add"></a> [auto\_scaler\_scale\_down\_delay\_after\_add](#input\_auto\_scaler\_scale\_down\_delay\_after\_add) | Defines the delay before scaling down after adding nodes in the auto-scaler profile, specified in duration (e.g., 10m for 10 minutes). | `string` | `"10m"` | no |
| <a name="input_auto_scaler_scale_down_utilization_threshold"></a> [auto\_scaler\_scale\_down\_utilization\_threshold](#input\_auto\_scaler\_scale\_down\_utilization\_threshold) | Sets the utilization threshold for scaling down nodes within the auto-scaler profile. If the average utilization of a node pool falls below this threshold, scaling down may occur. | `number` | `0.5` | no |
| <a name="input_auto_scaler_scan_interval"></a> [auto\_scaler\_scan\_interval](#input\_auto\_scaler\_scan\_interval) | Indicates the interval at which the auto-scaler scans the node pools, specified in duration (e.g., 10s for 10 seconds). | `string` | `"10s"` | no |
| <a name="input_auto_scaling_max_count"></a> [auto\_scaling\_max\_count](#input\_auto\_scaling\_max\_count) | Specifies the maximum number of nodes for auto-scaling in the Kubernetes cluster. | `number` | `3` | no |
| <a name="input_auto_scaling_min_count"></a> [auto\_scaling\_min\_count](#input\_auto\_scaling\_min\_count) | Specifies the minimum number of nodes for auto-scaling in the Kubernetes cluster. | `number` | `1` | no |
| <a name="input_azure_policy_enabled"></a> [azure\_policy\_enabled](#input\_azure\_policy\_enabled) | Enables Azure Policy for the AKS cluster. | `bool` | `false` | no |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The Client ID associated with the Service Principal. This is required when using a service principal for authentication. | `string` | `null` | no |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | The Client Secret associated with the Service Principal. This is required when using a service principal for authentication. | `string` | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Specifies the name of the Managed Kubernetes Cluster to create. Changing this will result in the creation of a new cluster. | `string` | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A map of default tags to apply to all resources for organization and tracking. | `map(any)` | `null` | no |
| <a name="input_dns_prefix_name"></a> [dns\_prefix\_name](#input\_dns\_prefix\_name) | Specifies the DNS prefix when creating the managed cluster. Must start and end with a letter or number, contain only letters, numbers, and hyphens, and be between 1 and 54 characters in length. Changing this will result in the creation of a new resource. | `string` | `""` | no |
| <a name="input_dns_service_ip"></a> [dns\_service\_ip](#input\_dns\_service\_ip) | The IP address within the Kubernetes service address range designated for service discovery (kube-dns). Changing this will result in the creation of a new cluster. | `string` | `"172.16.2.11"` | no |
| <a name="input_enable_attach_acr"></a> [enable\_attach\_acr](#input\_enable\_attach\_acr) | Enables ACR (Azure Container Registry) Pull attach. Requires acr\_id to be defined. | `bool` | `false` | no |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Enables auto-scaling for the default node pool of the Kubernetes cluster. | `bool` | `false` | no |
| <a name="input_enable_microsoft_defender"></a> [enable\_microsoft\_defender](#input\_enable\_microsoft\_defender) | Enables Microsoft Defender within the AKS cluster for enhanced security and threat protection. | `bool` | `false` | no |
| <a name="input_enable_oms_agent"></a> [enable\_oms\_agent](#input\_enable\_oms\_agent) | Enables the OMS (Operations Management Suite) agent within the AKS cluster for monitoring and management. | `bool` | `false` | no |
| <a name="input_enable_pod_security_policy"></a> [enable\_pod\_security\_policy](#input\_enable\_pod\_security\_policy) | Enables Pod Security Policy for the AKS cluster. | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Defines the environment for the backend container (e.g., dev, stage, prod). | `string` | `"dev"` | no |
| <a name="input_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#input\_http\_application\_routing\_enabled) | Enables HTTP Application Routing for the AKS cluster. | `bool` | `false` | no |
| <a name="input_image_cleaner_enabled"></a> [image\_cleaner\_enabled](#input\_image\_cleaner\_enabled) | Enables the image cleaner feature within the AKS cluster to help manage and clean up unused images. | `bool` | `false` | no |
| <a name="input_image_cleaner_interval_hours"></a> [image\_cleaner\_interval\_hours](#input\_image\_cleaner\_interval\_hours) | Defines the interval, in hours, for the image cleaner to run within the AKS cluster. | `number` | `24` | no |
| <a name="input_load_balancer_sku"></a> [load\_balancer\_sku](#input\_load\_balancer\_sku) | Specifies the SKU of the Load Balancer for the Kubernetes Cluster. Possible values are Basic and Standard, with a default of Standard. | `string` | `"standard"` | no |
| <a name="input_local_account_disabled"></a> [local\_account\_disabled](#input\_local\_account\_disabled) | Disables local accounts within the AKS cluster. | `bool` | `false` | no |
| <a name="input_max_pods"></a> [max\_pods](#input\_max\_pods) | Indicates the maximum number of pods that can run on each agent. Changing this will result in the creation of new agent nodes. | `number` | `60` | no |
| <a name="input_name_log_analytics_workspace"></a> [name\_log\_analytics\_workspace](#input\_name\_log\_analytics\_workspace) | Specifies the name of the Log Analytics Workspace to be created or used. | `string` | `null` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | Specifies the network plugin to be used for networking within the cluster. Supported values include azure, kubenet, and none. Changing this will result in the creation of a new cluster. | `string` | `"kubenet"` | no |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | Defines the network policy to be used with Azure CNI. Network policies control traffic flow between pods. Supported values include calico and azure. Changing this will result in the creation of a new cluster. | `string` | `null` | no |
| <a name="input_os_disk_size_gb"></a> [os\_disk\_size\_gb](#input\_os\_disk\_size\_gb) | Specifies the size of the OS disk for each agent in the node pool, measured in gigabytes. Changing this will result in the creation of new agent nodes. | `number` | `120` | no |
| <a name="input_outbound_type"></a> [outbound\_type](#input\_outbound\_type) | Defines the outbound (egress) routing method for the Kubernetes Cluster. Possible values include loadBalancer, userDefinedRouting, managedNATGateway, and userAssignedNATGateway, with a default of loadBalancer. | `string` | `"loadBalancer"` | no |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | Determines whether the Kubernetes cluster's API server should be accessible only via internal IP addresses. This setting provides a private IP address for the Kubernetes API within the virtual network. Defaults to false. Changing this will result in the creation of a new cluster. | `bool` | `false` | no |
| <a name="input_public_ssh_key"></a> [public\_ssh\_key](#input\_public\_ssh\_key) | The public SSH key used for accessing the cluster. Changing this will result in the creation of new access configurations. | `string` | `null` | no |
| <a name="input_rbac"></a> [rbac](#input\_rbac) | Indicates whether Role-Based Access Control (RBAC) should be enabled for the Kubernetes cluster. Defaults to true. Changing this will result in the creation of a new cluster. | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | Specifies the region where the resources will be deployed (e.g., weu, us-east). | `string` | `"weu"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Specifies the Azure region where the resource group will be created. Changing this will recreate the resource group. | `string` | `"West Europe"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group to be created in Azure. | `string` | n/a | yes |
| <a name="input_service_cidr"></a> [service\_cidr](#input\_service\_cidr) | Specifies the network range for Kubernetes services. Changing this will result in the creation of a new cluster. | `string` | `"172.16.2.0/24"` | no |
| <a name="input_solution_name"></a> [solution\_name](#input\_solution\_name) | Specifies the name of the solution to be deployed. Changing this will result in the creation of new configurations. | `string` | `"ContainerInsights"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | The name of the subnet to be used for the Kubernetes cluster. | `string` | n/a | yes |
| <a name="input_use_service_principal"></a> [use\_service\_principal](#input\_use\_service\_principal) | Indicates whether to use a service principal (true) or a managed identity (false) for authentication. | `bool` | `true` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name of the Virtual Network to be associated with the Kubernetes cluster. | `string` | n/a | yes |
| <a name="input_vnet_rg_name"></a> [vnet\_rg\_name](#input\_vnet\_rg\_name) | Specifies the Resource Group in which the Virtual Network will reside. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster. |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | Base64 encoded private key used by clients to authenticate to the Kubernetes cluster. |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster. |
| <a name="output_cluster_password"></a> [cluster\_password](#output\_cluster\_password) | A password or token used to authenticate to the Kubernetes cluster. |
| <a name="output_cluster_username"></a> [cluster\_username](#output\_cluster\_username) | A username used to authenticate to the Kubernetes cluster. |
| <a name="output_host"></a> [host](#output\_host) | The Kubernetes cluster server host. |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | A kube\_config block as defined below. |
<!-- END_TF_DOCS -->