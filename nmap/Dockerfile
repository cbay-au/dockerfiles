
FROM debian:bullseye-slim

LABEL maintainer="Your Name <your.email@example.com>"

RUN apt-get update && \
    apt-get install -y --no-install-recommends nmap && \
    rm -rf /var/lib/apt/lists/*

# Fetch latest NSE scripts from upstream repository
RUN mkdir -p /usr/share/nmap/nselib/ && \
    echo "Updating Network Discovery Scripts..." && \
    nmap --script-updatedb

ENTRYPOINT ["/usr/bin/nmap"]
