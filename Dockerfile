## Dockerfile
# 第一層基底
FROM golang:1.11.2-alpine AS build
# 複製原始碼
COPY . /go/src/Project
WORKDIR /go/src/Project
# 進行編譯(名稱為：project)
RUN go build -o json
# 最終運行golang 的基底
FROM alpine
COPY --from=build /go/src/Project/json /app/json
WORKDIR /app
ENTRYPOINT [ "./json" ]
