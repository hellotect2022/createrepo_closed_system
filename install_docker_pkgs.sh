#!/bin/sh

rpm -ivh "$(pwd)"/createrepo/*
cd "$(pwd)"/docker_pkgs 
createrepo .


echo -e "[dh_docker_ce]\nname=dh_docker_ce\nbaseurl=file://"$(pwd)"\ngpgcheck=0\nenabled=1\nmodule_hotfixes=1" 1> /etc/yum.repos.d/dh_docker_ce.repo

yum install -y docker-ce docker-ce-cli containerd.io --disablerepo=* --enablerepo=dh_docker_ce