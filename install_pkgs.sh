#!/bin/sh

rpm -ivh "$(pwd)"/createrepo/*
cd "$(pwd)" 
createrepo .


echo -e "[dh_repo]\nname=dh_repo\nbaseurl=file://"$(pwd)"\ngpgcheck=0\nenabled=1" 1> /etc/yum.repos.d/dh_repo.repo

yum install -y screen htop tar createrepo zip unzip vim --disablerepo=* --enablerepo=dh_repo