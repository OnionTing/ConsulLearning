# Define the var

# fill in with the appId
variable "client_id" {
    default = ""
}

#fill in with the password
variable "client_secret" {
    default = ""
}

variable "agent_count" {
    default = 3
}

variable "agent_size" {
    default = "Standard_DS1_v2"
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
    default = "k8stest"
}

variable cluster_name {
    default = "Ting_k8sDemo"
}

variable resource_group_name {
    default = "Ting_azure-k8stest"
}

variable location {
    default = "West US 2"
}

variable log_analytics_workspace_name {
    default = "testLogAnalyticsWorkspaceName"
}

# refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
variable log_analytics_workspace_location {
    default = "eastus"
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable log_analytics_workspace_sku {
    default = "PerGB2018"
}