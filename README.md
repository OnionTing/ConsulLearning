# ConsulLearning
Demo files for HashiCorp Consul use cases

-----
## AKS - Set up and config through terrafrom
In this set up, you will create a 3 node AKS cluster. 

1. ###### Log in 
Log in to Azure portal: https://portal.azure.com. Click the 'cloud shell' to open the CLI Window blow. 
You can type '$ terraform' to check the status. 

2. ###### Check your azure account 
You can run '$ az account show' or '$ az account show --query "{subscriptionId:id, tenantId:tenantId}" ' to get your subscription info. 

Run below command to set the var. 
'$ SUBSCRIPTION_ID=" [the number you get from the #az account show]" '

'$ az account set --subscription="${SUBSCRIPTION_ID}" '

3. ###### Create a service principal 
 You need to create an Active Directory service principle account. By running below command line, you should create a Contributer role under the scope of your subscription. 

 '$ az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/${SUBSCRIPTION_ID}" '


You will get the following info, please save them to be used later. 
* "appId": "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa",
* "displayName": "azure-cli-aaaa-aa-aa-aa-aa",
* "name": "http://azure-cli-aaaa-aa-aa-aa-aa",
* "password": "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa",
* "tenant": "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa"

4. ###### glone the repo 
Clone the repo and modify the "variables.tfvars" file.

'git clone https://github.com/xxxxx.git' 

'cd AKS/terraform_basic'

Please use the "appId", "password" to fill in the according value in the "variables.tfvars" file.

5. ###### Run the command to set up the cluster

Run below command to initilize the Terraform: 

'$ terraform init'

Run below command to apply Terraform to set up the cluster. 

'$ terraform apply'
