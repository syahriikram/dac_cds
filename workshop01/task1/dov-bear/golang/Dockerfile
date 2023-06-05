ARG ALPHINE_VERSION=3.17
ARG GO_VERSION=1.20-alpine3.17


# this has the GO build tools
FROM golang:${GO_VERSION} AS builder

WORKDIR /app

COPY go.mod .
COPY go.sum .
COPY main.go .

RUN go build -o main .

# this container DOES NOT need the BUILDING - just use the alphine to boot it up!
FROM alpine:${ALPHINE_VERSION}

RUN apk update && apk add curl

WORKDIR /app

# copy from old container to this container
COPY --from=builder /app/main .
COPY public public
COPY templates templates

ENV PORT=3000 INSTANCE_NAME=go-dov-bear GIN_MODE=release

EXPOSE ${PORT}

HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
    CMD curl http://localhost:${PORT}/healthz || exit 1

ENTRYPOINT /app/main 