# VPC
module "vpc" {
  source = "../../../../modules/vpc"

  vpcs = {
    "learning-dev-vpc-a" = {
      name = "learning-dev-vpc-a"
    },
    "learning-dev-vpc-b" = {
      name = "learning-dev-vpc-b"
    }
  }
}

# Subnets
module "subnets" {
  source     = "../../../../modules/subnets"
  depends_on = [module.vpc]

  subnets = {
    "learning-dev-vpc-a-subnet-1" = {
      name    = "learning-dev-vpc-a-subnet-1"
      cidr    = "10.10.0.0/16"
      region  = var.region
      network = module.vpc.vpc_network["learning-dev-vpc-a"].self_link
    },
    "learning-dev-vpc-a-subnet-2" = {
      name    = "learning-dev-vpc-a-subnet-2"
      cidr    = "10.20.0.0/16"
      region  = var.region
      network = module.vpc.vpc_network["learning-dev-vpc-a"].self_link
    },
    "learning-dev-vpc-b-subnet-1" = {
      name    = "learning-dev-vpc-b-subnet-1"
      cidr    = "10.30.0.0/16"
      region  = var.region
      network = module.vpc.vpc_network["learning-dev-vpc-b"].self_link
    },
    "learning-dev-vpc-b-subnet-2" = {
      name    = "learning-dev-vpc-b-subnet-2"
      cidr    = "10.40.0.0/16"
      region  = var.region
      network = module.vpc.vpc_network["learning-dev-vpc-b"].self_link
    }
  }
}

# Cloud Router
module "cloudrouter" {
  source     = "../../../../modules/cloudrouter"
  depends_on = [module.vpc, module.subnets]

  routers = {
    "learning-dev-vpc-a-router" = {
      name    = "learning-dev-vpc-a-router"
      region  = var.region
      network = module.vpc.vpc_network["learning-dev-vpc-a"].self_link
    },
    "learning-dev-vpc-b-router" = {
      name    = "learning-dev-vpc-b-router"
      region  = var.region
      network = module.vpc.vpc_network["learning-dev-vpc-b"].self_link
    }
  }
}

# Cloud NAT
module "nat_ip_vpc_a_1" {
  source     = "../../../../modules/public_ip"
  depends_on = [module.vpc]

  name   = "learning-dev-nat-ip-vpc-a-1"
  region = var.region
}

module "nat_ip_vpc_a_2" {
  source     = "../../../../modules/public_ip"
  depends_on = [module.vpc]

  name   = "learning-dev-nat-ip-vpc-a-2"
  region = var.region
}

module "nat_ip_vpc_b" {
  source     = "../../../../modules/public_ip"
  depends_on = [module.vpc]

  name   = "learning-dev-nat-ip-vpc-b"
  region = var.region
}

module "cloudnat" {
  source     = "../../../../modules/cloudnat"
  project_id = var.project_id
  depends_on = [module.cloudrouter, module.nat_ip_vpc_a_1, module.nat_ip_vpc_a_2, module.nat_ip_vpc_b]

  nats = {
    "learning-dev-vpc-a-nat-1" = {
      name    = "learning-dev-vpc-a-nat-1"
      region  = var.region
      router  = module.cloudrouter.router_names["learning-dev-vpc-a-router"]
      nat_ips = [module.nat_ip_vpc_a_1.name, module.nat_ip_vpc_a_2.name]
    },
    "learning-dev-vpc-b-nat-1" = {
      name    = "learning-dev-vpc-b-nat-1"
      region  = var.region
      router  = module.cloudrouter.router_names["learning-dev-vpc-b-router"]
      nat_ips = [module.nat_ip_vpc_b.name]
    }
  }
}

# VPC Peering
