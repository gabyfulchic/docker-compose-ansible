#/bin/env bash

# Some tests

logfile="/tmp/process-error.log"
touch $logfile
echo "[`date +"%d-%m-%Y %T"`]" >> $logfile

if [ $UID -ne 42 ];
then
	echo "Hum it seems that your user is the wrong." >> $logfile
else
	echo "User is OK." >> $logfile
fi

ansible --help
if [ $? -ne 0 ];
then
	echo "Ansible is not well installed in the container." >> $logfile
else
	echo "Ansible is successfully working." >> $logfile
fi

# Dans le cas de l'ajustement des templates de mail 3CX
# ansible-playbook -i remote-hosts.ini playbooks/playbook-3cxtemplates.yml 

