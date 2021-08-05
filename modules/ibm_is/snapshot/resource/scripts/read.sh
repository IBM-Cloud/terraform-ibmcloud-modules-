#!/bin/bash
# IBM Confidential
# OCO Source Materials
# CLD-82789-1613971384
# (c) Copyright IBM Corp. 2021
# The source code for this program is not published or otherwise
# divested of its trade secrets, irrespective of what has been
# deposited with the U.S. Copyright Office.


set -ex
source ${SCRIPTS_PATH}/functions
IN=$(cat)
echo "stdin: $IN"
snapshot_id=$(echo $IN |jq -r .id)

cmd="ibmcloud login -a $IBMCLOUD_API_ENDPOINT -r $REGION -g $RESOURCE_GROUP_ID -q"
retry 5 10 $cmd
output=$(ibmcloud is snapshot $snapshot_id --output JSON)
echo $output
