resource "google_compute_address" "dev_app_ip" {
  name         = "dev-app-1-ip"
  region       = "asia-southeast1"
  address_type = "INTERNAL"
  subnetwork   = module.subnets.subnet_ids["dev-vpc-a-subnet-1"]
}

module "vm_instances" {
  source     = "../../modules/vm_instance"
  depends_on = [module.vpc, module.subnets]

  instances = {
    "dev-app-1" = {
      name         = "dev-app-1"
      zone         = "asia-southeast1-b"
      machine_type = "e2-small"
      tags         = ["web", "dev"]
      metadata     = {}
      network      = module.vpc.vpc_networks["dev-vpc-a"].self_link
      subnetwork   = module.subnets.subnet_ids["dev-vpc-a-subnet-1"]
      internal_ip  = google_compute_address.dev_app_ip.address

      service_account = module.service_accounts.service_account_emails["dev-app-sa"]
      scopes          = ["https://www.googleapis.com/auth/cloud-platform"]

      labels = {
        env     = "dev"
        service = "app"
      }

      enable_secure_boot          = true
      enable_vtpm                 = true
      enable_integrity_monitoring = true
    }
  }
}
