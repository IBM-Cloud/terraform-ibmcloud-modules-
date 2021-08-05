#!/bin/bash
# IBM Confidential
# OCO Source Materials
# CLD-68685-1602740576
# (c) Copyright IBM Corp. 2020
# The source code for this program is not published or otherwise
# divested of its trade secrets, irrespective of what has been
# deposited with the U.S. Copyright Office.


set -ex
IN=$(cat)
is_vpc_rtbl_id=$(echo $IN | jq -r .id)
ibmcloud login -a $IBMCLOUD_API_ENDPOINT -r $IBM_REGION -g $RESOURCE_GROUP
ibmcloud is target --gen 2
ibmcloud is vpc-rtbld -f $VPC_ID $is_vpc_rtbl_id
ibmcloud logout

# root@8d3d894bd869:/system-tf-base# ic is vpc-rtbld --help
# NAME:
#     vpc-routing-table-delete - Delete a VPC routing table
#
# USAGE:
#     ibmcloud is vpc-routing-table-delete VPC ROUTING_TABLE [-f, --force] [-q, --quiet]
#     VPC:           ID of the VPC.
#     ROUTING_TABLE: ID of the VPC routing table.
#
# OPTIONS:
#     --force, -f  Force the operation without confirmation
#     -q, --quiet  Suppress verbose output
#
# root@8d3d894bd869:/system-tf-base#
