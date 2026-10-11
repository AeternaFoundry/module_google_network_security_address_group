resource "google_network_security_address_group" "network_security_address_groups" {
  for_each = var.network_security_address_groups

  capacity        = each.value.capacity
  location        = each.value.location
  name            = each.value.name
  type            = each.value.type
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  items           = each.value.items
  labels          = each.value.labels
  parent          = each.value.parent

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

