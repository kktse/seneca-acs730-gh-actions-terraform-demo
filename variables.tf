variable "development_instance_arguments" {
  description = "Arguments for the development EC2 instance"
  type        = object({ key_name = string, instance_type = string })
  default = {
    key_name      = "development_key"
    instance_type = "t4g.nano"
  }
}
