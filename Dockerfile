FROM node:12-alpine

RUN adduser -D myuser
RUN apk --update add --no-cache bash openssh-client git

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
