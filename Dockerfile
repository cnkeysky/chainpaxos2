From ubuntu:22.04

WORKDIR /root/chainpaxos

ADD ./apache-zookeeper-3.7.0-bin ./apache-zookeeper-3.7.0-bin
ADD ./client ./client
ADD ./server ./server
ADD ./zkOriginal ./zkOriginal
RUN mkdir logs
RUN apt-get clean all -y
RUN apt-get update -y
RUN apt-get install -y openjdk-17-jdk openssh-server
#RUN apt-get install -y openjdk-17-jdk openssh-server  procps inetutils-ping

RUN echo 'root:root'|chpasswd
RUN apt-get clean
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

ENTRYPOINT ["/bin/bash"]
