
FROM debian:bullseye-slim

LABEL maintainer="Leighton linux@clucas.au"

RUN apt-get update && \
    apt-get install -y --no-install-recommends nmap && \
    rm -rf /var/lib/apt/lists/*

# Fetch latest NSE scripts from upstream repository
RUN mkdir -p /usr/share/nmap/nselib/ && \
    echo "Updating Network Discovery Scripts..." && \
    nmap --script-updatedb

ENTRYPOINT ["/usr/bin/nmap"]

# build docker image docker build -t nmap .
# Run with docker run --rm nmap <nmap args> target
