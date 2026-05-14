resource "konnect_gateway_partial" "aws_valkey_redis" {
  control_plane_id = var.control_plane_id

  redis_ee = {
    name = "aws-valkey-redis"
    config = {
      host                  = var.redis_host
      port                  = var.redis_port
      ssl                   = true
      ssl_verify            = false
      database              = 0
      connect_timeout       = 2000
      read_timeout          = 2000
      send_timeout          = 2000
      keepalive_pool_size   = 256
      keepalive_backlog     = 0
      connection_is_proxied = false
    }
  }
}