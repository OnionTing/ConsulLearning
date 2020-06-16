# Define a k8s cluster, declares the resources for the k8s cluster. 
resource "azurerm_resource_group" "k8s" {
    # manage a resource group named "k8s"
    name = var.resource_group_name
    location = var.location

    tags = {
        name = "Ting_AkS_Demo"
        Enviroment = "Demo"
    }
}

# The resource "random_id generate random numbers that are intended 
#to be used as unique identities for other resources.
# attribue "dec" -- the generated id presented in non-padded decimal digits.
resource "random_id" "log_analytics_workspace_name_sufffix" {
    byte_length = 8
}



# Manage a AKS cluster
resource "azurerm_kubernetes_cluster" "k8s"{
    name = var.cluster_name
    location = azurerm_resource_group.k8s.location
    resource_group_name = azurerm_resource_group.k8s.name
    dns_prefix = var.dns_prefix

   
    agent_pool_profile {
        name = "default"
        count = 2
        vm_size = "Standard_D2_v2"
        os_type = "Linux"
        os_disk_size_gb = 30
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



    tags = {
        Name = "Ting_AkS_Demo"
        Enviroment ="Demo"
    }

    provisioner "local-exec" {
        # Load credentials to local environment so subsequent kubectl commands can be run
        command = <<EOS
        az aks get-credentials --resource-group ${azurerm_resource_group.k8s.name} --name ${self.name};
    EOS

    }

}