
# Ref:- https://support.nordvpn.com/hc/en-us/articles/20465811527057-How-to-build-the-NordVPN-Docker-image

# DESCRIPTION:          nordvpn & basic network tools in a container
# AUTHOR:               Leighton <linux@clucas.au>
# COMMENTS:
#       Dockerfile builds a  docker image within a bash shell.
# USAGE:
#       Download Dockerfile
#       	wget https://raw.githubusercontent.com/cbay-au/dockerfiles/main/nordvpn/Dockerfile
#       Build golang image
#       	docker build -t nvpn .
#	Run Image
#		 docker run -it --hostname nvpn --cap-add=NET_ADMIN --sysctl net.ipv6.conf.all.disable_ipv6=0 nvpn
#	Login
#		nordvpn login --token e9f2abc22f8<need to get own token>
#       	nordvpn connect
# TODO:
#       1.check wich is the lighest FROM to use
#       2. chech line with ENV seems to be ussing a depreciated syntax


FROM ubuntu:24.04
# Install necessary packages in a single command to reduce layers
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
        apt-transport-https \
        ca-certificates \
        curl \
        nano \
        nmap \
        build-essential \
        autoconf \
        automake \
        libtool \
        prips \
        systemd \
        iproute2 \
        apt-utils && \
    # Add NordVPN repository
    wget -qO /etc/apt/trusted.gpg.d/nordvpn_public.asc https://repo.nordvpn.com/gpg/nordvpn_public.asc && \
    echo "deb https://repo.nordvpn.com/deb/nordvpn/debian stable main" > /etc/apt/sources.list.d/nordvpn.list && \
    apt-get update && \
    # Install NordVPN
    apt-get install -y --no-install-recommends nordvpn && \


    # Clean up
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Fetch latest NSE scripts from upstream repository
RUN mkdir -p /usr/share/nmap/nselib/ && \
    echo "Updating Network Discovery Scripts..." && \
    nmap --script-updatedb


# Create a script to run on container start
COPY entrypoint.sh /entrypoint.sh
COPY README /READMEto
#COPY ~/home/leigh/.env /.env
RUN echo "$NORDVPN_TOKEN" >> /entrypoint.sh
RUN chmod +x /entrypoint.sh


ENTRYPOINT /etc/init.d/nordvpn start && sleep 5 && /bin/bash -c "$@" && /entrypoint.sh
CMD bash




