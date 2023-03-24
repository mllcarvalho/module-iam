# module-iam

###################### <br />
variables.tf <br />
###################### <br /><br />
variable "iam_policies" { <br />
&ensp; type = map(any) <br />
} <br />

variable "iam_roles" { <br />
&ensp; type = map(any) <br />
} <br />

###################### <br />
terraform.tfvars <br />
###################### <br /><br />
iam_policies = { <br />
&ensp;  ecs-task-policy = { <br /> 
&ensp;&ensp;    document = "iam-documents/policy/ecs-task-policy.json" <br />
&ensp;&ensp;    path     = "/" <br />
&ensp;  } <br />
&ensp;  ecs-execution-policy = { <br />
&ensp;&ensp;    document = "iam-documents/policy/ecs-execution-policy.json" <br />
&ensp;&ensp;    path     = "/" <br />
&ensp;  } <br /> 
} <br />

iam_roles = { <br />
&ensp;  ecs-task-role = { <br />
&ensp;&ensp;    trust_policy_document = "iam-documents/trust/ecs-trust.json" <br />
&ensp;&ensp;    attached_policies     = ["arn:aws:iam::ACCOUNT_ID:policy/ecs-task-policy"] <br />
&ensp;  } <br />
&ensp;  ecs-execution-role = { <br />
&ensp;&ensp;    trust_policy_document = "iam-documents/trust/ecs-trust.json" <br />
&ensp;&ensp;    attached_policies     = ["arn:aws:iam::ACCOUNT_ID:policy/ecs-execution-policy"] <br />
&ensp;  } <br />
} <br />
