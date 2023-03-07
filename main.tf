provider "aws" {
  region = "us-west-2"
}

module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "1.24"
  cluster_name = "my-eks-cluster"
  subnets = ["subnet-0123456789", "subnet-abcdef123456"]
  vpc_id = "vpc-0123456789abcdef"
  tags = {
    Terraform = "true"
    Environment = "dev"
  }
  manage_aws_auth = true
}

output "kubeconfig" {
  value = module.eks.kubeconfig
}

