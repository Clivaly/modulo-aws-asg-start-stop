data "aws_autoscaling_groups" "asg_eks_cluster" {
  count = var.eks_cluster_name != "" ? 1 : 0
  filter {
    name = "tag:eks:cluster_name" 
    values = [var.eks_cluster_name]
  }
}

data "aws_autoscaling_group" "asg_eks_config" {
  for_each = var.eks_cluster_name != "" ? toset(data.aws_autoscaling_groups.asg_eks_cluster[0].names) : toset([])
  name = each.key
  depends_on = [
    data.aws_autoscaling_groups.asg_eks_cluster
  ]
}

data "aws_autoscaling_groups" "asg_ecs_cluster" {
    count = var.ecs_cluster_name != "" ? 1 : 0
    names = [var.ecs_cluster_name]  
}

data "aws_autoscaling_group" "asg_ecs_config" {
  for_each = var.ecs_cluster_name != "" ? toset(data.aws_autoscaling_groups.asg_ecs_cluster[0].names) : toset([])
  name = each.key
  depends_on = [
    data.aws_autoscaling_groups.asg_ecs_cluster
  ]
}