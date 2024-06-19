provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "my-context"

  }
  kubernetes{
    host = var.kubernetes.host

    client_certificate     = file("~/.kube/client-cert.pem")
    client_key             = file("~/.kube/client-key.pem")
    cluster_ca_certificate = file("~/.kube/cluster-ca-cert.pem")
  }
}

resource "helm_release" "firstmate_monitoring" {
  name       = var.name
  namespace   = var.nameSpace

  repository = var.repository
  chart      = var.chart
  version    = var.chartVersion

  set {
    name  = "clusterName"
    value = var.clusterName
  }
  set {
    name  = "apiKey"
    value = var.apiKey
  }
  set {
    name  = "permissions.nodesMetrics"
    value = var.permissions.nodesMetrics
  }
  set {
    name  = "permissions.kubeMetrics"
    value = var.permissions.kubeMetrics
  }
  set {
    name  = "permissions.appsMetrics"
    value = var.permissions.appsMetrics
  }
  set {
    name  = "permissions.scalingMetrics"
    value = var.permissions.scalingMetrics
  }
}