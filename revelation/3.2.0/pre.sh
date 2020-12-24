#! /bin/sh

cp ../../linux .
chmod +x linux
rm -rf server
mkdir server
./linux 35 37 --path server
cd server
cp ../ServerStart.sh .
cp ../settings.sh .
cd ..