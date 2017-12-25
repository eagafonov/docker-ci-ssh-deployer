FROM alpine:3.7
MAINTAINER e.a.agafonov@gmail.com

RUN apk add --no-cache \
    openssh \
    bash \
    git

ADD entrypoint.sh /
ENTRYPOINT /entrypoint.sh
