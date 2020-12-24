# FTB Revelation
Feed The Beast Revelation modpack
made by Feed The Beast at https://feed-the-beast.com

Modpack for Minecraft 1.12.2.
Revelation is a general all-purpose pack that is designed for solo play as well as small and medium population servers.
This pack contains a mix of magic, tech and exploration mods, and is the largest pack ever built and released by the Feed The Beast Team.

<img src="https://apps.modpacks.ch/modpacks/art/7/revelation.png" width="338" height="338">

NOTE: In compliance with Mojang "End User License Agreement", you will need to agree to the EULA in order to run your own Minecraft server. By using this container you acknowledge the EULA! If you do not agree, then you are not permitted to use this container!
https://account.mojang.com/documents/minecraft_eula

The worldname must be the default "world". 
Settings will reset when upgrading.
Access the console to op and whitelist.

## Running Container
### Running image
```bash
docker volume create [volume name]
docker run -d -it --name=[container name] -v [volume name]:/minecraft/world -v [path to logs]:/mineecraft/log -p [host port]:25565 itachi1706/rpi-ftb:revelation-[version]
```

When upgrading sometime items have been removed and therefore you have to confirm removal.   
To do so run `docker attach [name of your container]` and type `/fml confirm` when prompted to confirm or cancel.   
Exit with `CTRL+P CTRL+Q`.   

### To access the console:
```bash
docker attach [name of container]
[Run your commands]
To exit: CTRL+P CTRL+Q
```

## Environment Variables:  
| Variable | Reason | Example |
| --- | --- | --- |
| MC_XMX | Max Memory for game | 4096M |
| MC_XMS | Min Memory for game | 1024M |
| MC_PERMGEN | Perm Gen Memory | 256M |

  

The first time the server starts it creates the server.properties file with default settings and spawns "world". 
Not recommended to change these settings by hand.

When upgrading: World reset is required when upgrading from v1/v2 to v3.0.1 or higher.
