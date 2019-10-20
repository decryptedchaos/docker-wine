FROM debian:wheezy
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install --no-install-recommends --assume-yes wine
ENV DISPLAY :0
