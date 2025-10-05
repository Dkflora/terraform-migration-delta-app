environment          = "uat"
region              = "us-east-1"
vpc_cidr            = "10.1.0.0/16"
public_subnet_cidrs = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnet_cidrs = ["10.1.10.0/24", "10.1.11.0/24"]
instance_type       = "t3.small"  # Slightly larger than dev
ami_id              = "ami-091d7d61336a4c68f"
key_pair_name       = "your-keypair-nake"    # Use your key pair name name here