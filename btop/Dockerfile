#DESCRIPTION:           Create btop in a container
# AUTHOR:               Leighton <linux@clucas.au>
# COMMENTS:
#       Dockerfile builds a btop instance in a docker image within a bash shell.
# USAGE:
#       Download Dockerfile
#       wget https://raw.githubusercontent.com/cbay-au/dockerfiles/main/btop/Dockerfile
#       Build btop image
#       docker build -t btop .
#       docker run -it --name btop btop:latest bash
#	docker run -it -d --name btop btop:latest /bin/bash
#	btop --utf-force
#       test with <??>
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
LABEL maintainer="Leighton Clucas"

RUN apt -y update && apt-get -y upgrade
RUN apt install btop

CMD [ "btop" ]
