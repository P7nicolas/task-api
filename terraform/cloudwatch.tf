resource "aws_cloudwatch_log_group" "task_api" {
  name              = "/task-api/app"
  retention_in_days = 7

  tags = {
    Project = "task-api"
  }
}

resource "aws_cloudwatch_metric_alarm" "task_api_cpu" {
  alarm_name        = "task-api-high-cpu"
  alarm_description = "Alarme quando a utilizacao de CPU da EC2 ultrapassar 70%"

  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 70

  dimensions = {
    InstanceId = aws_instance.task_api.id
  }

  treat_missing_data = "notBreaching"

  tags = {
    Project = "task-api"
  }
}