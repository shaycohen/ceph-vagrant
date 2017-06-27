#!/bin/bash
PKGS="ntp ntpdate ntp-doc openssh-server yum-plugin-priorities"

for PKG in $PKGS
do
	rpm -V $PKG || { 
		yum -y update
		yum -y install $PKGS
	}
done

useradd -m -G wheel ceph-user 
[[ -e ~ceph-user/.ssh ]] || mkdir ~ceph-user/.ssh
cat /vagrant/provision/hosts >> /etc/hosts
cp -rf /vagrant/provision/ceph.sudoers /etc/sudoers.d/ceph
cp -rf /vagrant/provision/dotSsh/* ~ceph-user/.ssh
chown -R ceph-user:ceph-user ~ceph-user/.ssh
chmod 700 ~ceph-user/.ssh
setenforce 0
