#!/bin/bash
REGION="ap-south-1"
`aws ecr get-login --no-include-email --region ${REGION}`
