/*
Output for loop with list
*/
output "for_output_list" {
  value = [for instance in aws_instance.TerraformEC2Demo1: instance.private_dns]
  description = "Output values using For loop with list"
}

// Output for loop with map

output "for_output_map" {
  value = {for instance in aws_instance.TerraformEC2Demo1: instance.id => instance.private_ip}
}

// Output for loop with advanced

output "for_output_map_advanced" {
  value = {
    for c, instance in aws_instance.TerraformEC2Demo1: c => instance.public_dns
  }  // Here variable c stands for count which is defined in the resource aws_instance
  description = "Output using for loop with map - Advanced"
}

// Output using legacy Splat operator - Returns the list

output "output_legacy_splat" {
  value = aws_instance.TerraformEC2Demo1.*.public_dns             # This "*" is a legacy splat operator which will print
                                                                  # public_dns of every instance based on count defined in the resource
  description = "Getting public dns using legacy splat operator"
}

// Output using latest generalized splat Operator

output "output_latest_splat" {
  value = aws_instance.TerraformEC2Demo1[*].public_ip             # This "*" is a splat operator which will print
                                                                  # public_ip of every instance based on count defined in the resource
  description = "Getting public dns using legacy splat operator"
}