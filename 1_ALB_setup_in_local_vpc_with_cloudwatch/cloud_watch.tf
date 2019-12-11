resource "aws_cloudwatch_metric_alarm" "alb_request_monitor" {
  alarm_name                = "ALB_Request_Monitor"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  statistic                 = "Sum"
  threshold                 = "300"
  unit                      = "Count"
  alarm_description         = "Number of Requests has exceeded 100 in 60 secs"
  insufficient_data_actions = []
  metric_name               = "RequestCount"
  namespace                 = "AWS/ApplicationELB"
  period                    = "300"
  alarm_actions             = [data.aws_sns_topic.alb_monitor_sns.arn]
  dimensions = {
    LoadBalancer = "app/web"
  }

}

resource "aws_cloudwatch_metric_alarm" "cpu_utilization_monitor" {
  count                     = length(aws_instance.example)
  alarm_name                = "instance_monitor_${count.index + 1}"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "30"
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []
  alarm_actions             = [data.aws_sns_topic.cpu_monitor_sns.arn]
  dimensions = {
    InstanceId = aws_instance.example[count.index].id
  }
}
