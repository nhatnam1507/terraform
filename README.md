# EC2 Instance Terraform Configuration

This Terraform configuration creates an EC2 instance with the following features:
- SSH access via key pair
- Security group with port 9090 open for inbound traffic
- Configurable for multiple environments
- Secure credential management

## Prerequisites

- Terraform >= 1.0.0
- AWS account and credentials
- SSH key pair created in AWS

## Project Structure

```
.
├── main.tf              # Main Terraform configuration
├── variables.tf         # Input variables
├── versions.tf          # Provider and Terraform versions
├── provider.tf          # AWS provider configuration
└── modules/
    ├── security_group/  # Security group module
    └── ec2/            # EC2 instance module
```

## Usage

1. Create a `terraform.tfvars` file with your configuration:

```hcl
aws_region     = "us-east-1"
aws_access_key = "your-access-key"
aws_secret_key = "your-secret-key"
environment    = "dev"
key_name       = "your-key-pair-name"
vpc_id         = "vpc-xxxxxxxx"
subnet_id      = "subnet-xxxxxxxx"
```

2. Initialize Terraform:
```bash
terraform init
```

3. Review the plan:
```bash
terraform plan
```

4. Apply the configuration:
```bash
terraform apply
```

## Security Considerations

- Never commit sensitive credentials to version control
- Use AWS Secrets Manager or environment variables for credentials
- Consider using AWS Systems Manager Parameter Store for configuration
- Review security group rules and restrict access as needed

## Outputs

The configuration provides the following outputs:
- EC2 instance ID
- Public IP address
- Private IP address
- Security group ID

## Customization

You can customize the following:
- Instance type
- AMI ID
- Tags
- Security group rules
- Environment name

## Cleanup

To destroy the infrastructure:
```bash
terraform destroy
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request 