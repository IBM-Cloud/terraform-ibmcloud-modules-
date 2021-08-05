# IBM Confidential
# OCO Source Materials
# CLD-84025-1615393081
# (c) Copyright IBM Corp. 2021
# The source code for this program is not published or otherwise
# divested of its trade secrets, irrespective of what has been
# deposited with the U.S. Copyright Office


terraform {
  required_version = ">=0.13"
  required_providers {
    ibm = {
      source  = "local/ibm-cloud/ibm"
      version = ">=1.20.1"
    }
    shell = {
      source = "scottwinkler/shell"
      version = ">=1.7.7"
    }
    random = {
      source = "hashicorp/random"
      version = ">=3.0.1"
    }
  }
}
