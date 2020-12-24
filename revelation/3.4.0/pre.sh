#! /bin/sh

cp ../../linux .
chmod +x linux
rm -rf server
mkdir server
./linux 35 174 --path server
cd server
cp ../ServerStart.sh .
cp ../settings.sh .
cd ..