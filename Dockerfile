## Dockerfile
# 第一層基底
FROM golang:1.11.2-alpine AS build
RUN ls
RUN pwd
# 複製原始碼
COPY . /go/src/Project
WORKDIR /go/src/Project
RUN pwd
# 進行編譯(名稱為：project)
RUN go build -o project

# 最終運行golang 的基底
FROM alpine
RUN ls
RUN pwd
COPY --from=build /go/src/Project/project /app/project
WORKDIR /app
RUN pwd
ENTRYPOINT [ "./project" ]
