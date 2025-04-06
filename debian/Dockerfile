#DESCRIPTION:           Create Golang in a container
# AUTHOR:               Leighton <linux@clucas.au>
# COMMENTS:
#       Dockerfile builds a golang docker image within a bash shell.
# USAGE:
#       Download Dockerfile
#       wget https://raw.githubusercontent.com/cbay-au/dockerfiles/main/golang/Dockerfile
#       Build golang image
#       docker build -t golang .
#       docker run -it golang:latest bash
#       test with <go version>
# TODO:
#       1.check wich is the lighest FROM to use
#       2. chech line with ENV seems to be ussing a depreciated syntax

#FROM ubuntu:latest
FROM debian:bookworm-slim

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

# RUN git clone https://github.com/gr33n37/gr33n37-ip-changer.git \

#	cd gr33n37-ip-changer

#ENTRYPOINT [ "traceroute" ]
