module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 1.26.0"

  name               = "app-teste"
  cidr               = "10.10.10.0/24"
  azs                = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets    = ["10.10.10.0/27", "10.10.10.32/27", "10.10.10.64/27"]
  public_subnets     = ["10.10.10.96/27", "10.10.10.128/27", "10.10.10.160/27"]
  enable_nat_gateway = true
  single_nat_gateway = true
  tags               = {
    Environment = "dev"
    Owner = "me"
  }
}

module "ecs_cluster" {
  source = "anrim/ecs/aws//modules/cluster"

  name = "app-teste"
  vpc_id      = "vpc-6ea9e014"
  vpc_subnets = ["subnet-3a4cbb34", "subnet-968549db", "subnet-826158de"]
  tags        = {
    Environment = "dev"
    Owner = "Erick - DevOps"
  }
}

module "alb" {
  source = "anrim/ecs/aws//modules/alb"

  name            = "app-teste"
  host_name       = "app"
  domain_name     = "example.com"
  certificate_arn = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
  backend_sg_id   = "${module.ecs_cluster.instance_sg_id}"
  vpc_id      = "vpc-6ea9e014"
  vpc_subnets = ["subnet-3a4cbb34", "subnet-968549db", "subnet-826158de"]
  tags        = {
    Environment = "dev"
    Owner = "Erick - DevOps"
  }
}

resource "aws_ecs_task_definition" "app" {
  family = "app-teste"
  container_definitions = <<EOF
[
  {
    "name": "nginx",
    "image": "nginx:1.13-alpine",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "app-teste",
        "awslogs-region": "us-east-1"
      }
    },
    "memory": 512,
    "cpu": 512
  }
]
EOF
}

module "ecs_service_app" {
  source = "anrim/ecs/aws//modules/service"

  name = "app-teste"
  alb_target_group_arn = "${module.alb.target_group_arn}"
  cluster              = "${module.ecs_cluster.cluster_id}"
  container_name       = "app-teste"
  container_port       = "80"
  log_groups           = ["app-teste"]
  task_definition_arn  = "${aws_ecs_task_definition.app.arn}"
  tags                 = {
    Environment = "dev"
    Owner = "Erick - DevOps"
  }
}