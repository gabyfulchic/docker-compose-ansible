# Docker-compose-ansible (In Development)  
[![License](https://img.shields.io/badge/License-Unlicense-yellow.svg)](https://github.com/gabyfulchic/docker-compose-ansible/blob/master/LICENSE)  
```
> Déploiement d'un serveur Ansible conteneurisé avec Docker-compose.
> Docker-compose étant une surcouche à la cmd Docker pour run des
> containers depuis un fichier .yaml/.yml avec une simple commande.
```  

# Utilisation du repo

- first :
```ruby  
> git clone https://github.com/gabyfulchic/docker-compose-ansible.git
```  

- second :
```ruby   
> cd docker-compose-ansible/  
> docker-compose up -d
```  

- reBuild [optional] :
- Only if you already UPed the project and changed the Dockerfile or ToBuild/ files
```ruby
> cd docker-compose-ansible/
> docker-compose up --build -d
```  

- third :
```
Félicitations, vous avez un conteneur ansible-server qui tourne sous 
Debian Stretch avec python3-6-8. A vos configs d'ansible Messieurs. 🤗
```  
