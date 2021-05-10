#!/usr/bin/env bash

curl -L https://github.com/TPC-Council/HammerDB/releases/download/v4.1/HammerDB-4.1-Linux-x64-installer.run -o /home/vagrant/HammerDB-4.1-Linux-x64-installer.run
chmod 777 HammerDB-4.1-Linux-x64-installer.run
./HammerDB-4.1-Linux-x64-installer.run