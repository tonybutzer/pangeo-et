#!/bin/bash
# get temporary keys for GDAL based on role using AWS CLI
AWS_STS_RESPONSE=`aws sts assume-role-with-web-identity \
        --role-arn arn:aws:iam::376067480372:role/eks-pangeo-node \
        --role-session-name gdal-session-$(date +%s) \
        --web-identity-token file:///var/run/secrets/eks.amazonaws.com/serviceaccount/token`
# parse CLI response using jq and grep
export AWS_ACCESS_KEY_ID=`echo ${AWS_STS_RESPONSE} | jq -r '.Credentials.AccessKeyId'`
export AWS_SECRET_ACCESS_KEY=`echo ${AWS_STS_RESPONSE} | jq -r '.Credentials.SecretAccessKey'`
export AWS_SESSION_TOKEN=`echo ${AWS_STS_RESPONSE} | jq -r '.Credentials.SessionToken'`
export AWS_REGION=`echo ${AWS_STS_RESPONSE} | jq -r '.Provider' | grep -oP '(?<=eks.).*?(?=.amazonaws)'`
# for GDAL<3.2
export AWS_DEFAULT_REGION=$AWS_REGION

export AWS_REQUEST_PAYER=requester

