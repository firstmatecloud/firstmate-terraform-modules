output "name" {
  description = "The name of the helm chart"
  value       = helm_release.firstmate_monitoring_release.name
}
output "namespace" {
  description = "The namespace where the chart is deployed"
  value       = helm_release.firstmate_monitoring_release.namespace
}
output "chart" {
  description = "The name of the chart"
  value       = helm_release.firstmate_monitoring_release.chart
}

output "version" {
  description = "The version of the chart"
  value       = helm_release.firstmate_monitoring_release.version
}
