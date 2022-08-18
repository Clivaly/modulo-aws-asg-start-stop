# For EKS
resource "aws_autoscaling_schedule" "eks_scale_down" {
    for_each = var.env != "prod" && var.eks_cluster_name != "" ? data.aws_autoscaling_group.asg_eks_config : {}
    scheduled_action_name = "Instances Terminate"
    min_size = 0
    max_size = 0
    desired_capacity = 0
    time_zone = "America/Sao_Paulo"
    recurrence = var.stop_schedule
    autoscaling_group_name = each.key
}

# For EKS
resource "aws_autoscaling_schedule" "eks_scale_up" {
    for_each = var.env != "prod" && var.eks_cluster_name != "" ? data.aws_autoscaling_group.asg_eks_config : {}
    scheduled_action_name = "Instances Startup"
    min_size = each.value.min_size != 0 ? each.value.min_size : var.min_size
    max_size = each.value.max_size != 0 ? each.value.max_size : var.max_size
    desired_capacity = each.value.desired_capacity != 0 ? each.value.desired_capacity : var.desired_capacity
    time_zone = "America/Sao_Paulo"
    recurrence = var.start_schedule
    autoscaling_group_name = each.key
}

# For ECS
resource "aws_autoscaling_schedule" "ecs_scale_down" {
    for_each = var.env != "prod" && var.ecs_cluster_name != "" ? data.aws_autoscaling_group.asg_ecs_config : {}
    scheduled_action_name = "Instances Terminate"
    min_size = 0
    max_size = 0
    desired_capacity = 0
    time_zone = "America/Sao_Paulo"
    recurrence = var.stop_schedule
    autoscaling_group_name = each.key
}

# For ECS
resource "aws_autoscaling_schedule" "ecs_scale_up" {
    for_each = var.env != "prod" && var.ecs_cluster_name != "" ? data.aws_autoscaling_group.asg_ecs_config : {}
    scheduled_action_name = "Instances Startup"
    min_size = each.value.min_size != 0 ? each.value.min_size : var.min_size
    max_size = each.value.max_size != 0 ? each.value.max_size : var.max_size
    desired_capacity = each.value.desired_capacity != 0 ? each.value.desired_capacity : var.desired_capacity
    time_zone = "America/Sao_Paulo"
    recurrence = var.start_schedule
    autoscaling_group_name = each.key
}