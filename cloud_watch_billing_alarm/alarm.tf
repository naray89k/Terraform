# resource "aws_sns_topic" "billing" {
#   name = "alarm_updates"
# }

resource "aws_cloudwatch_metric_alarm" "billing" {
  #provider            = "aws.billing"
  alarm_name          = "Test_Billing_Alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  alarm_description   = "This metric monitors AWS Billing Rate - Test"
  evaluation_periods  = "1"
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = 6 * 60 * 60
  statistic           = "Maximum"
  threshold           = "9"
  #alarm_actions       = "${aws_sns_topic.billing.arn}"
  treat_missing_data = "missing"


  dimensions = {
    Currency = "USD"
  }
}
