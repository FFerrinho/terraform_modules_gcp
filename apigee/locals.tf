locals {
  env_envgroup_pairs = flatten([
    for eg_name, eg in var.environment_groups : [
      for e in eg.environments : {
        envgroup = eg_name
        env      = e
      }
    ]
  ])
}
