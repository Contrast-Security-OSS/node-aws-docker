FROM node:8

RUN set -ex \
    && apt-get update \
    && apt-get install -y \
        python-setuptools \
        python-dev \
    && easy_install pip \
    && pip install awscli \
    && wget -O /usr/local/bin/assume-role https://github.com/remind101/assume-role/releases/download/0.3.2/assume-role-Linux \
    && echo 'cc41ea5de3e27557481c74efacc368c8a8786e65  /usr/local/bin/assume-role' | sha1sum -c - \
    && chmod 0744 /usr/local/bin/assume-role