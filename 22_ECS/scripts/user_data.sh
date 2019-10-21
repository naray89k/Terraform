#! /bin/bash

{
  echo 'ECS_CLUSTER=example-cluster'
} >> /etc/ecs/ecs.config

start ecs

echo "Done"
