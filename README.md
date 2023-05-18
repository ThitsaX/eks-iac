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