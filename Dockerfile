FROM alpine

LABEL MAINTAINER="huangzulin"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk update \
	&& apk add --no-cache --update aria2 darkhttpd \
	&& mkdir -p /aria2/conf /aria2/downloads aria-ng \
	&& wget --no-check-certificate https://github.com/mayswind/AriaNg/releases/download/1.1.4/AriaNg-1.1.4-AllInOne.zip -O ariang.zip \
	&& unzip ariang.zip -d /aria-ng \
	&& rm -rf ariang.zip

COPY init.sh /aria2/init.sh
COPY conf /aria2/conf

RUN chmod +x /aria2/init.sh

WORKDIR /
VOLUME ["/aria2/conf", "/aria2/downloads"]
EXPOSE 6800 80 8080

CMD ["/aria2/init.sh"]
