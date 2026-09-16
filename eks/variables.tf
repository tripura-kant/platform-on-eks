variable "cluster_name" {
  type    = string
  default = "platform-on-eks"
}

variable "kubernetes_version" {
  type    = string
  default = "1.35"   # the number from the command above
}

variable "my_ip" {
  type        = string
  description = "Your public IP in CIDR form, e.g. 1.2.3.4/32"

  validation {
    condition     = can(cidrhost(var.my_ip, 0))
    error_message = "my_ip must be a CIDR like 1.2.3.4/32."
  }
}