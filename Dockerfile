FROM golang:1.14-alpine AS build-env
RUN /bin/sed -i 's,http://dl-cdn.alpinelinux.org,https://mirrors.aliyun.com,g' /etc/apk/repositories
WORKDIR /go/src/app
COPY . .
ENV  GO111MODULE=on
ENV  GOPROXY=https://goproxy.cn
RUN apk update && apk add git \
    && go build -o ./plugin/greeter ./plugin/greeter_impl.go && go build -o basic .

FROM alpine:latest
RUN /bin/sed -i 's,http://dl-cdn.alpinelinux.org,https://mirrors.aliyun.com,g' /etc/apk/repositories
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
COPY --from=build-env /go/src/app/basic .
COPY --from=build-env /go/src/app/plugin/greeter ./plugin/
ENTRYPOINT [ "./basic" ]
