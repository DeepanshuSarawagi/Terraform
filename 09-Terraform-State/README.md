# Terraform State

## 1. Introduction

The Terraform state files maintain the state of real cloud objects provisioned using Terraform. Usually the state file name 
is ```terraform.tfstate```.
We can store terraform state files locally or on a remote storage like S3 buckets.

## 2. Terraform Backends
The Terraform remote state storage is referred to as Terraform backends.
Backends are responsible for storing state and providing an API for state locking.

Each Terraform configuration can specify a backend, which specifies where and how operations are performed, where state snapshots
are stored.

Backend configuration is only used by Terraform CLI.

Terraform State and Terraform Enterprise always use their own state storage, so they ignore any backend block in the Terraform
configuration.

Terraform Backends also refer to where operations are performed. Operations refer to API requests against infrastructure services
in order to create, read, update or destroy resources.

### 2a. Backend Types

#### Enhanced backend:
Enhanced backend can both store state and perform operations. There are only two enhanced backends - ```local and remote```.

Example for remote backends performing operations: Terraform cloud and Terraform Enterprise.

#### Standard backends:
Standard backends only store state, and rely on the local backend for performing operations.

Example: AWS S3, Azure RM, Consul, etcd, gcs http and many more.

## 3. Terraform State Storage
Since we are using AWS as Terraform provider, we will be storing the Terraform State file in S3 bucket.

Below are the problems with local state file. And how it can be resolved using remote state file.

### Local State File
- Multiple team members cannot update the infrastructure as don't have access to the state file.

### Remote State File
- Using Terraform Backend, we can store the state files in S3 bucket.
- This way multiple team members can get access to the state file for infrastructure update.
  #### Cons:
  - If two members are running Terraform at the same time, one may run into race conditions as multiple Terraform processes
    make concurrent updates to the state files, leading to conflicts, data loss and corruption of state file.
- For implementing backend, refer [version.tf](09a-Terraform-Remote-State-Storage-And-Locking/version.tf).

## 4. Terraform State Locking
To overcome above issues, we need to implement locking of state files. Locking of state file ensures no conflicts.
When we run terraform plan/apply, a lock file named ```.terraform.lock.hcl``` gets created.
We will implement the Terraform State locking using Amazon DynamoDB table. Once the changes are complete, the lock will 
be released for further infrastructure updates.

For implementing state locking, we need to add ```dynamodb_table``` in the ```backend {}``` block. For example, 
refer [version.tf](09a-Terraform-Remote-State-Storage-And-Locking/version.tf).

- Not all backends supports state locking, however, AWS S3 supports state locking.
- State locking happens automatically on all operations (plan/apply/destroy) that could write state.
- If state locking fails, terraform will not continue.
- You can disable state locking for most commands using ```-lock``` flag, however, it is not recommended.
- If acquiring the lock is taking longer time than expected, Terraform will output a status message.
- If Terraform doesn't output a message, state locking is still occurring if backend still supports it.
- Terraform has a ```force-unlock``` command to manually unlock a state of unlocking fails, however, this is highly not recommended.

## 5. Terraform State Commands

### 5a. terraform show command

```terraform show``` command is used to provide human-readable output from a state or plan file.

This can be used to inspect a plan to ensure that the planned operations are expected, or to inspect the current state.
Terraform plan output files are binary files and we can read them using terraform show command.

```shell
$terraform init
$terrafor plan -out=plan.out   # output the plan to a file
$terraform show plan.out       # read the plan output file
$terraform show -json plan.out # show the plan output in json format
```

```terraform show``` command will work if state file ```terraform.tfstate``` file is present.