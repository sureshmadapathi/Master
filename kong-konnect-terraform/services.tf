resource "konnect_gateway_service" "flight_bookings" {
  control_plane_id = var.control_plane_id
  name             = "flight-bookings-service"
  url              = "https://httpbin.konghq.com"
  tags             = ["flight-bookings"]
}

resource "konnect_gateway_route" "flights_route" {
  control_plane_id = var.control_plane_id
  service = {
    id = konnect_gateway_service.flight_bookings.id
  }
  name       = "flights-route"
  paths      = ["/flights"]
  methods    = ["GET"]
  strip_path = true
  tags       = ["flight-bookings"]
}