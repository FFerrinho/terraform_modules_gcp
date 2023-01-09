resource "random_uuid" "uuid" {
}

resource "random_id" "bucket_suffix" {
  byte_length = 8
}
