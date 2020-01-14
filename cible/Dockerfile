FROM ubuntu:16.04

RUN apt-get update && apt-get install -y openssh-server
RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip
RUN mkdir /var/run/sshd
RUN echo 'root:toor' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN useradd --create-home -p "deployer" deployer
RUN usermod -aG sudo deployer

RUN mkdir /root/.ssh && mkdir /home/deployer/.ssh

EXPOSE 2222
CMD ["/usr/sbin/sshd", "-D"]
