


resource "random_id" "this" {
  byte_length = "5"
}

output "random_hex" {
  value = "${random_id.this.hex}"
}

