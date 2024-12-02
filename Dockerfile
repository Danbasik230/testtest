FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    openssh-server \
    python3 \
    python3-pip \
    python3-venv \
    python3-six \
    python3-cryptography \
    python3-pycryptodome \
    python3-setuptools \
    python3-cffi \
    python3-apt \
    git \
    sudo \
    zsh \
    curl \
    systemctl \
    && apt-get clean

RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
RUN mkdir /root/.ssh
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8G/1O3GME+cOHnbGFQf0z8/9LyHWUTF7KbECUDq8y2/FmApChcIBbnHhH966lu4jt3BKKTDtP6b7Uy/zv1AGachGALeIYPAGaXQsox9DqRy/cIaspSdt04NWQoqv21DmCnrZ0tT/+VFTKu3krM63ZDonSntTuuSiZL30fh7XA461j8TqY4dy5JRvIs9Y2F4qikSPQa3xPYmL66ARNdC7IsHtK6YDv0U4u3LXA120wfQO6st8Z9PDA+OIORmVwWFkvSQA44bcaJUpEFxw+h4xqvhW9tf7K8m3xjv/3shTnwAkGLM/vo8Z5pFyvUsr8xjb9OdZ4Vb+xGGgB1B4d71Xj root@ip-172-31-42-139" >> /root/.ssh/authorized_keys

RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install six cryptography pycryptodome setuptools cffi && \
    echo "export PATH=/opt/venv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" >> /root/.bashrc

EXPOSE 22
EXPOSE 80

CMD ["/bin/bash", "-c", "sleep 5 && /usr/sbin/sshd -D"]
