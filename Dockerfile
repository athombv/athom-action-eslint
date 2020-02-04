FROM node:12-alpine

RUN adduser -D myuser
RUN apk --update add --no-cache bash openssh-client git
RUN mkdir -m 700 /root/.ssh; \
  touch -m 600 /root/.ssh/known_hosts; \
  ssh-keyscan github.com > /root/.ssh/known_hosts
RUN touch /root/.ssh/config 
COPY config /root/.ssh/config
RUN chmod 400 /root/.ssh/config

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
