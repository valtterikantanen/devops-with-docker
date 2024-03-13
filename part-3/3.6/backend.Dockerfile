FROM golang:1.16

WORKDIR /usr/src/app

COPY . .

RUN go build && \
  useradd appuser

USER appuser

EXPOSE 8080

CMD ["./server"]