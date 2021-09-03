## Dockerfile
# 第一層基底
FROM alpine
COPY ./project /app/project
WORKDIR /app
ENTRYPOINT [ "./project" ]
