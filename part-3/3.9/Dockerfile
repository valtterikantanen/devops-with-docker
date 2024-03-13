FROM golang:1.16-alpine as build-stage

WORKDIR /usr/src/app

COPY . .

RUN CGO_ENABLED=0 go build

RUN adduser -D appuser


FROM scratch

COPY --from=build-stage /usr/src/app/server .
COPY --from=build-stage /etc/passwd /etc/passwd

USER appuser

EXPOSE 8080

CMD ["./server"]