FROM node:12-alpine

RUN apk --update add --no-cache bash openssh git && ssh-keyscan github.com > ~/.ssh/known_hosts
RUN adduser -D myuser

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
