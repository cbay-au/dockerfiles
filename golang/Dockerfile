# Dockerfile builds a golang docker image within a bash shell
# docker build -t go_image .
# docker run -it go_image:latest bash
# go version 


FROM ubuntu:latest

# Update and install necessary packages
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  bash \
  curl \
  wget \
  git \
  ca-certificates \
  --no-install-recommends && \
  rm -rf /var/lib/apt/lists/*

# Environment variables
ENV GOLANG_VERSION 1.21.5

# Set the URL for downloading Go
ENV GO_DOWNLOAD_URL https://go.dev/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz

# Attempt to download Go with retries
RUN set -x && \
    retry_count=3 && \
    while [ $retry_count -gt 0 ]; do \
        wget -q --no-check-certificate "$GO_DOWNLOAD_URL" && \
        tar -C /usr/local -xzf go${GOLANG_VERSION}.linux-amd64.tar.gz && \
        rm go${GOLANG_VERSION}.linux-amd64.tar.gz && \
        break || echo "Download failed. Retrying..." && retry_count=$((retry_count - 1)) && sleep 5; \
    done && \
    [ $retry_count -gt 0 ] || exit 1

# Set up Go environment
ENV PATH="/usr/local/go/bin:$PATH"

# Verify Go installation
RUN go version
