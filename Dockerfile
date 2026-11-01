# syntax=docker/dockerfile:1

ARG GO_VERSION=1.27.3
ARG ALPINE_VERSION=3.24

FROM --platform=$BUILDPLATFORM golang:${GO_VERSION}-alpine${ALPINE_VERSION} AS builder

WORKDIR /src

RUN apk add --no-cache ca-certificates

COPY go.mod go.sum ./
RUN go mod download

COPY files/ ./files/

ARG TARGETOS
ARG TARGETARCH

RUN CGO_ENABLED=0 \
    GOOS=${TARGETOS:-linux} \
    GOARCH=${TARGETARCH:-amd64} \
    go build \
      -trimpath \
      -buildvcs=false \
      -ldflags="-s -w" \
      -o /out/docker-proxy-acl \
      ./files

FROM scratch

COPY --from=builder /out/docker-proxy-acl /docker-proxy-acl

ENV OPTIONS="-a containers"

ENTRYPOINT ["/docker-proxy-acl"]
