FROM golang:1.16 as builder

WORKDIR /app
ADD . /app
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"'

FROM busybox
COPY --from=builder /app/hello-world /app/hello-world
CMD ["/app/hello-world"]
