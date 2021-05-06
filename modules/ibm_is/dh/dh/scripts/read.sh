#!/bin/bash


set -ex
IN=$(cat)
echo "stdin: $IN"
dh_id=$(echo $IN |jq -r .id)

ibmcloud login -a $IBMCLOUD_API_ENDPOINT -r $REGION -g $RESOURCE_GROUP_ID -q
output==$(ibmcloud is dedicated-host $dh_id --output JSON)
ibmcloud logout

echo $output
