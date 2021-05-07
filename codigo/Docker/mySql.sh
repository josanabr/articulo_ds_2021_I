#!/usr/bin/env bash

sudo docker pull mysql/mysql-server:8.0
sudo docker run --name=my-sql-docker -d mysql/mysql-server:8.0