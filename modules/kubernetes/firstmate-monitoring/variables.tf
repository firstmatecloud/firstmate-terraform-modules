variable "kube_config" {
  description = "Kubernetes config to connect to cluster."
  type = object({
    host = string
    client_certificate = string
    client_key = string
    cluster_ca_certificate = string
  })
}

variable "name" {
  description = "Name of the helm release"
  type        = string
  default     = "firstmate-monitoring"
}
variable "namespace" {
  description = "Name of the helm release"
  type        = string
  default     = "firstmate"
}
variable "repository" {
  description = "Repository of the helm chart"
  type        = string
  default     = "oci://registry-1.docker.io/desyco"
}
variable "chart" {
  description = "Name of the helm chart"
  type        = string
  default     = "firstmate-client-monitoring-chart"
}

variable "chart_version" {
  description = "Version of the helm chart"
  type        = string
  default     = "0.1.0"
}

variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
}
variable "api_key" {
  description = "Api key to connect to the FirstMate Api"
  type        = string
}
variable "permissions" {
  description = "Map of allowed permissions in the cluster"
  type        = map(bool)
  default = {
    nodesMetrics = true
    kubeMetrics = true
    appsMetrics = true
    scalingMetrics = true
  }
}

