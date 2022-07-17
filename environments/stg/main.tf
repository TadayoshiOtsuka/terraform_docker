module "ecr_repo" {
  source = "../../modules/ecr"

  name                 = var.project_name
  region               = var.region
  image_tag_mutability = "IMMUTABLE"
  docker_build_context = "./logger"
}
