FROM nginx:alpine

RUN apk update
RUN apk add python3 ca-certificates
RUN ln -sf /usr/bin/python3 /usr/bin/python
RUN mkdir -pv /etc/ssl/private
