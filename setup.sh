# build image from Dockerfile
podman build -t portable_box2 .
# start container from image
podman run -d -it --name test_container_a2 localhost/portable_box2

# attach as non-root user
#podman exec -it test_container_a bash
# attach as root user
#podman exec -u 0 -it test_container_a bash
