#/bin/env bash

## Dans le cas du lancement du playbook principal
# ansible-playbook -i remote-hosts.ini playbooks/random-playbook.yml 

## Si on dev les playbooks avec le module check_mode: yes (not make any changes on remote systems).
## A utiliser par exemple pour tester les modules ansible, et appliquer des changements suivant le résulat : register
# ansible-playbook --check -i remote-hosts.ini playbooks/random-playbook.yml

## Si on veut tester la syntaxe d'un des playbooks
resultsFile="/home/gabyfulchic/.results/file"
mkdir -p $resultsFile
echo "stdout to resultsFile by >>" >> $resultsFile
ansible-playbook --syntax-check --verbose playbooks/random-playbook.yml >> $resultsFile
echo "stdout to resultsFile by | tee" >> $resultsFile
ansible-playbook --syntax-check --verbose playbooks/random-playbook.yml | tee $resultsFile
 
