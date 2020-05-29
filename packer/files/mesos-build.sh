#!/bin/bash
# Mesos build
if [ ! -f /opt/ansible/functions.sh ];then
	aws s3 cp s3://mesos-build/ansible/functions.sh /opt/ansible
fi

. /opt/ansible/functions.sh
f_chdir ansible
f_s3_deploy ansible
f_add_key

# run ansible
ansible-playbook -i /opt/ansible/mesos-inventory /opt/ansible/mesos.yml
