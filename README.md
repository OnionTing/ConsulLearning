# ConsulLearning
Demo files for HashiCorp Consul use cases

-----
## AKS - Set up and config through terrafrom
In this set up, you will create a 3 node AKS cluster. 

After installing the Azure CLI and logging in, you need to create an Active Directory service principle account. 
$ az ad sp create-for-rbac --skip-assignment 

If you already had an account that you would like to use to create the cluster, please ignore above step. 

You will get the following info: 
"appId": "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa",
"displayName": "aaaaa",
"name": "aaaa",
"password": "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa",
"tenant": "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa"

Please use the appId, password to fill in the according value in the "variables.tfvars" file.

Then run below command to initilize the Terraform: 
$terraform init

Run below command to apply Terraform to set up the cluster. 
$terraform apply
