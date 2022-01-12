FROM ubuntu:latest
ADD https://www.google.com/search?q=random+number+generator&oq=random+number+&aqs=chrome.0.0i433i512j0i512l9.4955j0j9&sourceid=chrome&ie=UTF-8 tmp
ARG DEBIAN_FRONTEND=noninteractive
RUN whoami && apt update && apt -y install wget python3-pip build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev openjdk-11-jre-headless
RUN cd /tmp && wget https://www.python.org/ftp/python/3.8.3/Python-3.8.3.tgz && tar -xvf Python-3.8.3.tgz && echo Running-ls && ls && cd Python-3.8.3 && ./configure --enable-optimizations && make altinstall
RUN mkdir minecraft && cd minecraft && wget https://papermc.io/api/v1/paper/1.16.5/latest/download && ls
