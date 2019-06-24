#!/bin/bash

## Dans le cas du lancement du playbook principal
# ansible-playbook -i inventory.ini playbooks/random-playbook.yml 

## Si on dev les playbooks avec le module check_mode: yes (not make any changes on remote systems).
## A utiliser par exemple pour tester les modules ansible, et appliquer des changements suivant le résulat : register
# ansible-playbook --check -i inventory.ini playbooks/random-playbook.yml

## Si on veut tester la syntaxe d'un des playbooks
resultsFolder="/home/gabyfulchic/.results/"
resultsFile="/home/gabyfulchic/.results/file"

sudo mkdir -p $resultsFolder &&\
	sudo touch $resultsFile &&\
	sudo chown gabyfulchic:admins -R $resultsFolder

echo 'stdout to resultsFile by >>' >> $resultsFile
# ansible samplehost --list-hosts
# ansible-playbook -i remote-hosts.ini --syntax-check --verbose ansible/playbooks/random-playbook.yml >> $resultsFile
