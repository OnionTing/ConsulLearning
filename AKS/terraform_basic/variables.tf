# Define the var

# fill in with the appId
variable "client_id" {
    default = ""
}

#fill in with the password
variable "client_secret" {
    default = ""
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
    default = "Ting_AKS_Demo"
}

variable "cluster_name" {
    default = "Ting_AKS_Demo"
}

variable "resource_group_name" {
    default = "Ting_AKS_Demo"
}

variable "location" {
    default = "West US 2"
}

