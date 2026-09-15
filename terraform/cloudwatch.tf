resource "aws_cloudwatch_log_group" "task_api" {
  name              = "/task-api/app"
  retention_in_days = 7

  tags = {
    Project = "task-api"
  }
}