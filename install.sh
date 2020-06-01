#!bin/bash

sudo yum install wget curl unzip -y
# Install Docker
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

sudo yum install -y yum-utils

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker
sudo systemctl status docker
sudo docker version

# Install helm
wget https://get.helm.sh/helm-v2.15.2-linux-amd64.tar.gz
tar -xvzf helm-v2.15.2-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
helm version

# Install Kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.8.1/kind-$(uname)-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
kind version

# Install Packer
wget https://releases.hashicorp.com/packer/1.5.6/packer_1.5.6_linux_amd64.zip
unzip packer_1.5.6_linux_amd64.zip
sudo mv packer /usr/local/bin/packer.io
packer.io version

# Install Terraform
wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip
unzip terraform_0.12.26_linux_amd64.zip
sudo mv terraform /usr/local/bin/
terraform version