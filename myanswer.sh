#! /bin/bash

## backend and frontend networks
docker network create --driver overlay backend
docker network create --driver overlay frontend

## python vote service
docker service create --name vote --network frontend -p 80:80 --replicas 2 bretfisher/examplevotingapp_vote

## redis service
docker service create --network frontend --name redis redis:3.2

## .NET worker service
docker service create --name worker --network backend --network frontend bretfisher/examplevotingapp_worker:java

## postgres service
docker service create --name db --mount type=volume,source=pdata,destination=/var/lib/postgresql/data --network backend -e POSTGRES_HOST_AUTH_METHOD=trust postgres:9.4

## Nodejs result service
docker service create --name result -p 5001:80 --network backend bretfisher/examplevotingapp_result

