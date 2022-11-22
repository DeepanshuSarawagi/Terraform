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
- We can manually lock the workspace to prevent the terraform runs.

## Terraform VCS Integration

When integrated with version control system, Terraform cloud,

- Can automatically initiate terraform runs.
- Makes code review easier by automatically predicting how PRs will affect infrastructure.
- Publishing new versions of private TF module is as easy as pushing a tag to the modules' repository.
- Terraform cloud supports following VCS providers
  -  GitHub
  - GitHub.com (OAuth)
  - GitHub Enterprise
  - GitLab.com
  - GitLab EE and CE
  - Bitbucket Cloud
  - Bitbucket Server
  - Azure DevOps Server
  - Azure DevOps Services

## Terraform Private Module Registry

Terraform cloud's private module registry helps you share Terraform modules across your organization.

It includes support for modules versioning, a searchable and filterable list of available modules and a configuration designer
to help build workspace faster.

It works much like public module registry.

## Terraform Sentinel

Sentinel is an embedded policy-as-code framework integrated with hashicorp enterprise products.
It enabled fine-grained logic-based policy decisions, and can be extended to use information from external sources.

Terraform Sentinel policy check is not available in free plan version.

Sentinel as code can be used for cost control policies.

```terraform login``` command can be used to log in to tf cloud organization.

We need to import certain terraform specific libraries for sentinel to access to your configuration.

- tfplan - This gives sentinel access to your terraform plan
- tfstate - This gives access to your tf state files
- tfconfig - This gives access to your .tf files
- tfrun - This gives access to your workspace and run logs

Below is the sample terraform sentinel policy to check the valid tf version.

```terraform
import "tfplan/v2" as tfplan
import "strings"

v = strings.split(tfplan.terraform_version, ".")
version_major = int(v[1])
version_minor = int(v[2])

main = rule {
  version_major >= 14
}
```

Terraform sentinel policies will be executed after the terraform plan and before terraform apply.