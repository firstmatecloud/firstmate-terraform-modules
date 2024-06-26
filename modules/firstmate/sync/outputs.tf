output "status_code" {
  description = "The status code of the request"
  value       = data.http.sync.status_code
}