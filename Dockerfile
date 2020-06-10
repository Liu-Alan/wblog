FROM scratch

WORKDIR $GOPATH/src/wblog
COPY wblog /
COPY conf/ /conf/
COPY static/ /static/
COPY views/ /views/
WORKDIR /

EXPOSE 8090

ENTRYPOINT ["./wblog"]

# docker 常用命令
# docker build -t wblog_docker:v1.0 .
# docker run -d -p 8090:8090 --name wblog_docker wblog_docker:v1.0
# docker ps -a
# docker stop
# docker rm
# docker rmi
