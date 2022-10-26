# Terraform Provisioners

Provisioners can be used to model specific actions on the local machine or a remote machine in order to prepare servers.
Passing data in virtual machines and other compute resources. 

We can also run configuration management resources like chef, puppet after resource is created.

- Creation time provisioners
  - Kicked on during resource creation time.
- Destroy time provisioners
  - Kicked in during resource destroy time.

Types of Provisioners:
- File Provisioner
- local-exec provisioner
- remote-exec provisioner

Most provisioners require access to the remote resource via ssh or WinRM, and expect a nested connection block. Expressions
in connection block cannot refer to their parent resource by name. Instead they can use the special ```self``` object.

Example:

```terraform
connection {
  type = "ssh"
  host = self.public_ip
  user = "ec2-user"
  password = ""
  private_key = file("private-key/terraform-key.pem")
}
```

## 1a. File Provisioner:
File provisioners is used to copy files or directories from machine executing Terraform to the resource newly created.

It supports both SSH and WinRM.

Implementation of [File Provisioner](11a-File-Provisioner).

Failure Behaviour:
- ```Continue``` - Ignore the failure and continue with creation or destruction.
- ```Fail``` - Raise an error and stop applying. If creation provisioner: ```taint``` resource. For example, refer [ec2-create.tf](11a-File-Provisioner/ec2-create.tf).

## 1b. local-exec Provisioner:

The local-exec provisioner invokes a local executable script after a terraform resource is created.

This invokes a process on the machine running Terraform and not on the resource.

## 1c. remote-exec Provisioner:

The local-exec provisioner invokes a remote executable script after a terraform resource is created.

This invokes a process on the resource which can be used to execute configuration management tool or bootstrap a cluster.

# 2. Null-Resource

- If you need to run provisioners that aren't directly associated with a specific resource, you can associate them with a null
  resource.
- Instances of ```null_resource``` are treated like normal resources, but they don't do anything.
- Just like other resources, you can configure provisioners and connection details on a null_resource.