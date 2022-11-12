# Terraform Cloud and Terraform Enterprise

- Different distribution of same application.
- Terraform cloud is a cloud hosted solution.
- On other hand, enterprise is a self-hosted solution.
- It manages Terraform runs in a consistent and reliable environment, and includes easy access to shared state and secret
  data, access controls for approving changes to infrastructure.
- It also provides private registry for sharing modules, detailed policy controls for governing the controls of Terraform
  configurations.
- RBAC system, Sentinel for governing Terraform configurations.
- Free accounts for small teams, paid plans for medium-sized business. 
- Self-hosted distribution for large enterprises called as Terraform Enterprise.

## Terraform VCS Integration

When integrated with version control system, Terraform cloud,

- Can automatically initiate terraform runs.
- Makes code review easier by automatically predicting how PRs will affect infrastructure.
- Publishing new versions of private TF module is as easy as pushing a tag to the modules' repository.