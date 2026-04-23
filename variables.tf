variable "ise_username" {
  description = "ISE admin username"
  type        = string
  sensitive   = true
}

variable "ise_password" {
  description = "ISE admin password"
  type        = string
  sensitive   = true
}

variable "ise_url" {
  description = "ISE base URL (e.g. https://ise.example.com)"
  type        = string
}

variable "csv_file" {
  description = "Path to the CSV file containing SGT definitions"
  type        = string
  default     = "sgts.csv"
}

variable "ip_sgt_csv_file" {
  description = "Path to the CSV file containing IP-to-SGT mappings (columns: ip, sgt)"
  type        = string
  default     = "ip_sgt_mappings.csv"
}
