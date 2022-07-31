# =================
# ECR
# =================
# tfsec:ignore:aws-ecr-repository-customer-key
resource "aws_ecr_repository" "this" {
  name                 = var.name
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "null_resource" "initial_image_push" {
  provisioner "local-exec" {
    command = <<-EOF
      docker build ${var.docker_build_context} -t ${aws_ecr_repository.this.repository_url}:initial; \
      aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${aws_ecr_repository.this.repository_url}; \
      docker push ${aws_ecr_repository.this.repository_url}:initial;
    EOF

    on_failure = fail
  }

  depends_on = [
    aws_ecr_repository.this
  ]
}
