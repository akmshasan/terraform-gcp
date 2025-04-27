credentials_file = "../../learning.json"
project_id       = "learning-0165559734"

vpc_config_dev = {
  network_name = "learning-vpc-dev"
  subnets = {
    subnet-01-dev = {
      subnet_name = "subnet-a-dev"
      subnet_cidr = "10.0.0.0/24"
      region      = "asia-southeast1"
    }
    subnet-02-dev = {
      subnet_name = "subnet-b-dev"
      subnet_cidr = "10.0.1.0/24"
      region      = "asia-southeast1"
    }
    subnet-03-dev = {
      subnet_name = "subnet-c-dev"
      subnet_cidr = "10.0.2.0/24"
      region      = "asia-southeast1"
    }
    subnet-04-dev = {
      subnet_name = "subnet-d-dev"
      subnet_cidr = "10.0.4.0/24"
      region      = "asia-southeast1"
    }
  }
}
