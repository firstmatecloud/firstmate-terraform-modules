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

locals {
  url = "${var.baseUrl}/${var.path}"
}

data "http" "sync" {
  url    = local.url
  method = var.method

  request_headers = {
    Accept = "application/json"
    authorization = var.api_key
  }
  # Optional request body
  request_body = var.body
}


