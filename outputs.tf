output "url" {
  value = "https://${local.env}-${local.region}.${var.domain_name}/ping"
}
