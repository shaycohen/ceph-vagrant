#!/bin/bash
NODES="deploy mon1 osd1 osd2 osd3"
OSDS="osd1 osd2 osd3"
PKGS="ceph-deploy"

ceph-deploy purge $NODES
ceph-deploy purgedata $NODES
ceph-deploy forgetkeys


yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
cp /vagrant/provision/ceph.repo /etc/yum.repos.d/
for PKG in $PKGS
do
	rpm -V $PKG || { 
		yum -y update
		yum -y install $PKGS
	}
done

for NODE in $NODES
do
	ssh-keyscan $NODE >> ~ceph-user/.ssh/known_hosts
done

ceph-deploy new mon1
cp -f /vagrant/provision/ceph.conf ~ceph-user/
ceph-deploy install deploy mon1 osd1 osd2 osd3
ceph-deploy mon create-initial

for NODE in $OSDS
do
	for N in 1 2 3
	do
		ssh $NODE sudo mkdir /var/local/${NODE}${N}
		ceph-deploy --overwrite-conf osd prepare $NODE:/var/local/${NODE}${N}
		ssh $NODE sudo chown -R ceph:ceph /var/local/${NODE}${N}
		ceph-deploy --overwrite-conf osd activate $NODE:/var/local/${NODE}${N}
	done
done

ceph-deploy admin $NODES
sudo chmod +r /etc/ceph/ceph.client.admin.keyring
