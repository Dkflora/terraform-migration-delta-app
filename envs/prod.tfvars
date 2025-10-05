environment          = "prod"
region              = "us-east-1"
vpc_cidr            = "10.2.0.0/16"
public_subnet_cidrs = ["10.2.1.0/24", "10.2.2.0/24"]
private_subnet_cidrs = ["10.2.10.0/24", "10.2.11.0/24"]
instance_type       = "t3.medium"  # Larger for prod load
ami_id              = "ami-091d7d61336a4c68f"
key_pair_name       = "your-keypair-name"  # Use your actual key pair name here