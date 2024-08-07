#!/bin/bash

docker rm smartgit
docker rmi smartgit
docker build . --no-cache -t smartgit
xhost +local:docker
docker run \
    -e DISPLAY=$DISPLAY \
    --privileged \
    --mount type=bind,src=$SSH_AUTH_SOCK,target=$SSH_AUTH_SOCK \
    -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /dev/dri:/dev/dri \
    -v /home/$USER:/home/$USER \
    -v /home/$USER/.ssh:/home/user/.ssh \
    -v /home/$USER/.gitconfig:/home/user/.gitconfig \
    --name smartgit smartgit

rm $HOME/.local/share/applications/smartgit.desktop
desktop-file-install smartgit.desktop --dir=$HOME/.local/share/applications
