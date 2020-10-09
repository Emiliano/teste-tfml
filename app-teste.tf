resource "aws_ecs_cluster" "teste" {
  name = "Cluster de Teste"
}

resource "aws_ecs_service" "wordpress-nginx-php" {
  name            = "wordpress-nginx-php"
  cluster         = aws_ecs_cluster.teste.id
  task_definition = aws_ecs_task_definition.wordpress-nginx-php.arn
  desired_count   = 3
  iam_role        = aws_iam_role.foo.arn
  depends_on      = [aws_iam_role_policy.foo]
}

resource "aws_ecs_task_definition" "wordpress-nginx-php" {
  family                = "wordpress-nginx-php"
  container_definitions = file("task-definitions/service.json")
}