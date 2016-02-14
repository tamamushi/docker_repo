FROM centos:6.7

ENV USERNAME vagrant
ENV UHOME /home/$USERNAME

## create default user
RUN /usr/sbin/useradd -d /home/vagrant -s /bin/bash vagrant
RUN echo "$(echo $USERNAME):$(echo $USERNAME)" | chpasswd
RUN echo "root:$(echo $USERNAME)" | chpasswd

RUN yum -y install initscripts MAKEDEV
RUN yum check
RUN yum -y update
RUN yum -y install passwd openssl openssl-devel openssh openssh-clients openssh-server vim python-setuptools

## Install & configuration supervisor and sshd
RUN easy_install supervisor
RUN mkdir -p /etc/supervisord/conf/
ADD supervisord /etc/init.d/supervisord
ADD service.conf /etc/supervisord/conf/service.conf

RUN /etc/init.d/sshd start
RUN /etc/init.d/sshd stop

RUN touch /etc/supervisord.conf
RUN echo "[include]" >> /etc/supervisord.conf
RUN echo "files = supervisord/conf/*.conf" >> /etc/supervisord.conf
RUN chmod 755 /etc/init.d/supervisord
RUN sed -ri 's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config 

## Install Developer tools
RUN yum -y install gcc git rsync tar readline-devel zlib-devel libffi-devel
RUN yum -y install patch wget unzip curl grep bison libcurl-devel
RUN yum -y install bzip2 bzip2-devel sqlite sqlite-devel sudo

## sudo user setting
RUN sed -ri 's/^Defaults[ \s\t]+requiretty/#Defaults   requiretty/' /etc/sudoers 

## pyenv and python install
ADD pyenv.sh /etc/profile.d/pyenv.sh
ADD python_install_by_pyenv.sh /tmp/python_install_by_pyenv.sh
RUN /bin/sh /tmp/python_install_by_pyenv.sh $(echo $USERNAME) $(echo $UHOME) 2.7.3
RUN rm /tmp/python_install_by_pyenv.sh

## rbenv install
ADD rbenv.sh /etc/profile.d/rbenv.sh
ADD ruby_install_by_rbenv.sh /tmp/ruby_install_by_rbenv.sh
RUN /bin/sh /tmp/ruby_install_by_rbenv.sh $(echo $USERNAME) $(echo $UHOME) 2.2.3
RUN rm /tmp/ruby_install_by_rbenv.sh

EXPOSE 22
CMD /sbin/init
