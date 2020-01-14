#!/bin/bash

sshpass -p "toor" ssh-copy-id -o StrictHostKeyChecking=no root@cible
sshpass -p 'toor' ssh-copy-id -o StrictHostKeyChecking=no -i /home/deployer/.ssh/id_rsa.pub root@cible