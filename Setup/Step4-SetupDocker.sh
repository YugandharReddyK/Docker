#!/bin/bash

# Update & install dependencies
sudo apt update
sudo apt-get -y install apt-transport-https ca-certificates curl gnupg lsb-release docker.io iptables

# Set iptables to legacy mode
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy

# Docker daemon configuration
sudo mkdir -p /etc/docker
echo '{
  "hosts": ["tcp://0.0.0.0:2375", "unix:///var/run/docker.sock"]
}' | sudo tee /etc/docker/daemon.json

# Add current user to docker group
sudo usermod -aG docker $USER

# Start Docker daemon in background
nohup sudo dockerd > /dev/null 2>&1 &

echo "✅ Docker installed and daemon running in background."