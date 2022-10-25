# Terraform Provisioners

Provisioners can be used to model specific actions on the local machine or a remote machine in order to prepare servers.
Passing data in virtual machines and other compute resources. 

We can also run configuration management resources like chef, puppet after resource is created.

- Creation time provisioners
  - Kicked on during resource creation time.
- Destroy time provisioners
  - Kicked in during resource destroy time.

Failure Behaviour: 
- ```Continue``` - Ignore the failure and continue with creation or destruction.
- ```Fail``` - Raise an error and stop applying. If creation provisioner: ```taint``` resource.

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
