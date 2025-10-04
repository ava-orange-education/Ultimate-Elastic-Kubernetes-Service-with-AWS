provider "aws" {
  region = "us-west-2"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 19.0"
  cluster_name    = "production-eks"
  cluster_version = "1.28"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  eks_managed_node_groups = {
    general = {
      desired_size = 3
      min_size     = 2
      max_size     = 6

      instance_types = ["m5.large"]
      capacity_type  = "ON_DEMAND"

      labels = {
        Environment = "production"
        GithubRepo = "terraform-aws-eks"
      }

      taints = {
        dedicated = {
          key    = "dedicated"
          value  = "production"
          effect = "NO_SCHEDULE"
        }
      }

      update_config = {
        max_unavailable_percentage = 50
      }
    }
  }

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  manage_aws_auth_configmap = true
  aws_auth_roles = [
    {
      rolearn  = "arn:aws:iam::111122223333:role/Admin"
      username = "*****"
      groups   = ["system:masters"]
    }
  ]
}
