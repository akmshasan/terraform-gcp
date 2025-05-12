variable "name" {
  description = "Name of the peering connection"
  type        = string
}

variable "network_self_link" {
  description = "Self link of the network initiating the peering"
  type        = string
}

variable "peer_network_self_link" {
  description = "Self link of the peer network"
  type        = string
}

variable "peer_project_id" {
  description = "Project ID of the peer network"
  type        = string
}
