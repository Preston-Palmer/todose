FROM alpine:latest

LABEL VENDOR="Preston Palmer"
LABEL MAINTAINER="Preston Palmer <preston@swau.edu>"
LABEL DESCRIPTION="Built by me?"
LABEL VERSION="1.0.0"

RUN apk update && apk upgrade \
  && apk add ca-certificates \
  && rm -rf /var/cache/apk/*

RUN apk add --update tzdata
ENV TZ=America/Chicago
RUN rm -rf /var/cache/apk/*

COPY todose /app
COPY settings.yml /
COPY web/dist /web/dist

ENTRYPOINT [ "/app" ]