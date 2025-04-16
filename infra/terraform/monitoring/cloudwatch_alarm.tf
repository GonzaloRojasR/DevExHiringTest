resource "aws_cloudwatch_metric_alarm" "pod_unavailable" {
  alarm_name          = "desafio-app-pod-unavailable"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "Ready"
  namespace           = "ContainerInsights"
  period              = 60
  statistic           = "Minimum"
  threshold           = 1
  alarm_description   = "Se han detectado pods no disponibles para la app desafio"
  treat_missing_data  = "breaching"

  dimensions = {
    ClusterName = var.cluster_name
    Namespace   = "desafio-app"
    PodName     = "desafio-app"
  }

  alarm_actions = [aws_sns_topic.alerts.arn]
}
