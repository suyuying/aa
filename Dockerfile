# 第一層基底
FROM golang:1.17-alpine AS build

# 複製原始碼
COPY . /go/src/HelloWorlld
WORKDIR /go/src/HelloWorlld

# 進行編譯(名稱為：Hello-World)
RUN go mod init Hello-World

# 最終運行golang 的基底
FROM alpine

COPY --from=build /go/src/HelloWorlld/Hello-World /app/Hello-World
WORKDIR /app

ENTRYPOINT [ "./Hello-World" ]
