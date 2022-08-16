variable "env" {
  type = string
  description = "environment"
}

variable "eks_cluster_name" {
  type = string
}

variable "ecs_cluster_name" {
  type = string
}

variable "start_schedule" {
  type = string
}

variable "stop_schedule" {
  type = string
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "desired_capacity" {
  type = number
}

variable "node_groups" {
  description = "Info about nodegroups"
  type = map(any)
  default = {}
}