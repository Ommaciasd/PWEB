variable "$VARIABLE_NAME" {}

variable "$VARIABLE_NAME_LIST" {
  type    = list(string)
  default = ["$ITEM"]
}

variable "VARIABLE_NAME_OBJECT" {
  type = list(object({
    name           = string
    address_prefix = string
  }))
  default = [

    {
      name           = "$OBJECT_LIST_NAME"
      address_prefix = "$NETWORK/$CIDR"
    }
  ]
}
