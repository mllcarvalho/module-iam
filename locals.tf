locals {
  attached = flatten([
    for k, v in var.iam_roles : [
      for r in v.attached_policies : {
        attach  = r
        role = k
      }
    ]
  ])
}

output "attach" {
  value = flatten([
    for k, v in var.iam_roles : [
      for r in v.attached_policies : {
        attach  = r
        role = k
      }
    ]
  ])
}