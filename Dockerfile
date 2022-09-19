FROM golang:1.19.1-alpine3.16 as builder

WORKDIR /src

COPY main.go src/

RUN go build src/main.go


FROM scratch

COPY --from=builder src/main .

CMD [ "./main" ]