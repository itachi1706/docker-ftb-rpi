FROM itachi1706/rpi-ftb:jdk8-base

MAINTAINER Kenneth (kenneth@itachi1706.com)

# Changing user to root
USER root

# Updating container
RUN apt-get update && \
	apt-get install wget unzip --yes && \
	apt-get upgrade --yes --force-yes && \
	apt-get clean && \ 
	rm -rf /var/lib/apt/lists/* 

# Setting workdir
WORKDIR /minecraft

# Creating user and downloading files
RUN mkdir -p /minecraft/world && \
	wget --no-check-certificate -q https://media.forgecdn.net/files/2570/163/FTBRevelationServer_2.0.0.zip && \
	unzip FTBRevelationServer_2.0.0.zip && \
	rm FTBRevelationServer_2.0.0.zip && \
	chmod u+x FTBInstall.sh ServerStart.sh && \
	echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula)." > eula.txt && \
	echo "$(date)" >> eula.txt && \
	echo "eula=TRUE" >> eula.txt && \
	chown -R minecraft:minecraft /minecraft
USER minecraft

# Running install
RUN /minecraft/FTBInstall.sh

# Expose port 25565
EXPOSE 25565

# Expose volume
VOLUME ["/minecraft/world"]

# Start server
CMD ["/bin/bash", "/minecraft/ServerStart.sh"]
