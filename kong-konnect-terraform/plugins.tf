resource "konnect_gateway_plugin_rate_limiting" "flights_rate_limit" {
  control_plane_id = var.control_plane_id

  route = {
    id = konnect_gateway_route.flights_route.id
  }

  config = {
    minute  = 5
    policy  = "redis"
    redis = {
      partial_id = var.redis_partial_id    # ← points to shared partial
    }
  }

  enabled = true
  tags    = ["flight-bookings", "rate-limiting"]
}