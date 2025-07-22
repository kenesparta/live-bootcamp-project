#!/bin/bash

function change_hostname() {
    hostnamectl set-hostname rust-live-project
    echo "rust-live-project" > /etc/hostname
    sed -i 's/127.0.0.1.*/127.0.0.1 localhost rust-live-project/' /etc/hosts
    sed -i 's/::1.*/::1 localhost6 localhost6.localdomain6 rust-live-project/' /etc/hosts
    systemctl restart systemd-hostnamed
}

function install_docker() {
  sudo yum install -y yum-utils device-mapper-persistent-data lvm2
  sudo yum install -y docker
  sudo systemctl start docker
  sudo systemctl enable docker
  sudo usermod -aG docker ec2-user
}

function install_nginx() {
  sudo yum install -y nginx
  sudo systemctl start nginx
  sudo systemctl enable nginx
}

sudo yum update -y
change_hostname
install_docker
install_nginx
