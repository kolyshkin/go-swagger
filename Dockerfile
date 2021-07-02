FROM golang:1.16-alpine AS base

FROM base AS build
ENV GO111MODULE=off
WORKDIR /go/src/github.com/go-swagger/go-swagger
COPY . .
RUN go build -o ./dist/swagger-musl -a -tags netgo -installsuffix netgo ./cmd/swagger

FROM alpine AS final
COPY --from=build /go/src/github.com/go-swagger/go-swagger/dist/swagger-musl /usr/bin/swagger
ENTRYPOINT ["/usr/bin/swagger"]
CMD ["--help"]
