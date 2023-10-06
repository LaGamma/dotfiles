# build image from Dockerfile
podman build -t portable_box .
# start container from image
podman run -d -it --name test_container_a localhost/portable_box

# attach as non-root user
#podman exec -it test_container_a bash
# attach as root user
#podman exec -u 0 -it test_container_a bash
#
# run and mount X11 socket for local display forwarding
#podman run -dit -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:rw --net=host --name my_box localhost/portable_box
# enable X11 forwarding - (may need to do this with `xauth add <host>` inside the container)
#podman cp .Xauthority test_container_a:/home/underpriv/.Xauthority
