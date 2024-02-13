Pre-requisites
- create an was iam group with AdministratorAccess permission and update the group name in env.hcl

#### Step 1
```shell
git clone https://github.com/ThitsaX/eks-iac.git
cd eks-iac
```
edit [Terraform/env.hcl](Terraform/env.hcl)

### Step 2 ( Create Backend State )
```shell
cd Terraform/backend
```
```shell
terraform init
```
```shell

terraform plan --var-file=../env.hcl
```
```shell
terraform apply --var-file=../env.hcl
```
### Step 3 ( Create EKS Cluster)
```shell
cd ../eks-setup
```
```shell
terraform init --backend-config=../backend/backend.hcl
```
```shell
terraform plan --var-file=../env.hcl
```
```shell
terraform apply --var-file=../env.hcl
```
### Setp 4 ( Deploy Addon Services)

```bash
cd ../addons
```
```shell
terraform init --backend-config=../backend/backend.hcl
```
```shell
terraform plan --var-file=../env.hcl
```
```shell
terraform apply --var-file=../env.hcl
```


REF : https://medium.com/devops-mojo/terraform-provision-amazon-eks-cluster-using-terraform-deploy-create-aws-eks-kubernetes-cluster-tf-4134ab22c594


To Run With Gitlab-CI Pipeline

Pre-Request

Please Under values to Gitlab CI's Variables. 
```bash
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_REGION=
BUCKET_NAME=
``````
### Deploy vnext helms

https://github.com/ThitsaX/vnext-charts
