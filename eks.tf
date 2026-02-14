module "eks" {
  source              = "terraform-aws-modules/eks/aws"
  version             = "~> 20.0"
  name                = local.name
  kubernetes_version  = var.eks_cluster_version

  vpc_id              = module.vpc.vpc_id
  subnet_ids          = module.vpc.private_subnets

  eks_managed_node_groups = {
    default = {
      instance_types = ["m5.large"]
      min_size       = 1
      max_size       = 3
      desired_size   = 2
    }
  }

  tags = local.tags
}
