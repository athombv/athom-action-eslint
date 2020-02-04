FROM node:12-alpine

RUN apk --update add --no-cache openssh git-core
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
