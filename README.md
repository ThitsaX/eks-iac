#### Step 1
edit [Terraform/env.hcl](Terraform/env.hcl)

### Step 2 ( Create Backend State )
```cd backend```
```terraform init```
```terraform plan --var-file=../env.hcl```
```terraform apply --var-file=../env.hcl```
### Step 3 ( Create EKS Cluster)
```cd eks-setup```
```terraform init --backend-config=../backend/backend.hcl```
```terraform plan --var-file=../env.hcl```
```terraform apply --var-file=../env.hcl```


REF : https://medium.com/devops-mojo/terraform-provision-amazon-eks-cluster-using-terraform-deploy-create-aws-eks-kubernetes-cluster-tf-4134ab22c594]