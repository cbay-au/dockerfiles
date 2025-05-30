# Multi-Stage Build: Download the script in a separate stage
FROM debian:bookworm-slim AS downloader

RUN apt-get update && \
    echo "Installing curl..." && \
    apt-get install -y --no-install-recommends curl && \
    echo "Installing ca-certificates..." && \
    apt-get install -y --no-install-recommends ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Download the NordVPN installation script
RUN curl -O https://downloads.nordcdn.com/apps/linux/install.sh

# Multi-Stage Build: Install NordVPN in the final stage
FROM debian:bookworm-slim

COPY --from=downloader /install.sh /tmp/install.sh

# Install necessary packages and NordVPN
RUN apt-get update && \
    echo "Installing bash..." && \
    apt-get install -y --no-install-recommends bash && \
    echo "Installing curl..." && \
    apt-get install -y --no-install-recommends curl && \
    echo "Installing wget..." && \
    apt-get install -y --no-install-recommends wget && \
    echo "Installing nano..." && \
    apt-get install -y --no-install-recommends nano && \
    echo "Installing nmap..." && \
    apt-get install -y --no-install-recommends nmap && \
    echo "Installing build-essential..." && \
    apt-get install -y --no-install-recommends build-essential && \
    echo "Installing ca-certificates..." && \
    apt-get install -y --no-install-recommends ca-certificates && \
    echo "Installing autoconf..." && \
    apt-get install -y --no-install-recommends autoconf && \
    echo "Installing automake..." && \
    apt-get install -y --no-install-recommends automake && \
    echo "Installing libtool..." && \
    apt-get install -y --no-install-recommends libtool && \
    echo "Installing prips..." && \
    apt-get install -y --no-install-recommends prips && \
    echo "Installing iproute2..." && \
    apt-get install -y --no-install-recommends iproute2 && \
    echo "Installing apt-utils..." && \
    apt-get install -y --no-install-recommends apt-utils && \
    rm -rf /var/lib/apt/lists/*

# Install NordVPN
RUN  yes | bash -c "chmod +x /tmp/install.sh && /tmp/install.sh"

# Create an entrypoint script to start the NordVPN service
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
