
resource "local_file" "a-file" {
  content = var.file_content
  filename = var.file_name
}

