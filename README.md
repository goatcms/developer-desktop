# developer-desktop
The project contains pre-instaled developer tools for goats' projects.

A Dockerfile / docker image created for developers environment. It contains pre-instaled the most popular programming languages like php, ruby, sass, nodejs, gulp, bower, yarn, golang. Web tools like apache2. The project contains [atom](https://atom.io/) with file-icons, go-debug, go-plus, language-docker, atom-beautify, git-plus plugins. Provide access by [VNC](https://pl.wikipedia.org/wiki/Virtual_Network_Computing) and [noVNC](https://github.com/novnc/noVNC).

## Introduction
It is based on [docker-headless-vnc-container](https://github.com/ConSol/docker-headless-vnc-container). There is description how to use vnc and novnc (webbrowser terminal).

## Build docker image 
Use this code to build devtools locally:
```
git clone https://github.com/goatcms/developer-desktop
cd developer-desktop
docker build -t spozoga/goatcms-developer-desktop .
```

## Run devtools
Recomended way to run devtools:
```bash
docker run -it --rm -p 5901:5901 -p 6901:6901 -p 80:80 -e VNC_RESOLUTION=1600x900 -e VNC_COL_DEPTH=24 -e VNC_PW=pass123 --cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH -v goathome:/headless/ -v mywww:/var/www spozoga/goatcms-developer-desktop
```

## VNC client
Recomended open source client is [TigerVNC](http://tigervnc.org/). Make Windows and Linux working together.
![Windows and linux on one laptop](https://raw.github.com/SebastianPozoga/docker-desktop-devtools/master/screenshots/desktop.jpg)

## Add shared directory (via SMB)
You must run docker container with extra parameteris like:
```
docker run ... \
  --cap-add SYS_ADMIN \
  --cap-add DAC_READ_SEARCH \
 spozoga/devtools
```
And add your mount script to "$HOME/Desktop/autorun.sh" file
```
mkdir "$HOME/Desktop/shared"
mount -t cifs -o username=<share user>,password=<share password> //MACHINE_IP/<share name> "$HOME/Desktop/shared"
```

## Help
* [Port list](image/root/Desktop/DevToolsHelp/ports.md)

## Docker image
Use official docker hub to pull pre-build image:
https://hub.docker.com/r/spozoga/devtools/
