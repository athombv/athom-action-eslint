FROM node:12-alpine

RUN adduser -D myuser
RUN apk --update add --no-cache bash openssh git && ssh-keyscan github.com > ~/.ssh/known_hosts

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
