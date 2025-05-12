# VPC
module "vpc-prod" {
  source = "../../modules/vpc"

  vpcs = {
    "prod-vpc-a" = {
      name = "prod-vpc-a"
    },
    "prod-vpc-b" = {
      name = "prod-vpc-b"
    }
  }
}

# Subnets
module "subnets-prod" {
  source     = "../../modules/subnets"
  depends_on = [module.vpc-prod]

  subnets = {
    "prod-vpc-a-subnet-1" = {
      name    = "prod-vpc-a-subnet-1"
      cidr    = "10.110.0.0/16"
      region  = var.region
      network = module.vpc-prod.vpc_network["prod-vpc-a"].self_link
    },
    "prod-vpc-a-subnet-2" = {
      name    = "prod-vpc-a-subnet-2"
      cidr    = "10.120.0.0/16"
      region  = var.region
      network = module.vpc-prod.vpc_network["prod-vpc-a"].self_link
    },
    "prod-vpc-b-subnet-1" = {
      name    = "prod-vpc-b-subnet-1"
      cidr    = "10.130.0.0/16"
      region  = var.region
      network = module.vpc-prod.vpc_network["prod-vpc-b"].self_link
    },
    "prod-vpc-b-subnet-2" = {
      name    = "prod-vpc-b-subnet-2"
      cidr    = "10.140.0.0/16"
      region  = var.region
      network = module.vpc-prod.vpc_network["prod-vpc-b"].self_link
    }
  }
}

# Cloud Router
module "cloudrouter" {
  source     = "../../modules/cloudrouter"
  depends_on = [module.vpc-prod, module.subnets-prod]

  routers = {
    "prod-vpc-a-router" = {
      name    = "prod-vpc-a-router"
      region  = var.region
      network = module.vpc-prod.vpc_network["prod-vpc-a"].self_link
    },
    "prod-vpc-b-router" = {
      name    = "prod-vpc-b-router"
      region  = var.region
      network = module.vpc-prod.vpc_network["prod-vpc-b"].self_link
    }
  }
}

# Cloud NAT
module "nat_ip_vpc_a_1" {
  source     = "../../modules/public_ip"
  depends_on = [module.vpc-prod]

  name   = "prod-nat-ip-vpc-a-1"
  region = var.region
}

module "nat_ip_vpc_a_2" {
  source     = "../../modules/public_ip"
  depends_on = [module.vpc-prod]

  name   = "prod-nat-ip-vpc-a-2"
  region = var.region
}

module "nat_ip_vpc_b" {
  source     = "../../modules/public_ip"
  depends_on = [module.vpc-prod]

  name   = "prod-nat-ip-vpc-b"
  region = var.region
}

module "cloudnat" {
  source     = "../../modules/cloudnat"
  project_id = var.project_id
  depends_on = [module.cloudrouter, module.nat_ip_vpc_a_1, module.nat_ip_vpc_a_2, module.nat_ip_vpc_b]

  nats = {
    "prod-vpc-a-nat-1" = {
      name    = "prod-vpc-a-nat-1"
      region  = var.region
      router  = module.cloudrouter.router_names["prod-vpc-a-router"]
      nat_ips = [module.nat_ip_vpc_a_1.name, module.nat_ip_vpc_a_2.name]
    },
    "prod-vpc-b-nat-1" = {
      name    = "prod-vpc-b-nat-1"
      region  = var.region
      router  = module.cloudrouter.router_names["prod-vpc-b-router"]
      nat_ips = [module.nat_ip_vpc_b.name]
    }
  }
}
