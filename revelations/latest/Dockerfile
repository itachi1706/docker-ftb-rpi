FROM alpine as getfile
WORKDIR /minecraft
ADD server .

# Download necessary files
RUN mkdir -p /minecraft/world
RUN echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula)." > eula.txt && \
	echo "$(date)" >> eula.txt && \
	echo "eula=TRUE" >> eula.txt
RUN addgroup -S minecraft -g 1002 && adduser -u 1002 -S minecraft -G minecraft
RUN chmod u+x start.sh

FROM arm32v7/openjdk:8-jre-slim

MAINTAINER Kenneth (kenneth@itachi1706.com)

# Updating container
RUN apt-get update && \
	apt-get install apt-utils --yes && \
	apt-get upgrade --yes --allow-remove-essential && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# Setting workdir
WORKDIR /minecraft

# Changing user to root
USER root

# Create user and fix permissions
RUN useradd -m -U minecraft

# Copy files
COPY --chown=minecraft:minecraft --from=getfile /minecraft/ .
# RUN ls -lsh

USER minecraft

# Expose port 25565
EXPOSE 25565

# Expose volume
VOLUME ["/minecraft/world"]

# Start server
CMD ["/bin/bash", "/minecraft/ftbstart.sh"]
