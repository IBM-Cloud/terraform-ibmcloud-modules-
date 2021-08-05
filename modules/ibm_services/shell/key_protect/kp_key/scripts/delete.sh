#!/bin/bash
# IBM Confidential
# OCO Source Materials
# CLD-68685-1602740586
# (c) Copyright IBM Corp. 2020
# The source code for this program is not published or otherwise
# divested of its trade secrets, irrespective of what has been
# deposited with the U.S. Copyright Office.


set -ex
IN=$(cat)
echo "stdin: $IN"
key_id=$(echo $IN | jq -r .id)
echo $key_id

ibmcloud login -a $IBMCLOUD_API_ENDPOINT -r $IBM_REGION
ibmcloud target -g Default
ibmcloud kp region-set staging
readout=$(ibmcloud kp key delete $key_id \
	  -i $KP_INSTANCE_ID \
	  -f)
ibmcloud logout

echo $readout
