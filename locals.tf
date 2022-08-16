locals {
  node_groups = {
    for name, definition in var.node_groups :
       name => {
        desired_capacity = definition["desired_capacity"]
        max_capacity = definition["max_capacity"]
        min_capacity = definition["min_capacity"]
       } 
  }
}