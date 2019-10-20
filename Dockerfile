FROM debian:buster
RUN echo "deb http://deb.debian.org/debian buster-updates main" > /etc/apt/sources.list
RUN echo "deb http://deb.debian.org/debian buster main non-free" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y software-properties-common wget apt-utils gnupg  gnupg2
RUN wget -qO - https://dl.winehq.org/wine-builds/winehq.key | apt-key add -
RUN apt-add-repository https://dl.winehq.org/wine-builds/debian/
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install --assume-yes winehq-stable lib32gcc1 curl
ENV DISPLAY :0
ENV PATH=$PATH:/opt/wine-stable/bin
