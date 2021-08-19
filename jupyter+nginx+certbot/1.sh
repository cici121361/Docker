#!/bin/bash
# 检查docker和docker-compose

# 测试用的nginx,复制配置文件
docker pull nginx:latest
docker run -p 80:80 --name nginx-test -d nginx

# copy the configuration file to the host
mkdir nginx
docker cp nginx-test:/etc/nginx/conf.d ./nginx
docker cp nginx-test:/etc/nginx/nginx.conf ./nginx/nginx.conf

# uninstall nginx-test
docker stop nginx-test
docker rm nginx-test
