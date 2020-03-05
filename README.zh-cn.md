# aria2-ui
[![](https://images.microbadger.com/badges/version/huangzulin/aria2-ui.svg)](https://microbadger.com/images/huangzulin/aria2-ui "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/huangzulin/aria2-ui.svg)](https://microbadger.com/images/huangzulin/aria2-ui "Get your own image badge on microbadger.com")

[English](https://github.com/huangzulin/aria2-ui) | 简体中文

Aria2 with Aira-Ng web UI.

## 介绍
* 支持平台: `amd64`, `i386`, `arm64`, `arm/v7`, `arm/v6`.
* 基于最新的easypi/alpine-arm构建，镜像只有**20Mb**.
* 可自定义aria2配置.
* 使用对移动的更友好 Aria-Ng作为web ui.
* 使用darkhttpd作为http服务器, 更小(编译后只有 36K)更容易使用.

## 安装
1. 挂载 `/DOWNLOAD_DIR` 到 `/aria2/downloads` 并且挂载 `/CONFIG_DIR` 到 `/aria2/conf`.当容器启动时, 将创建  `aria2.conf`文件作为默认配置.
2. 端口映射:
  * 6800 aira2 jsonrpc端口
  * 80 Aria-Ng网页
  * 8080 用于浏览下载的文件
3. 使用 "SECRET" 设置rpc密钥, 其实将 `rpc-secret=xxx` 加入到 aira2.conf 文件中.

## 快速开始
```
docker run -d --name aria2-ui  --restart=always \
-p 6800:6800 -p 6880:80 -p 6888:81 \
-v /DOWNLOAD_DIR:/aria2/downloads \
huangzulin/aria2-ui
```
结束之后, 在浏览器打开 http://serverip:6880/ 访问 Aria-Ng 主页, 打开 http://serverip:6888/ 浏览下载文件夹.
