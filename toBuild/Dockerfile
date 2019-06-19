FROM python:3.6.8-stretch
MAINTAINER Gaby Fulchic <gaby.fulchic@ynov.com>

## Pre-requis
RUN apt-get update -y && apt-get upgrade -y &&\
 apt-get install ca-certificates sudo -y &&\
 apt install apt-utils -y

## Configuration utilisateur
RUN groupadd admins &&\
 useradd -m -G admins gabyfulchic -p gabyfulchic --uid 42 &&\
 usermod --shell /bin/bash gabyfulchic

## Push sudoer file
COPY admins /etc/suoders.d/

## Dossiers utiles
RUN mkdir -p /home/gabyfulchic/ansible/ && mkdir -p /home/gabyfulchic/.ssh/

## Accés au fichier d'info rapidement
ENV envContext="/home/gabyfulchic/.environment/versions"

USER gabyfulchic
WORKDIR /home/gabyfulchic

## Si des playbooks en plus : les rajouter dans le bon dossier
ADD playbooks /home/gabyfulchic/ansible/playbooks
## Si : Paire de clé déja existante
# COPY rsa_keys /home/gabyfulchic/.ssh/

## Install the binary ansible (APT)
# RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list &&\
#    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 &&\
#    apt update -y && apt install ansible -y 

## Install the binary ansible (PIP)
RUN pip install ansible

RUN { hostname; \
 whoami; \
 echo $UID; \
 echo $SHELL; \
 python -V; \
 pip --version; \
 ansible --version; } > /home/easylia/.environment/versions

ENTRYPOINT /bin/sh
CMD process.sh