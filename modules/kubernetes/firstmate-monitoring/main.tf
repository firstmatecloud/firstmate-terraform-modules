terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "=2.14.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "=2.3.1"
    }
  }
}


provider "helm" {
  kubernetes{
    host = var.kube_config.host
    client_certificate     = var.kube_config.client_certificate
    client_key             = var.kube_config.client_key
    cluster_ca_certificate = var.kube_config.cluster_ca_certificate
  }
}

resource "helm_release" "firstmate_monitoring_release" {
  name       = var.name
  namespace   = var.namespace

  repository = var.repository
  chart      = var.chart
  version    = var.chart_version

  create_namespace = true

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

module "sync" {
  source  = "git::git@github.com:firstmatecloud/firstmate-terraform-modules.git//modules/firstmate/sync?ref=0.0.10"
  depends_on = [helm_release.firstmate_monitoring_release]
  api_key = var.api_key
  body = jsonencode({
    cluster = {
      name     = var.cluster_name
      version = var.kube_config.version
    }
  })
  path = "kubernetes-monitoring"
}
