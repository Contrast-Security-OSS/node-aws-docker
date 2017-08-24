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
    && chmod 0744 /usr/local/bin/assume-role \
    && wget https://github.com/awslabs/aws-sam-local/releases/download/v0.2.0/sam_0.2.0_linux_amd64.tar.gz \
    && echo '1784bca0c9f29f4d3a57f095c7ebda701ddc0467  sam_0.2.0_linux_amd64.tar.gz' | sha1sum -c - \
    && tar -xzf sam_0.2.0_linux_amd64.tar.gz -C /usr/local/bin \
    && rm sam_0.2.0_linux_amd64.tar.gz

USER node
