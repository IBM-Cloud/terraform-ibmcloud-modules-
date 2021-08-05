#!/bin/bash
# IBM Confidential
# OCO Source Materials
# CLD-68685-1602740622
# (c) Copyright IBM Corp. 2020
# The source code for this program is not published or otherwise
# divested of its trade secrets, irrespective of what has been
# deposited with the U.S. Copyright Office.


set -ex
IN=$(cat)
echo "stdin: $IN"

ibmcloud login -a $IBMCLOUD_API_ENDPOINT -r $IBM_REGION
ibmcloud target -g Default
ibmcloud kp region-set staging
output=$(ibmcloud kp key unwrap $KP_KEY_ID \
	 $CIPHERTEXT \
	 --aad $AAD \
	 -i $KP_INSTANCE_ID \
	 --output json)
ibmcloud logout

echo $output
