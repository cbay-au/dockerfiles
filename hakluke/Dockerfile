#DESCRIPTION:	  	Create a container containing the hacking tools authored by Hakluke
# AUTHOR:		Leighton <linux@clucas.au>
# COMMENTS:
#	Dockerfile builds a golang docker image within a bash shell contining:-
#		- hakrawler
# USAGE:
#	Download Dockerfile
#	wget https://raw.githubusercontent.com/cbay-au/dockerfiles/main/hakluke/Dockerfile
#	Build golang image
#	docker build -t golang .
# 	docker run -it golang:latest bash
# 	test with <go version> 
# TODO:
# 	1.check wich is the lighest FROM to use	
#	2. chech line with ENV seems to be ussing a depreciated syntax
#	3. add API kety for haktrails

#FROM ubuntu:latest
FROM debian:bookworm-slim

# Update and install necessary packages
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  bash \
  curl \
  wget \
  git \
  nano \
  build-essential \
  ca-certificates \
  autoconf \
  automake \
  libtool \
  prips \
 # --no-install-recommends && \
 && rm -rf /var/lib/apt/lists/*

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

RUN go install github.com/hakluke/hakrawler@latest
ENV PATH="~/go/bin/:$PATH"

# Clean up
RUN rm -rf prips_1.0.8* /var/lib/apt/lists/*

# Install Hakluke Repo's  
RUN go install github.com/hakluke/hakrawler@latest  
RUN go install github.com/hakluke/hakrevdns@latest  
RUN go install github.com/hakluke/haklistgen@latest  
RUN go install github.com/hakluke/hakoriginfinder@latest
RUN go install github.com/hakluke/hakcheckurl@latest
RUN go install -v github.com/hakluke/haktrails@latest
RUN go install github.com/hakluke/haktldextract@latest
RUN go install github.com/hakluke/hakip2host@latest
#RUN go install github.com/hakluke/hakfindinternaldomains
RUN go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Verify Go installation
RUN go version
