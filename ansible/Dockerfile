FROM python:3.7

RUN apt-get update
RUN apt-get install -y vim sshpass
RUN useradd --create-home -p "deployer" deployer 
RUN ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa
RUN usermod -aG sudo deployer 
RUN apt-get install ansible -y
COPY script_init.sh /home/script_init.sh
RUN chmod +x /home/script_init.sh
USER deployer
RUN ssh-keygen -t rsa -N '' -f /home/deployer/.ssh/id_rsa

USER root
WORKDIR /tmp