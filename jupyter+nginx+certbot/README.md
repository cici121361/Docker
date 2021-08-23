- 本docker-compose.yml将搭建自己的jupyterlab，并采用nginx+certbot的方式配置域名和证书，方便在不同的设备上都能编写。
### 具体步骤：
1. 安装docker和docker-compose(推荐网上的安装脚本，下载即用)，并将当前用户加入docker组中。
2. clone这整个文件夹
```{sh}
git clone http://github.com/cici121361/Docker/jupyter+nginx+certbot
```
3. 运行脚本1.sh
4. 运行docker-compose.yml
```{linux}
docker-compose up
```
5. 配置nginx容器配置文件，将本地端口与域名重定向
6. 运行2.sh
