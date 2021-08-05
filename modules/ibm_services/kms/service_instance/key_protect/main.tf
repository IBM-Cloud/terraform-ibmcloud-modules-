# IBM Confidential
# OCO Source Materials
# CLD-68685-1602740647
# (c) Copyright IBM Corp. 2020
# The source code for this program is not published or otherwise
# divested of its trade secrets, irrespective of what has been
# deposited with the U.S. Copyright Office.


variable "kp_instance_count" {
  description = "The number of key protect service instances"
  type        = number
  default     = 1
}

variable "kp_instance_name" {
  description = "Key protect service instance name"
}

variable "service_name" {
  description = "Service name"
  default     = "kms"
}

variable "service_plan" {
  description = "Service plan"
  default     = "tiered-pricing"
}

variable "service_location" {
  description = "The location on which the service is created"
  default     = "us-south"
}

variable "resource_group_id" {
  description = "Resource group ID"
}

resource "ibm_resource_instance" "this" {
  count             = var.kp_instance_count
  name              = "${var.kp_instance_name}-${count.index}"
  service           = var.service_name
  plan              = var.service_plan
  location          = var.service_location
  resource_group_id = var.resource_group_id
}

output "kp_instances" {
  value = ibm_resource_instance.this
}

output kp_instance_guids {
  value = [for item in ibm_resource_instance.this: item.guid]
}

