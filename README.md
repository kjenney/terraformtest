# terraformtest

Testing Renovatebot with EOL EKS and RDS clusters

## Architecture

This Terraform configuration provisions:

- **VPC** with public, private, and intra subnets across 3 availability zones
- **EKS Cluster** (Kubernetes 1.31) with a managed node group
- **RDS Aurora PostgreSQL** cluster with 2 instances and encrypted storage

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.3
- AWS credentials configured (via environment variables, AWS CLI profile, or IAM role)
- Sufficient IAM permissions to create VPC, EKS, and RDS resources

## Usage

### Initialize

```bash
terraform init
```

### Configure variables

Copy and edit the example variables file or pass variables directly:

```bash
terraform plan \
  -var="region=us-east-1" \
  -var="environment=dev" \
  -var="cluster_name=my-eks-cluster" \
  -var="cluster_version=1.31"
```

Available variables:

| Variable | Description | Default |
|---|---|---|
| `region` | AWS region | `us-east-1` |
| `environment` | Environment name | `dev` |
| `cluster_name` | Name of the EKS cluster | `my-eks-cluster` |
| `cluster_version` | Kubernetes version | `1.31` |
| `vpc_cidr` | CIDR block for VPC | `10.0.0.0/16` |
| `db_engine_version` | Aurora PostgreSQL engine version | `16.6` |
| `db_instance_class` | RDS instance class | `db.r6g.large` |
| `db_master_username` | RDS master username | `dbadmin` |

### Plan

Review the resources that will be created:

```bash
terraform plan
```

### Apply

Provision the infrastructure:

```bash
terraform apply
```

### Outputs

After applying, Terraform outputs:

- `eks_cluster_endpoint` - EKS API server endpoint
- `eks_cluster_name` - EKS cluster name
- `rds_cluster_endpoint` - RDS Aurora writer endpoint
- `rds_cluster_reader_endpoint` - RDS Aurora reader endpoint
- `vpc_id` - VPC ID

### Destroy

Tear down all resources:

```bash
terraform destroy
```

## Linting

Install [TFLint](https://github.com/terraform-linters/tflint) and run:

```bash
tflint --init
tflint
```

## CI/CD

GitHub Actions workflows run automatically on push and pull requests to `main`:

- **Terraform Validate** - Initializes and validates the configuration
- **TFLint** - Lints the configuration with the AWS ruleset
