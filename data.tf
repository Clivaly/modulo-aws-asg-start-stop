data "aws_autoscaling_groups" "asg_cluster" {
  filter {
    name = var.eks_cluster_name != "" ? "tag:eks:cluster-name" : "tag:ecs:cluster-name"
  }
}

data "aws_autoscaling_group" "asg_config" {
  for_each = toset(data.aws_autoscaling_groups.asg_cluster.names)
  
  name = each.value

  depends_on = [
    data.aws_autoscaling_groups.asg_cluster
  ]
}