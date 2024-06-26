variable "baseUrl" {
  description = "Baseurl of firstmate"
  type        = string
#   default     = "api.eu.firstmate.cloud/api/v1/sync"
  default     = "localhost:3000/api/v1/tfsync"
}

variable "path" {
  description = "path of the request"
  type        = string
  default     = "kubernetes-monitoring"
}

variable "method" {
  description = "Baseurl of firstmate"
  type        = string
  default     = "POST"
}

variable "body" {
  description = "body of request"
  type        = string

}


variable "api_key" {
  description = "Firstmate Api key"
  type        = string
}


