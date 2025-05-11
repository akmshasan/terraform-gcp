output "vpc_network" {
  description = "Map of VPC network resources"
  value = {
    for k, v in google_compute_network.vpc_network :
    k => {
      name      = v.name
      self_link = v.self_link
    }
  }
}
