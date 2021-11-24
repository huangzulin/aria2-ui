FROM alpine

LABEL MAINTAINER="huangzulin"

RUN apk add --no-cache curl aria2 darkhttpd \
	&& mkdir -p /aria2/conf /aria2/downloads /ariang \
	&& wget --no-check-certificate   -O ariang.zip \
	&& unzip ariang.zip -d /ariang \
	&& rm -rf ariang.zip

COPY init.sh /aria2/init.sh
COPY conf /aria2/conf

RUN chmod +x /aria2/init.sh

WORKDIR /
VOLUME ["/aria2/conf", "/aria2/downloads"]
EXPOSE 6800 80 8080

CMD ["/aria2/init.sh"]
