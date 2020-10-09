module "ecs_cluster" {
  source = "infrablocks/ecs-cluster/aws"
  version = "0.2.5"

  region = "es-east-1"
  vpc_id = "vpc-6ea9e014"
  subnet_ids = "subnet-3a4cbb34, subnet-968549db"

  component = "important-component"
  deployment_identifier = "development"

  cluster_name = "services"
  cluster_instance_type = "t2.micro"

  cluster_minimum_size = 1
  cluster_maximum_size = 1
  cluster_desired_capacity = 1
}