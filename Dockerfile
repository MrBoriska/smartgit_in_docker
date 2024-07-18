FROM ubuntu:22.04

RUN apt update
RUN apt install -y git git-lfs python3-pip libswt-gtk-4-jni libswt-gtk-4-java
RUN pip3 install pre-commit

COPY smartgit-24_1-preview-9.deb .

RUN apt-get install -y ./smartgit-24_1-preview-9.deb

RUN useradd -ms /bin/bash user


USER user
#WORKDIR /home/mrboriska

CMD ["/usr/share/smartgit/bin/smartgit.sh"]