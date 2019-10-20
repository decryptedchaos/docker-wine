FROM debian:jessie
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install --no-install-recommends --assume-yes wine lib32gcc1 steamcmd 
ENV DISPLAY :0
