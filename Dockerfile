FROM ubuntu:latest
ADD https://www.google.com/search?q=random+number+generator&oq=random+number+&aqs=chrome.0.0i433i512j0i512l9.4955j0j9&sourceid=chrome&ie=UTF-8 tmp
ARG DEBIAN_FRONTEND=noninteractive
RUN whoami && apt update && apt -y install wget openjdk-11-jre-headless

RUN mkdir minecraft && cd minecraft && wget https://papermc.io/api/v2/projects/paper/versions/1.16.5/builds/794/downloads/paper-1.16.5-794.jar && mv paper-1.16.5-794.jar paper.jar && ls && cd .. && wget https://raw.githubusercontent.com/mickeydarrenlau/run-minecraft-server-container/master/eula.txt && mv eula.txt minecraft/eula.txt
WORKDIR minecraft
ENTRYPOINT java -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=20M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=8 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar  paper.jar nogui
