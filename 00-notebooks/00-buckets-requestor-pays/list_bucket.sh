#! /bin/bash

aws s3 ls --request-payer requester dev-et-data/

echo this fails aws s3 ls dev-et-data/
aws s3 ls dev-et-data/
