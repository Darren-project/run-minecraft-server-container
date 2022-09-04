FROM ubuntu:latest
ADD https://www.google.com/search?q=random+number+generator&oq=random+number+&aqs=chrome.0.0i433i512j0i512l9.4955j0j9&sourceid=chrome&ie=UTF-8 tmp
ARG DEBIAN_FRONTEND=noninteractive
RUN whoami && apt update && apt -y install wget openjdk-11-jre-headless

RUN ls && cd minecraft && wget https://api.purpurmc.org/v2/purpur/1.16.5/1171/download && mv download server.jar && ls && cd .. && wget https://raw.githubusercontent.com/mickeydarrenlau/run-minecraft-server-container/master/eula.txt && mv eula.txt minecraft/eula.txt
WORKDIR minecraft
ENTRYPOINT java -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -Xmx500M -Xms500M -jar  server.jar nogui
