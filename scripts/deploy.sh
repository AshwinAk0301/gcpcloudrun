#!/bin/bash

ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

aws ecr get-login-password --region ap-southeast-1 | \
docker login --username AWS --password-stdin \
$ACCOUNT_ID.dkr.ecr.ap-southeast-1.amazonaws.com

docker stop myapp || true
docker rm myapp || true

docker pull $ACCOUNT_ID.dkr.ecr.ap-southeast-1.amazonaws.com/myapp:latest

docker run -d \
  --name myapp \
  -p 80:8080 \
  --restart unless-stopped \
  $ACCOUNT_ID.dkr.ecr.ap-southeast-1.amazonaws.com/myapp:latest
