FROM ubuntu:22.04

# Устанавливаем locales вместе с остальными пакетами
RUN apt update && apt install -y \
    git \
    git-lfs \
    python3-pip \
    libswt-gtk-4-jni \
    libswt-gtk-4-java \
    wget \
    locales \
    && rm -rf /var/lib/apt/lists/*

# Генерируем UTF-8 локали
RUN locale-gen en_US.UTF-8 ru_RU.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN pip3 install pre-commit

ARG DEB_URL
RUN wget $DEB_URL -O ./smartgit.deb

RUN apt-get install -y ./smartgit.deb

RUN useradd -ms /bin/bash user

USER user
#WORKDIR /home/mrboriska

CMD ["/usr/share/smartgit/bin/smartgit.sh"]
