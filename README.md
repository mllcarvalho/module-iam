# module-iam

######################
variables.tf
######################
variable "iam_policies" {
  type = map(any)
}

variable "iam_roles" {
  type = map(any)
}

######################
terraform.tfvars
######################
iam_policies = {
  ecs-task-policy = {
    document = "iam-documents/policy/ecs-task-policy.json"
    path     = "/"
  }
  ecs-execution-policy = {
    document = "iam-documents/policy/ecs-execution-policy.json"
    path     = "/"
  }
}

iam_roles = {
  ecs-task-role = {
    trust_policy_document = "iam-documents/trust/ecs-trust.json"
    attached_policies     = ["arn:aws:iam::ACCOUNT_ID:policy/ecs-task-policy"]
  }
  ecs-execution-role = {
    trust_policy_document = "iam-documents/trust/ecs-trust.json"
    attached_policies     = ["arn:aws:iam::ACCOUNT_ID:policy/ecs-execution-policy"]
  }
}
