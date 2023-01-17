# Prerequisite

- [Terraform](https://www.terraform.io/downloads) (>= 0.14)
- [Outscale Access Key and Secret Key](https://wiki.outscale.net/display/EN/Creating+an+Access+Key)

# Configuration

```
export TF_VAR_access_key_id="myaccesskey"
export TF_VAR_secret_key_id="mysecretkey"
export TF_VAR_region="eu-west-2"
```


By copying and editing ['terraform.tfvars.example'](../terraform/terraform.tfvars.example) to 'terraform.tfvars' , you can adjust the admin password of the server, the Vm type and the name of of the cluster.

# Deploying infrastructure

This step will create infrastructure components as well as configuration files needed to bootstrap cluster creation.

```
terraform init
terraform apply
```

## Output 
At the end, you will get this output:
```
control-plane-sg = "sg-xxxxx" # The id of the controlplane security group (allow controlplanes to communicates between each other) 
worker-sg = "sg-xxxxx" # The id of the worker security group (allow workers to communicates between each other) 
node-sg = "sg-xxxxx" # The id of the main SG of the cluster 
node_subnet = "subnet-xxxx" # The subnet for the cluster nodes
rancher_node_ip = "XX.XX.XX.XX" # The IP of the server
rancher_server_url = "https://rancher.XX.XX.XX.XX.sslip.io" # The URL to access the rancher server
```

# Deploying your first Kubernetes cluster wih rke2
After deploying the rancher server:
- go to the website and accept the risk which is a carning from the web browser stating that the certificate is self-sign
- enter the credentials admin then the password that you have setted in `terraform.tfvars`
- click on `Create`
- On top of the page, you will have a cluster template, click on it for creating your first rke2 cluster

You will need to put your AK/SK and the output of terraform. Watch out that for security group, you will need to put them directly in the YAML file. Finally, your first cluster must have the same name than the the name you put in the `terraform.tfvars`.

# Deploying additional clusters
Before performing the previous steps, you need to:
- Create a new security groups
- Add some tags for the CCM to work well:
   - `OscK8sClusterID/<cluster_name>=owned` on the Subnet, Node Security Group and the public Route Table
   - `OscK8sMainSG/<cluster_name>=True` on the Node Security Group

# Destroying
Make sure that there no cluster in the subnet and execute 
```
terraform destroy
```

Note that it might fails on cert_manager, just execute it again.