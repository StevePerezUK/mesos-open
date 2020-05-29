### Function file for all ansible scripts

# Turn off hostchecking for builds
export ANSIBLE_HOST_KEY_CHECKING=False

function f_chdir
{
	cd /opt/$1	
}

function f_s3_deploy 
{ 
	aws s3 sync s3://mesos-build/$1 .
	chmod -R 0400 /opt/ansible
	
    for exfile in `ls *.sh`
    do
       chmod 0700 /opt/ansible/$exfile
   	   export newFileName=`echo $exfile	|sed -e "s/.sh//"`
   	   cp /opt/ansible/$exfile /bin/$newFileName 
	done
}

function f_add_key
{
	if [ ! -f /root/.ssh/mesos-key.pem ];then
		cp mesos-key.pem /root/.ssh/stevekey.pem
		chmod 0400 /root/.ssh/mesos-key.pem
	fi
	rm -rf /opt/ansible/mesos-key.pem	
	eval `ssh-agent`
	ssh-add /root/.ssh/mesos-key.pem
}
