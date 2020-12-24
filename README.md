# FTB RPi Docker Images
![Generate Docker Images](https://github.com/itachi1706/docker-ftb-rpi/workflows/Generate%20Docker%20Images/badge.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/itachi1706/rpi-ftb) ![Docker Stars](https://img.shields.io/docker/stars/itachi1706/rpi-ftb)  


These are RPi supported images for running various Feed The Beast modpacks by the FTB Team at https://feed-the-beast.com  
Images can be found at [Docker Hub](https://hub.docker.com/r/itachi1706/rpi-ftb)

<img src="https://feed-the-beast.com/img/logo_ftb.b4292827.png" width="338" height="338">

## Docker Images
The images generated are multi-arch Docker images to support various architectures:
| Architecture | For Devices |
| --- | --- |
| linux/amd64 | x86_64 Devices/Servers |
| linux/arm/v7 | armhf devices like the RPi 3B+ and below (32-bit) |
| linux/arm64 | ARM64 devices such as the RPI 4 with a supported 64-bit OS, Apple M1 devices or AWS Graviton EC2 instances |

## Supported Modpacks and versions
* [FTB Revelation](./revelation) - All versions
