# VPC
module "vpc" {
  source = "../../modules/vpc"

  vpcs = {
    "dev-vpc-a" = {
      name = "dev-vpc-a"
    },
    "dev-vpc-b" = {
      name = "dev-vpc-b"
    }
  }
}

# Subnets
module "subnets" {
  source     = "../../modules/subnets"
  depends_on = [module.vpc]

  subnets = {
    "dev-vpc-a-subnet-1" = {
      name    = "dev-vpc-a-subnet-1"
      cidr    = "10.10.0.0/16"
      region  = var.region
      network = module.vpc.vpc_network["dev-vpc-a"].self_link
    },
    "dev-vpc-a-subnet-2" = {
      name    = "dev-vpc-a-subnet-2"
      cidr    = "10.20.0.0/16"
      region  = var.region
      network = module.vpc.vpc_network["dev-vpc-a"].self_link
    },
    "dev-vpc-b-subnet-1" = {
      name    = "dev-vpc-b-subnet-1"
      cidr    = "10.30.0.0/16"
      region  = var.region
      network = module.vpc.vpc_network["dev-vpc-b"].self_link
    },
    "dev-vpc-b-subnet-2" = {
      name    = "dev-vpc-b-subnet-2"
      cidr    = "10.40.0.0/16"
      region  = var.region
      network = module.vpc.vpc_network["dev-vpc-b"].self_link
    }
  }
}

# Cloud Router
module "cloudrouter" {
  source     = "../../modules/cloudrouter"
  depends_on = [module.vpc, module.subnets]

  routers = {
    "dev-vpc-a-router" = {
      name    = "dev-vpc-a-router"
      region  = var.region
      network = module.vpc.vpc_network["dev-vpc-a"].self_link
    },
    "dev-vpc-b-router" = {
      name    = "dev-vpc-b-router"
      region  = var.region
      network = module.vpc.vpc_network["dev-vpc-b"].self_link
    }
  }
}

# Cloud NAT
module "nat_ip_vpc_a" {
  source     = "../../modules/public_ip"
  depends_on = [module.vpc]

  name   = "dev-nat-ip-vpc-a"
  region = var.region
}

module "nat_ip_vpc_b" {
  source     = "../../modules/public_ip"
  depends_on = [module.vpc]

  name   = "dev-nat-ip-vpc-b"
  region = var.region
}

module "cloudnat" {
  source     = "../../modules/cloudnat"
  project_id = var.project_id
  depends_on = [module.cloudrouter, module.nat_ip_vpc_a, module.nat_ip_vpc_b]

  nats = {
    "dev-vpc-a-nat-1" = {
      name    = "dev-vpc-a-nat-1"
      region  = var.region
      router  = module.cloudrouter.router_names["dev-vpc-a-router"]
      nat_ips = [module.nat_ip_vpc_a.name]
    },
    "dev-vpc-b-nat-1" = {
      name    = "dev-vpc-b-nat-1"
      region  = var.region
      router  = module.cloudrouter.router_names["dev-vpc-b-router"]
      nat_ips = [module.nat_ip_vpc_b.name]
    }
  }
}
