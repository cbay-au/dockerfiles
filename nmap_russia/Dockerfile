FROM debian:bullseye-slim

LABEL maintainer="Leighton linux@clucas.au"

RUN apt-get update && \
    apt-get install -y --no-install-recommends nmap iproute2 && \
    rm -rf /var/lib/apt/lists/*

# Create a script to apply iptables rule
RUN mkdir -p /etc/network/if-pre-up.d/ && \
    echo "iptables -t nat -A POSTROUTING -s 5.8.1.0/24 -j MASQUERADE" > /etc/network/if-pre-up.d/masquerade

# Set the container's internal IP address
ENV INTERNAL_IP=5.8.1.100

# Add a script to set the IP address when the container starts
RUN mkdir -p /etc/network/if-up.d/ && \
    echo "ip addr add $INTERNAL_IP/24 dev eth0" > /etc/network/if-up.d/set_ip

# Make the scripts executable
RUN chmod +x /etc/network/if-pre-up.d/masquerade /etc/network/if-up.d/set_ip

ENTRYPOINT ["/usr/bin/nmap"]
