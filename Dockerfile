FROM debian:jessie
RUN echo "deb http://mirrors.linode.com/debian jessie main non-free" > /etc/apt/sources.list
RUN echo "deb-src http://mirrors.linode.com/debian stretch main non-free" > /etc/apt/sources.list
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install --no-install-recommends --assume-yes wine lib32gcc1 steamcmd curl 
ENV DISPLAY :0



