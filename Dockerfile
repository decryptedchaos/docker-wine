FROM debian:buster
RUN echo "deb http://deb.debian.org/debian buster-updates main" > /etc/apt/sources.list
RUN echo "deb http://deb.debian.org/debian buster main non-free" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y software-properties-common wget apt-utils gnupg  gnupg2
RUN wget -qO - https://dl.winehq.org/wine-builds/winehq.key | apt-key add -
RUN apt-add-repository https://dl.winehq.org/wine-builds/debian/
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install --assume-yes winehq-stable lib32gcc1 curl xvfb winbind


ENV DISPLAY :0
ENV PATH=$PATH:/opt/wine-stable/bin

ENV         DEBIAN_FRONTEND noninteractive
ENV         USER_NAME container
ENV         WINEDEBUG=-all

USER        container
ENV         HOME /home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]


