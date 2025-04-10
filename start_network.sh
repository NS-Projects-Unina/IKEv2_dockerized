#!/bin/bash

# Crea la rete Docker
docker network create --subnet=192.168.1.0/24 myvpn

# Crea i container
docker run -d --name node1 --net myvpn --ip 192.168.1.2 --privileged ubuntu:latest sleep infinity
docker run -d --name node2 --net myvpn --ip 192.168.1.3 --privileged ubuntu:latest sleep infinity

echo "Rete  creata  con node1 e node2! 🚀"


