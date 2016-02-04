FROM soriyath/debian-postgresql94
MAINTAINER Sumi Straessle

# NODEJS 5.5
RUN	DEBIAN_FRONTEND=noninteractive set -ex \
	&& apt-get update \
	&& apt-get install -y wget build-essential
WORKDIR /usr/local/src
RUN DEBIAN_FRONTEND=noninteractive wget https://nodejs.org/dist/v5.5.0/node-v5.5.0.tar.gz \
	&& tar -xzvf node-v5.5.0.tar.gz && rm -f node-v5.5.0.tar.gz \
	&& cd node-v5.5.0 \
	&& ./configure \
	&& make \
	&& make install
RUN DEBIAN_FRONTEND=noninteractive apt-get clean \
	&& apt-get remove build-essential \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /srv/www
