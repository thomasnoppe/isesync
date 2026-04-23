locals {
  sgts = { for row in csvdecode(file(var.csv_file)) : row.sgt => row }

  ip_sgt_mappings = { for row in csvdecode(file(var.ip_sgt_csv_file)) : row.ip => row }
}

resource "ise_trustsec_security_group" "sgt" {
  for_each = local.sgts

  name        = each.value.sgt
  value       = tonumber(each.value.id)
  description = each.value.description
}

resource "ise_trustsec_ip_to_sgt_mapping" "mapping" {
  for_each = local.ip_sgt_mappings

  name        = "${each.key}_${each.value.sgt}"
  host_ip     = each.key
  deploy_type = "ALL"
  sgt         = ise_trustsec_security_group.sgt[each.value.sgt].id
}
