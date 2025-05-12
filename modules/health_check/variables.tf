variable "health_checks" {
  type = map(object({
    name                = string
    check_interval_sec  = number
    timeout_sec         = number
    healthy_threshold   = number
    unhealthy_threshold = number
    http_port           = number
    request_path        = string
  }))
}
