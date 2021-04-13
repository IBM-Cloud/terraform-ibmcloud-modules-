#!/bin/bash
# IBM Confidential
# OCO Source Materials
# CLD-68685-1602740539
# (c) Copyright IBM Corp. 2020
# The source code for this program is not published or otherwise
# divested of its trade secrets, irrespective of what has been
# deposited with the U.S. Copyright Office.


set -ex
IN=$(cat)
is_igmp_id=$(echo $IN | jq -r .id)
ibmcloud login -a $IBMCLOUD_API_ENDPOINT -r $IBM_REGION
ibmcloud is target --gen 2
ibmcloud is igmpd -f $IG_ID $IGM_ID $is_igmp_id
ibmcloud logout
