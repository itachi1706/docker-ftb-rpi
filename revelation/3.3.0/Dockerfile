FROM alpine as getfile
WORKDIR /minecraft
ADD server .

# Download necessary files
RUN mkdir -p /minecraft/world
RUN mkdir -p /minecraft/logs
RUN echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula)." > eula.txt && \
	echo "$(date)" >> eula.txt && \
	echo "eula=TRUE" >> eula.txt
RUN addgroup -S minecraft -g 1002 && adduser -u 1002 -S minecraft -G minecraft
RUN chmod u+x settings.sh
RUN chmod u+x ServerStart.sh
RUN chown -R minecraft:minecraft /minecraft

FROM itachi1706/rpi-ftb:jdk8-base

LABEL maintainer="kenneth@itachi1706.com"

USER root

# Copy files
COPY --chown=minecraft:minecraft --from=getfile /minecraft/ .
# RUN ls -lsh

USER minecraft

# Expose port 25565
EXPOSE 25565

# Expose volume
VOLUME ["/minecraft/world"]

# Start server
CMD ["/bin/bash", "/minecraft/ServerStart.sh"]
