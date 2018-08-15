# Aria2-AriaNg-pi
[![](https://images.microbadger.com/badges/version/huangzulin/aria2-ariang-pi.svg)](https://microbadger.com/images/huangzulin/aria2-ariang-pi "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/huangzulin/aria2-ariang-pi.svg)](https://microbadger.com/images/huangzulin/aria2-ariang-pi "Get your own image badge on microbadger.com")

[English](https://github.com/huangzulin/aria2-ariang-pi) | 简体中文

Aria2 with Aira-Ng web UI.

## 介绍
* 基于最新的easypi/alpine-arm构建，镜像只有**18Mb**.
* 可自定义aria2配置.
* 使用对移动的更友好 Aria-Ng作为web ui.
*  使用darkhttpd作为http服务器, 更小(编译后只有 36K)更容易使用.

## 构建
```
git clone https://github.com/huangzulin/aria2-ariang-pi.git
cd aria2-ariang-pi
chmod +x init.sh
docker build -t huangzulin/aria2-ariang-pi .
```

## 安装
1. 挂载 `/DOWNLOAD_DIR` 到 `/aria2/downloads` 并且挂载 `/CONFIG_DIR` 到 `/aria2/conf`.当容器启动时, 将创建  `aria2.conf`文件作为默认配置.
2. 端口映射:
  * 6800 aira2 jsonrpc端口
  * 80 Aria-Ng网页
  * 8080 用于浏览下载的文件
3. 使用 "SECRET" 设置rpc密钥, 其实将 `rpc-secret=xxx` 加入到 aira2.conf 文件中.

执行一下命令(请根据实际情况修改端口及密钥).
```
docker run -d --name aria2-ariang-pi \
-p 6800:6800 -p 6880:80 -p 6888:8080 \
-v /DOWNLOAD_DIR:/aria2/downloads \
-v /CONFIG_DIR:/aria2/conf \
-e SECRET=YOUR_SECRET_CODE huangzulin/aria2-ariang-pi
```
结束之后, 在浏览器打开 http://serverip:6880/ 访问 Aria-Ng 主页, 打开 http://serverip:6888/ 浏览下载文件夹.

参考: https://github.com/colinwjd/aria2-ariang
