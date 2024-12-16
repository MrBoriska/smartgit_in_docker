FROM ubuntu:22.04

ARG DEB_URL

RUN apt update
RUN apt install -y git git-lfs python3-pip libswt-gtk-4-jni libswt-gtk-4-java wget
RUN pip3 install pre-commit

RUN wget $DEB_URL -O ./smartgit.deb

RUN apt-get install -y ./smartgit.deb

RUN useradd -ms /bin/bash user

USER user
#WORKDIR /home/mrboriska

CMD ["/usr/share/smartgit/bin/smartgit.sh"]
