# aria2-ui
[![](https://images.microbadger.com/badges/version/huangzulin/aria2-ui.svg)](https://microbadger.com/images/huangzulin/aria2-ui "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/huangzulin/aria2-ui.svg)](https://microbadger.com/images/huangzulin/aria2-ui "Get your own image badge on microbadger.com")

English | [简体中文](https://github.com/huangzulin/aria2-ui/blob/master/README.zh-cn.md)

Aria2 with Aira-Ng web UI.



## Brief Introduction
* Supported platforms: `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`.
* Use Apline:latest as base image, full image only **20Mb**.
* You can edit aria2 config file out of the image.
* Use Aria-Ng as aria2 web ui, it seems much more beautiful.
* Use darkhttpd as http server, it's very small(Only 36K after complied) and easy to use.

## Install
1. Mount `/DOWNLOAD_DIR` to `/aria2/downloads` and `/CONFIG_DIR` to `/aria2/conf`. When starting container, it will create  `aria2.conf` file with default settings.
2. Mapping ports:
  * 6800 for aira2 service
  * 80 for Aria-Ng http service
  * 8080 for downloads directory http service
3. Set your secret code use "SECRET" variable, this will append `rpc-secret=xxx` to aira2.conf file.

Run command like below(You may need to change the ports).
```
docker run -d --name aria2-ui \
-p 6800:6800 -p 6880:80 -p 6888:8080 \
-v /DOWNLOAD_DIR:/aria2/downloads \
-v /CONFIG_DIR:/aria2/conf \
huangzulin/aria2-ui
```
After finished, open http://serverip:6880/ in your browser for visiting Aria-Ng home page, open http://serverip:6888/ to browser your downloads folder.
