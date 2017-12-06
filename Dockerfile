FROM ubuntu:16.04

MAINTAINER Pierre-Yves Guerder <pierreyves.guerder@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common python-software-properties build-essential curl git unzip mcrypt wget openssl ssh autoconf g++ make locales --no-install-recommends && \
    rm -r /var/lib/apt/lists/* && \
    apt-get --purge autoremove -y

ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8
RUN locale-gen en_US.UTF-8

RUN add-apt-repository -y ppa:ondrej/php && \
    DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y -qq composer sudo apache2 libapache2-mod-php5.6 npm mysql-server php5.6-dev php5.6-zip php5.6-xml php5.6-mbstring php5.6-curl php5.6-json php5.6-mysql php5.6-tokenizer php5.6-cli php5.6-imap php5.6-intl php5.6-gd && \
    apt-get remove --purge php7.1-common -y
