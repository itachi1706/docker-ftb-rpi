#!/bin/bash
# 32-bit
MaxMem=${MC_XMX:-4096M}
MinMem=${MC_XMS:-1024M}

echo "Do you agree to the Mojang EULA available at https://account.mojang.com/documents/minecraft_eula ?"
EULA=`read  -n 1 -p "[y/n] "`
if [ "$EULA" = "y" ]; then
    echo "eula=true" > eula.txt
fi
java -server -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -Xmx$MC_XMX -Xms$MC_XMS -jar ftb.jar nogui