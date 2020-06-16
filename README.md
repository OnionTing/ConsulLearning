# ConsulLearning
Demo files for HashiCorp Consul use cases

-----
## AKS - Set up and config through terrafrom
In this set up, you will create a 3 node AKS cluster. 

1. ### Log in 
Log in to Azure portal: https://portal.azure.com. Click the 'cloud shell' to open the CLI Window blow. 
You can type '$ terraform' to check the status. 

2.  ### Check your azure account 
You can run '$ az account show' or '$ az account show --query "{subscriptionId:id, tenantId:tenantId}" ' to get your subscription info. 

Run below command to set the var. 
'$ SUBSCRIPTION_ID=" [the number you get from the #az account show]" '

'$ az account set --subscription="${SUBSCRIPTION_ID}" '

3.  ### Create a service principal 
 You need to create an Active Directory service principle account. By running below command line, you should create a Contributer role under the scope of your subscription. 

 '$ az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/${SUBSCRIPTION_ID}" '


You will get the following info, please save them to be used later. 
* "appId": "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa",
* "displayName": "azure-cli-aaaa-aa-aa-aa-aa",
* "name": "http://azure-cli-aaaa-aa-aa-aa-aa",
* "password": "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa",
* "tenant": "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa"

4.  ### glone the repo 
Clone the repo and modify the "variables.tfvars" file.

'$ git clone https://github.com/OnionTing/ConsulLearning.git' 

'cd ConsulLearning/AKS/terraform_basic'

'code variables.tfvars'

Please use the "appId", "password" to fill in the according value in the "variables.tfvars" file.

5.  ### Run the command to set up the cluster

Run below command to initilize the Terraform: 

'$ terraform init'

Run below command to plan 

'$ terraform plan'

Run below command to apply Terraform to set up the cluster. 

'$ terraform apply'

6. ### Enable the K8S dashboard
In order to use K8S dashboard, you need to create a 'ClusterRoleBinding'. Run below command line: 

'$ kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard'

You will get an output - 'clusterrolebinding.rbac.authorization.k8s.io/kubernetes-dashboard created'

Enable the kube-dashboard addon for the resource group "Ting_AKS_Demo", cluster name "Ting_AKS_Demo".

'$ az aks enable-addons --addons kube-dashboard --resource-group Ting_AKS_Demo --name Ting_AKS_Demo'

Press 'Ctrl + C' to exit.

Enter below commande line to view the Kubernetes dashboard, and the Kubernetes dashboard will open in your web browser. 

'$ az aks browse --resource-group Ting_AKS_Demo --name Ting_AKS_Demo'

-----
## AKS/consul

Consul can run directly on Kubernetes, both in server or client mode. In this demo, We are going to use Helm-chart (Helm 3) to run Consul inside Kubernetes. 

1. ### pre-steps
Go to the 'consul' directory of the repo:

'$ cd ~/AKS/consul

2. ### Install Consul with Helm-chart 
Run below command to add the HashiCorp Helm Repository

'$ helm repo add hashicorp https://helm.releases.hashicorp.com'

Ensure you have access to the consul chart: 

'$ helm search repo hashicorp/consul'