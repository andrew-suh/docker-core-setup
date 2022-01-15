#!/usr/bin/env bash

apt-get remove docker docker-engine docker.io containerd runc
apt-get update
apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    uidmap
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io


# Configure Docker to listen on a TCP socket
mkdir -p /etc/systemd/system/docker.service.d
mkdir -p /etc/default

cat << EOF > /etc/default/docker
DOCKER_OPTS="--config-file=/etc/docker/daemon.json"
EOF

cat << EOF > /etc/systemd/system/docker.service.d/docker.conf
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd --containerd=/run/containerd/containerd.sock
EOF

cat << EOF > /etc/docker/daemon.json
{
  "tls": false,
  "storage-driver": "overlay2",
  "insecure-registries":["0.0.0.0:2375"],
  "hosts":["fd://", "tcp://0.0.0.0:2375"]
}
EOF

#usermod -aG docker vagrant
systemctl daemon-reload
systemctl restart docker.service
