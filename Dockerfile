FROM alpine

WORKDIR $GOPATH/src/wblog
COPY wblog /wblog/
COPY conf/ /wblog/conf/
COPY static/ /wblog/static/
COPY views/ /wblog/views/
WORKDIR /wblog/

RUN apk add -U tzdata
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && echo 'Asia/Shanghai' >/etc/timezone

EXPOSE 8090

ENTRYPOINT ["./wblog"]

# docker 常用命令
# docker build -t wblog_docker:v1.0 .
# docker run -d -p 8090:8090 --name wblog_docker wblog_docker:v1.0
# docker ps -a
# docker stop
# docker rm
# docker rmi
# docker exec -it CONTAINER_ID sh
# ifconfig eth0
# date