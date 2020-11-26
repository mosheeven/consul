variable "region" {
  description = "AWS region for VMs"
  default = "us-east-1"
}

variable "key_name" {
  description = "name of ssh key to attach to hosts"
  default = "moshe-us-east-1-private"
}

variable "ami" {
  description = "ami (ubuntu 18) to use - based on region"
  default = {
    "us-east-1" = "ami-00ddb0e5626798373"
    "us-east-2" = "ami-0dd9f0e7df0f0a138"
  }
}

variable "server_count" {
  default = 3
}

variable "agent_count" {
  default = 1
}
