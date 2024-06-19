terraform {
  required_providers {
    helm       = {
      source  = "hashicorp/helm"
      version = "=2.1.2"
    }
    kubernetes =  {
      source  = "hashicorp/kubernetes"
      version = "=2.3.1"
    }
  }
}


provider "helm" {
  kubernetes{
    host = var.kube_config.host

    client_certificate     = file("~/.kube/client-cert.pem")
    client_key             = file("~/.kube/client-key.pem")
    cluster_ca_certificate = file("~/.kube/cluster-ca-cert.pem")
  }
}

resource "helm_release" "firstmate_monitoring" {
  name       = var.name
  namespace   = var.namespace

  repository = var.repository
  chart      = var.chart
  version    = var.chart_version

  set {
    name  = "clusterName"
    value = var.cluster_name
  }
  set {
    name  = "apiKey"
    value = var.api_key
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