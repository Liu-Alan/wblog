# 文件全部打包
FROM alpine

WORKDIR /data/www/wblog_docker
COPY wblog /wblog/
COPY conf/ /wblog/conf/
COPY sitedata/ /wblog/sitedata/
COPY static/ /wblog/static/
COPY views/ /wblog/views/
WORKDIR /wblog

RUN apk add -U tzdata
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && echo 'Asia/Shanghai' >/etc/timezone

EXPOSE 8090

ENTRYPOINT ["./wblog"]

# docker 常用命令
# docker build -t wblog:v1.0 .
# docker run -d -p 8090:8090 --name wblog wblog:v1.0
# docker ps -a
# docker start/stop/restart
# docker rm
# docker rmi
# docker inspect
# docker exec -it CONTAINER_ID sh
# ifconfig eth0
# date


# 静态文件映射到宿主机本地
FROM alpine

WORKDIR /data/www/wblog_docker
COPY wblog /wblog/
WORKDIR /wblog

RUN apk add -U tzdata
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && echo 'Asia/Shanghai' >/etc/timezone

EXPOSE 8090

ENTRYPOINT ["./wblog"]

# docker build -t wblog:v1.0 .
# docker run -v /data/www/wblog_docker/conf:/wblog/conf -v /data/www/wblog_docker/sitedata:/wblog/sitedata -v /data/www/wblog_docker/static:/wblog/static -v /data/www/wblog_docker/views:/wblog/views -v /data/www/wblog_docker/log:/wblog/log -d -p 8090:8090 --name wblog wblog:v1.0 