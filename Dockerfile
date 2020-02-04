FROM node:12-alpine

RUN apk --update add --no-cache openssh git
RUN ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
