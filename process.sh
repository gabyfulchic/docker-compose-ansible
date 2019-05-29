#/bin/env bash

logfile="/tmp/process-error.log"
touch $logfile
echo "[`date +"%d-%m-%Y %T"`]" >> $logfile

if [ $UID -ne 42 ];
then
	echo "Hum it seems that your user is the wrong." >> $logfile
	exit 1
else
	echo "User is OK." >> $logfile
fi

ansible --help
if [ $? -ne 0 ];
then
	echo "Ansible is not well installed in the container." >> $logfile
	exit 1
else
	echo "Ansible is successfully working." >> $logfile
fi

# Dans le cas de l'ajustement des templates de mail 3CX
# ansible-playbook -i remote-hosts.ini playbooks/playbook-3cxtemplates.yml 

# Si on dev les playbooks avec le module check_mode: yes (not make any changes on remote systems)
# A utiliser par exemple pour tester les modules ansible, et appliquer des changements suivant le résulat : register.
# ansible-playbook --check -i remote-hosts.ini playbooks/playbook-3cxtemplates.yml

# Si on veut tester la syntaxe plus généralement
ansible-playbook --syntax-check --verbose playbooks/playbook-3cxtemplates.yml >> $logfile


