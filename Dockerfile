FROM ubuntu:xenial

ADD https://deb.nodesource.com/setup_6.x /tmp/source/setup_6.x

RUN apt-get update && \
  cd /tmp/source && cat setup_6.x | bash - && \
  apt-get install -y nodejs && apt-get install -y build-essential && \
  rm -rf /tmp/source_6.x && apt-get clean && rm -rf /var/cache/apk/* && \
  mkdir -p /var/www

WORKDIR /var/www

VOLUME [/var/www /var/lib/library]

CMD ["npm", "start"]

EXPOSE 3000
