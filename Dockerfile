# OS
FROM python:3.6-alpine3.8

RUN apk --update add --no-cache \
  openssh \
  gcc \
  python3-dev \
  musl-dev \
  libffi-dev \
  openssl-dev \
  libxml2-dev \
  libxslt-dev \
  git

WORKDIR /home
# Ansible Install
RUN git clone https://github.com/ansible/ansible.git

WORKDIR /home/ansible
RUN source hacking/env-setup

RUN pip3 install -r test/runner/requirements/units.txt

COPY ./entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]

