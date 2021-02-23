#!/bin/bash
a=$(aws-sso-credential-process --profile default) &&
export AWS_SECRET_ACCESS_KEY=$(jq -r '.SecretAccessKey' <<< "$a") &&
export AWS_ACCESS_KEY_ID=$(jq -r '.AccessKeyId' <<< "$a") &&
export AWS_SESSION_TOKEN=$(jq -r '.SessionToken' <<< "$a") &&
/home/jupyter/jupyter_start.sh
