#! /bin/sh

chmod +x linux
mkdir server
./linux 35 --latest --path server
cd server
cp forge-*-universal.jar ftb.jar
cp ../ftbstart.sh .
cd ..