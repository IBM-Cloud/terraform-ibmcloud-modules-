# IBM Confidential
# OCO Source Materials
# CLD-68685-1602740605
# (c) Copyright IBM Corp. 2020
# The source code for this program is not published or otherwise
# divested of its trade secrets, irrespective of what has been
# deposited with the U.S. Copyright Office.


variable region {}
variable kp_instance_id {}
variable kp_key_id {}

resource "shell_script" "registrations" {
  lifecycle_commands {
    create = file("${path.module}/scripts/create.sh")
    delete = file("${path.module}/scripts/delete.sh")
    read   = file("${path.module}/scripts/read.sh")
  }
 
  environment = {
    IBM_REGION     = var.region
    KP_INSTANCE_ID = var.kp_instance_id
    KP_KEY_ID      = var.kp_key_id

  }
}

output "registrations" {
  value = shell_script.registrations.output
}
