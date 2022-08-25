locals {
  env_envgroup_pairs = flatten([
    for eg_name, eg in var.environment_groups : [
      for e in eg.environments : {
        envgroup = eg_name
        env      = e
      }
    ]
  ])

  instance_env_attach = flatten([
    for instance_key, environments in var.apigee_instances : [
        for environment_key, env in 
    ]
  ])
}
