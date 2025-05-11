resource "google_compute_instance" "vm" {
  allow_stopping_for_update = true
  for_each                  = var.instances

  name         = each.value.name
  machine_type = each.value.machine_type
  zone         = each.value.zone

  tags     = each.value.tags
  metadata = each.value.metadata

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network    = each.value.network
    subnetwork = each.value.subnetwork
    network_ip = each.value.internal_ip
  }

  service_account {
    email  = each.value.service_account
    scopes = each.value.scopes
  }

  scheduling {
    preemptible         = false
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  shielded_instance_config {
    enable_secure_boot          = lookup(each.value, "enable_secure_boot", true)
    enable_vtpm                 = lookup(each.value, "enable_vtpm", true)
    enable_integrity_monitoring = lookup(each.value, "enable_integrity_monitoring", true)
  }

  labels = each.value.labels
}
