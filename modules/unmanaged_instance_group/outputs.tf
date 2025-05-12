output "instance_group_self_links" {
  value = {
    for k, ig in google_compute_instance_group.umig : k => ig.self_link
  }
}
