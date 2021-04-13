#!/bin/bash
# IBM Confidential
# OCO Source Materials
# CLD-85275-1615444556
# (c) Copyright IBM Corp. 2021
# The source code for this program is not published or otherwise
# divested of its trade secrets, irrespective of what has been
# deposited with the U.S. Copyright Office.

function retry {
  local n=1
  local max=5
  local delay=1
  while true; do
    "$@" && break || {
      if [[ $n -lt $max ]]; then
        ((n++))
        echo "Command failed. Attempt $n/$max:"
        sleep $delay;
      else
        echo "The command has failed after $n attempts."
        exit 1
      fi
    }
  done
}


retry ibmcloud login -a $IBMCLOUD_API_ENDPOINT -r $IBM_REGION -g $RESOURCE_GROUP -q
set -ex
IN=$(cat)
is_ig_schedule_manager_id=$(echo $IN | jq -r .id)
ibmcloud is igmd $IG_ID $is_ig_schedule_manager_id -f
ret=$?
if [ $ret -ne 0 ]; then
        exit 1
fi
