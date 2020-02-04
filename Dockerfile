FROM node:12-alpine

RUN apk --update add --no-cache bash openssh git

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
