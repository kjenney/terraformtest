module "rds_aurora" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "~> 10.0"

  name            = "${local.name}-aurora"
  engine          = "aurora-mysql"
  engine_version  = var.db_engine_version
  instance_class  = var.db_instance_class
  master_username = var.db_master_username
  instances       = { 1 = {}, 2 = {} }

  vpc_id               = module.vpc.vpc_id
  db_subnet_group_name = module.vpc.database_subnet_group_name
  subnets              = module.vpc.private_subnets

  security_group_rules = {
    ingress_from_vpc = {
      cidr_blocks = [module.vpc.vpc_cidr_block]
    }
  }

  storage_encrypted   = true
  apply_immediately   = true
  skip_final_snapshot = true

  tags = local.tags
}
