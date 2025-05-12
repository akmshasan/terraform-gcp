# VPC
module "vpc" {
  source = "../../../../modules/vpc"

  vpcs = {
    "learning2-dev-vpc-a" = {
      name = "learning2-dev-vpc-a"
    },
    "learning2-dev-vpc-b" = {
      name = "learning2-dev-vpc-b"
    }
  }
}

# Subnets
module "subnets" {
  source     = "../../../../modules/subnets"
  depends_on = [module.vpc]

  subnets = {
    "learning2-dev-vpc-a-subnet-1" = {
      name    = "learning2-dev-vpc-a-subnet-1"
      cidr    = "10.10.0.0/16"
      region  = var.region
      network = module.vpc.vpc_network["learning2-dev-vpc-a"].self_link
    },
    "learning2-dev-vpc-a-subnet-2" = {
      name    = "learning2-dev-vpc-a-subnet-2"
      cidr    = "10.20.0.0/16"
      region  = var.region
      network = module.vpc.vpc_network["learning2-dev-vpc-a"].self_link
    },
    "learning2-dev-vpc-b-subnet-1" = {
      name    = "learning2-dev-vpc-b-subnet-1"
      cidr    = "10.30.0.0/16"
      region  = var.region
      network = module.vpc.vpc_network["learning2-dev-vpc-b"].self_link
    },
    "learning2-dev-vpc-b-subnet-2" = {
      name    = "learning2-dev-vpc-b-subnet-2"
      cidr    = "10.40.0.0/16"
      region  = var.region
      network = module.vpc.vpc_network["learning2-dev-vpc-b"].self_link
    }
  }
}
