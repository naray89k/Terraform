resource "aws_cloudwatch_metric_alarm" "cpu_monitor" {
  count                     = length(aws_instance.example)
  alarm_name                = "cpu_monitor_inst_${count.index}"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "30"
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []
  dimensions = {
    InstanceId = aws_instance.example[count.index].id
  }
}
