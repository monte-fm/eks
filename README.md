# Before you start

1) You need to have admin access to AWS account with required services:
- EKS
- IAM
- EC2
- VPC 
- S3

2) You need to have terraform v0.12.24+

3) AWS CLI version: aws-cli/1.18.39+

# Create s3 bucket for terraform state

Change your `bucket_name` if it exists in `terraform apply` command

Create buket:

```bash
cd aws_s3_bucket
terraform init
terraform apply -var 'bucket_name=terraform-aws-configuration' --auto-approve
```

# Create AWS Infrastructure and EKS

Change your bucket_name to value as provided in `Create s3 bucket` step

1) Init terraform on first run:

```bash
cd terraform
terraform init -backend-config='bucket=terraform-aws-configuration' -backend-config=region='eu-west-1'
```

2) Set your public IP in variable during next command run like "10.10.10.10/32":

```bash
terraform apply --auto-approve
```

# Deploy Nginx

1) Login to EKS

```bash
aws eks --region eu-west-1 update-kubeconfig --name eks_cluster
```

2) Deploy Nginx

```bash
cd nginx
terraform init
terraform apply --auto-approve
```

# Go to nginx webpage

1) You need to get address of your load balancer `lb_hostname`:

```bash
cd nginx
terraform output
```

2) Open your browser and type:

http://{{ lb_hostname }}
