FROM ubuntu:latest
ADD https://www.google.com/search?q=random+number+generator&oq=random+number+&aqs=chrome.0.0i433i512j0i512l9.4955j0j9&sourceid=chrome&ie=UTF-8 tmp
RUN DEBIAN_FRONTEND=noninteractive TZ=UTC+8 apt-get -y install tzdata
RUN whoami && apt update && apt -y install wget python3-pip build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev openjdk-11-jre-headless
RUN cd /tmp && wget https://www.python.org/ftp/python/3.7.5/Python-3.7.5.tgz && tar -xf Python-3.8.3.tgz && cd python-3.8.3 && ./configure --enable-optimizations && make altinstall

