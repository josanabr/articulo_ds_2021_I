#!/usr/bin/env bash

echo "install postgres image"
sudo docker pull postgres:13.2
sudo docker run --name posCont -e POSTGRES_PASSWORD=pwd -p 5432:5432 -d postgres:13.2
sudo docker exec -it posCont psql -U postgres -d postgres -a -f coffeemach-ddl.sql
