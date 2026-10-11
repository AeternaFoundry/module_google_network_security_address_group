variable "network_security_address_groups" {
  description = <<EOT
Map of network_security_address_groups, attributes below
Required:
    - capacity
    - location
    - name
    - type
Optional:
    - deletion_policy
    - description
    - items
    - labels
    - parent
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    capacity        = number
    location        = string
    name            = string
    type            = string
    deletion_policy = optional(string)
    description     = optional(string)
    items           = optional(list(string))
    labels          = optional(map(string))
    parent          = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

