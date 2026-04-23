locals {
  sgts = { for row in csvdecode(file(var.csv_file)) : row.sgt => row }
}

resource "ise_trustsec_security_group" "sgt" {
  for_each = local.sgts

  name        = each.value.sgt
  value       = tonumber(each.value.id)
  description = each.value.description
}
