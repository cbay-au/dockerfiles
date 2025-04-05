#DESCRIPTION:           Create btop in a container
# AUTHOR:               Leighton <linux@clucas.au>
# COMMENTS:
#       Dockerfile builds a btop instance in a docker image within a bash shell.
# USAGE:
#       Download Dockerfile
#       wget https://raw.githubusercontent.com/cbay-au/dockerfiles/main/btop/Dockerfile
#       Build btop image
#       docker build -t btop .
#       docker run -it --name btop btop
# TODO:
#       1.check wich is the lighest FROM to use
#       2. chech line with ENV seems to be ussing a depreciated syntax




#
# docker run --rm -it \
#       --pid host \
#       jess/htop

# docker run -it --name btop btop bash
# btop --utf-force
#
FROM ubuntu:latest

RUN apt update && apt upgrade -y

# Set locale
RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN apt install btop -y

CMD ["btop"]
