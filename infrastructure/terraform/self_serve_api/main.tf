# Self-serve Homologation Platform: API Gateway -> Lambda -> EventBridge
# Allows scientists to trigger shadow runs and promote models from dev to staging/prod.

variable "environment" {
  type    = string
  default = "production"
}

variable "lambda_execution_role_arn" {
  type    = string
  default = "arn:aws:iam::123456789012:role/SelfServeLambdaRole"
}

variable "step_function_arn" {
  type = string
}

resource "aws_apigatewayv2_api" "self_serve_api" {
  name          = "mlops-self-serve-api-${var.environment}"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "default_stage" {
  api_id      = aws_apigatewayv2_api.self_serve_api.id
  name        = "$default"
  auto_deploy = true
}

resource "aws_cloudwatch_event_bus" "mlops_bus" {
  name = "mlops-governance-bus-${var.environment}"
}

output "api_endpoint" {
  value = aws_apigatewayv2_api.self_serve_api.api_endpoint
}

output "event_bus_arn" {
  value = aws_cloudwatch_event_bus.mlops_bus.arn
}
