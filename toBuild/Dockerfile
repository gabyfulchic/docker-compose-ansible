FROM python:3.6.8-stretch
MAINTAINER Gaby Fulchic <gaby.fulchic@ynov.com>

## Pre-requis
RUN apt-get update -y && apt-get upgrade -y &&\
 apt-get install ca-certificates sudo -y &&\
 apt install apt-utils -y

## Configuration utilisateur
RUN groupadd admins &&\
 useradd -m -G admins gabyfulchic --password gabyfulchic --uid 42

## Sudo conf
ADD sudoers.d/admins /etc/sudoers.d/

## Conf de l'environnement
USER gabyfulchic
WORKDIR /home/gabyfulchic

## Dossiers utiles
RUN mkdir -p /home/gabyfulchic/ansible/ &&\
 mkdir -p /home/gabyfulchic/.ssh/ &&\
 mkdir -p /home/gabyfulchic/.environment/

## Si des playbooks en plus : les rajouter dans le bon dossier
ADD playbooks /home/gabyfulchic/ansible/playbooks/
ADD ./ansible.cfg /home/gabyfulchic/ansible
ADD ./inventory.ini /home/gabyfulchic/ansible
ADD ./process.sh /home/gabyfulchic/

## Configuration utilisateur v2
RUN sudo usermod --shell /bin/bash gabyfulchic &&\
 sudo chmod +x /home/gabyfulchic/process.sh

## Si : Paire de clé déja existante
# COPY rsa_keys /home/gabyfulchic/.ssh/

## Install the binary ansible (APT)
# RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list &&\
#    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 &&\
#    apt update -y && apt install ansible -y 

## Install the binary ansible (PIP)
RUN sudo pip install ansible
RUN { echo " - hostname: `hostname`"; \
 echo " - user: `whoami`"; \
 echo " - PYTHON -V : `python -V`"; \
 echo " - PIP -V : `pip --version`"; \
 echo " - ANSIBLE INFOS >"; \
 echo "   `ansible --version`"; } > /home/gabyfulchic/.environment/versions

## Accés au fichier d'info rapidement
ENV envContext="/home/gabyfulchic/.environment/versions"

## Lancement du script de test de syntaxe des playbooks
# ENTRYPOINT 
CMD ["/bin/bash", "/home/gabyfulchic/process.sh"]
