FROM node:12-alpine

RUN adduser -r -u 1001 myuser

RUN apk --update add --no-cache bash openssh-client git

USER myuser

RUN mkdir -m 700 /root/.ssh; \
  touch -m 600 /root/.ssh/known_hosts; \
  ssh-keyscan github.com > /root/.ssh/known_hosts

RUN mkdir -p -m 0600 ~/.ssh && \
  ssh-keyscan github.com >> ~/.ssh/known_hosts

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
