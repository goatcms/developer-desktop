# developer-desktop
The project contains pre-instaled developer tools for goats' projects.

## Introduction
It is based on [docker-ubuntu-vnc-desktop](https://github.com/fcwu/docker-ubuntu-vnc-desktop). There is description how to use vnc and novnc (webbrowser terminal).

## Run devtools
Build:
```bash
cd /path/to/my/developer-desktop
docker build . -t goatcms/devtools
```
Recomended way to run devtools:
```bash
docker run -it --rm -p 5900:5900 --cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH -e VNC_SCREEN=1600x900x24 -e VNC_PASSWORD=pass123 -v goathome:/root goatcms/devtools
```
Next connect via VNC and run *atom.sh*
Enjoy it.

## Add share (via SMB) directory 
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

## VNC client
Recomended open source client is [TigerVNC](http://tigervnc.org/). Make Windows and Linux working together.
![Windows and linux on one laptop](https://raw.github.com/SebastianPozoga/docker-desktop-devtools/master/screenshots/desktop.jpg)

## Help
* [Developer tools (base image)](https://github.com/SebastianPozoga/docker-desktop-devtools)
