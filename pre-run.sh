#!/bin/bash

echo -n "Enter in an ip address within range 192.168.56.0/21: "
read ipaddr

sed -i 's/###.###.##.#/${ipaddr}/g' Vagrantfile


PS3="Choose the shell, you're using: "
options=("Bash" "Zsh")
select shell in "${options[@]}";do
  case $shell in
    "Bash")
      cat << EOF >> ~/.bashrc
      export DOCKER_HOST='tcp://${ipaddr}:2375'
      export DOCKER_TLS_VERIFY=
      EOF

    "Zsh")
      cat << EOF >> ~/.zshrc
      export DOCKER_HOST='tcp://${ipaddr}:2375'
      export DOCKER_TLS_VERIFY=
      EOF
  esac
done

 #alias docker-up='vagrant up $(vagrant global-status | grep docker.local | cut -f 1 -d " ")'
 #alias docker-down='vagrant halt $(vagrant global-status | grep docker.local | cut -f 1 -d " ")'
 #alias docker-status='vagrant global-status | grep docker.local | cut -f 5 -d " "'
 #alias docker-reload='vagrant reload $(vagrant global-status | grep docker.local | cut -f 1 -d " ")'
