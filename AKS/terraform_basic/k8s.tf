# Define a k8s cluster, declares the resources for the k8s cluster. 
resource "azurerm_resource_group" "k8s" {
    # manage a resource group named "k8s"
    name = var.resource_group_name
    location = var.location
}

# The resource "random_id generate random numbers that are intended 
#to be used as unique identities for other resources.
# attribue "dec" -- the generated id presented in non-padded decimal digits.
resource "random_id" "log_analytics_workspace_name_sufffix" {
    byte_length = 8
}

# Manages a Log Analytics Workspace to enable monitoring perf of workloads that deployed to K8S.
resource "azurerm_log_analytics_workspace" "test" {
    # The workspace name has to be unique across the whole of Azure.
    name = "${var.log_analytics_workspace_name}-${random_id.log_analytics_workspace_name_sufffix.dec}"
    location = var.log_analytics_workspace_location
    resource_group_name = azurerm_resource_group.k8s.name
    # workspace_resource_id = azurerm_log_analytics_workspace.test.id
    # workspace_name = azurerm_log_analytics_workspace.test.name

    # plan {
        # publisher = "Microsoft"
        # product = "OMSGallery/ContainerInsights"
    # }
}

# Manage a AKS cluster
resource "azurerm_kubernetes_cluster" "k8s"{
    name = var.cluster_name
    location = azurerm_resource_group.k8s.location
    resource_group_name = azurerm_resource_group.k8s.name
    dns_prefix = var.dns_prefix

    #linux_profile {
            #admin_username = "ubuntu"

            #ssh_key {
                #key_data = file(var.ssh_public_key)
            #}
    #}

    default_node_pool {
        name = "agentpool"
        node_count = var.agent_count
        vm_size = var.agent_size
    }

    # One of either identity or service_principal must be specified.
    # To access resources that are secured by an Azure AD tenant, the entity that requires access must be represented by a security principal. 
    service_principal {
        client_id = var.client_id
        client_secret = var.client_secret
    }

    role_based_access_control {
    enabled = true
  }

    # Enable the monitoring add-on profile.
    addon_profile {
        oms_agent {
            enabled = true
            log_analytics_workspace_id = azurerm_log_analytics_workspace.test.id
        }
    }

    tags = {
        Name = "Ting_AkS_Demo"
        Enviroment ="Demo"
    }


}