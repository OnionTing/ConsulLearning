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

# Manages a Log Analytics Workspace.
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

