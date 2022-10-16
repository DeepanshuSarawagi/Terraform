# Terraform Data sources

## 1. Terraform Data sources basics
- Data sources allow data to be fetched or computed for use elsewhere in Terraform configuration.
- Use of Data sources allows a Terraform configuration to make use of information defined outside of Terraform configuration
  or defined by another separate Terraform configuration.
- A Data source is accessed by a special kind of resource known as ```data``` resource, and it has a separate ```data { }```
  block.
- Each data resource is associated with a single data source, which determines the kind of Object ir reads and what query constraint
  arguments are available.
- Data resources have the same dependency behavior as defined for managed resources.
- Setting the ```depends_on``` meta-argument within the ```data``` block defers reading of the data source until all the changes
  to the dependencies have been applied.
- Data sources do not currently have any customization settings available for their lifecycle, but the ```lifecycle``` nested
  block is reserved for future versions.
- Data sources support ```count``` and ```for_each``` meta arguments as defined for managed resources with same syntax and 
  behavior.
- Each instance will separately read from its data source with its own variant of the constraint arguments, producing an indexed
  result.